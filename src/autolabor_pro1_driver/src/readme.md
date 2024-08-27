## 1.功能

`autolabor_driver.cpp`用于实车，主要是用于发布 `导航消息`，`剩余电量 电压`和 `电流消息` ，订阅 `控制消息(`current_twist_`)`

`sim_autolabor_driver.cpp`用于仿真

## 2.实车参数说明

### 2.1基本参数

| 参数（在代码中的变量）                      | 名称                   |
| ------------------------------------------- | ---------------------- |
| ~port_name (str, default: /dev/ttyUSB0)     | 串口名称               |
| ~odom_frame (str, default: odom)            | odom                   |
| ~base_frame (str, default: base_link)       | base_link              |
| ~baud_rate (int, default: 115200)           | 波特率                 |
| ~control_rate (int, default: 10)            | 控制频率               |
| ~sensor_rate (int, default: 5)              | 请求电池电量频率       |
| ~reduction_ratio (double, default: 1)       | 减速比                 |
| ~encoder_resolution (double, default: 1600) | 编码器的编码数         |
| ~wheel_diameter (double, default: 0.25)     | 车轮直径               |
| ~model_param_cw (double, default:0.8)       | 顺时针旋转运动模型参数 |
| ~model_param_acw (double, default:0.8)      | 逆时针旋转运动模型参数 |
| ~pid_rate (double, default:50.0)            | PID控制周期            |

### 2.2串口协议

串口协议

<table border="4">
    <tr>
        <td rowspan="2"> Header </td>
        <td rowspan="2"> Length </td>
        <td rowspan="2"> Sequence </td>
        <td colspan="5"> Payload </td>
        <td rowspan="2"> Checksum </td>
    </tr>
    <tr>
        <td> MsgID </td>
        <td colspan="4"> PARAM </td>
    </tr>
    <tr>
        <td> 55 AA </td>
        <td> 09 </td>
        <td> 00 </td>
        <td> 01 </td>
        <td> 00 04 </td>
        <td> 00 00 </td>
        <td> 00 00 </td>
        <td> 00 00 </td>
        <td> F3 </td>
    </tr>
    <tr>
        <td> 起始标志位 </td>
        <td> 有效数据的长度为9个字节 </td>
        <td> 第一个指令 </td>
        <td> 控制车轮速度指令 </td>
        <td> 左车轮 </td>
        <td> 右车轮 </td>
        <td colspan="2"> 固定不变为0 </td>
        <td> 异或校验码 </td>
    </tr>
</table>

### 2.3 车速控制

AP1下位机物理参数如下表：

| 名称               | 参数 | 说明                     |
| ------------------ | ---- | ------------------------ |
| wheel_diameter     | 0.25 | 车轮直径，单位：米       |
| encoder_resolution | 1600 | 编码器转一圈产生的脉冲数 |
| PID_RATE           | 50   | PID调节PWM值的频率       |

通常控制指令给的是线速度$v$和角速度$\omega$，需要将其转换为小车左右轮的脉冲数$p_l$,$p_r$。

$$
\begin{cases}
	p_l=\left( v_x-k\omega \right) \times p\\
	p_r=\left( v_x+k\omega \right) \times p\\
\end{cases}
$$

其中$k$表示模型参数（`model_param_cw`或者 `model_param_acw` 用于表示顺逆时针 ），$p$表示速度为 `1m/s`时每个控制周期的编码器脉冲数，其计算公式如下

$$
p=\frac{\text{减速比}\times \text{编码器分辨率}}{\pi \times \text{车轮直径}\times PID\text{控制频率}}
$$

## 3.实车代码详解

主函数部分如下，主要是初始化一个 `autolabor_driver`的节点，然后该节点运行 `driver.run`中的语句。

```C++
int main(int argc, char **argv){
  ros::init(argc, argv, "autolabor_driver");//初始化节点，名称为"autolabor_driver"
  ChassisDriver driver;
  driver.run();
  return 0;
}
```

然后看 `driver.run`中的代码，该代码内容很多，但主要是创建一个节点句柄，然后让该节点创建4个发布者对象 `advertise`用于发布消息，创建一个订阅者对象 `subscribe("/cmd_vel")`用于获取控制量。当有 `"/cmd_vel"`中有新的控制量发布时，调用回调函数 `twist_callback。`

```C++
void ChassisDriver::run(){
  ros::NodeHandle node;//创建节点句柄
  ros::NodeHandle private_node("~"); //创建名为"~"的私有节点（只能在本节点内部访问）

  private_node.param<std::string>("port_name", port_name_, std::string("/dev/ttyUSB0")); //设置私有节点参数
  private_node.param<std::string>("odom_frame", odom_frame_, std::string("odom"));
  private_node.param<std::string>("base_frame", base_frame_, std::string("base_link"));

  private_node.param<int>("baud_rate", baud_rate_, 115200);
  private_node.param<int>("control_rate", control_rate_, 10);
  private_node.param<int>("sensor_rate", sensor_rate_, 5);

  private_node.param<double>("reduction_ratio", reduction_ratio_, 2.5);
  private_node.param<double>("encoder_resolution", encoder_resolution_, 1600.0);
  private_node.param<double>("wheel_diameter", wheel_diameter_, 0.15);
  private_node.param<double>("model_param_cw", model_param_cw_, 0.78);
  private_node.param<double>("model_param_acw", model_param_acw_, 0.78);
  private_node.param<double>("pid_rate", pid_rate_, 50.0);

  private_node.param<double>("maximum_encoding", maximum_encoding_, 32.0);

  // 速度1m/s的情况下每个控制周期的脉冲数
  pulse_per_cycle_ = reduction_ratio_ * encoder_resolution_ / (M_PI * wheel_diameter_ * pid_rate_);

  if (init()){
    odom_pub_ = node.advertise<nav_msgs::Odometry>("wheel_odom", 10);//发布者对象实例化，话题和最大保存的消息数(队列)
    battery_pub_ = node.advertise<std_msgs::Int32>("remaining_battery", 1);
    current_pub_ = node.advertise<std_msgs::Float32>("current", 1);
    voltage_pub_ = node.advertise<std_msgs::Float32>("voltage",1);
    ros::Subscriber cmd_sub = node.subscribe<geometry_msgs::Twist>("/cmd_vel", 10, &ChassisDriver::twist_callback, this);//订阅控制量，回调函数
    ros::Timer send_speed_timer = node.createTimer(ros::Duration(1.0/control_rate_), &ChassisDriver::send_speed_callback, this);//定期调用来查询剩余电量
    ros::Timer ask_battery_remainder_timer = node.createTimer(ros::Duration(1.0/sensor_rate_), &ChassisDriver::ask_battery_remainder_callback, this);
    ros::Timer ask_current_timer = node.createTimer(ros::Duration(1.0/sensor_rate_), &ChassisDriver::ask_current_callback, this);
    ros::Timer ask_voltage_timer = node.createTimer(ros::Duration(1.0/sensor_rate_), &ChassisDriver::ask_voltage_callback, this);
    boost::thread parse_thread(boost::bind(&ChassisDriver::parse_msg, this));//创建新线程来解析消息
    ros::spin();
    return;
  }
}
```

查看回调函数 `twist_callback` ，用 `msg`指针指向控制数据，用互斥锁保护变量的访问，然后给设置 `last_twist_time_`为当前时间，`current_twist_` 为接收到的消息。

```C++
void ChassisDriver::twist_callback(const geometry_msgs::Twist::ConstPtr& msg){
  twist_mutex_.lock();
  last_twist_time_ = ros::Time::now();
  current_twist_ = *msg.get();
  twist_mutex_.unlock();
}
```

查看定时器触发的回调函数 `send_speed_callback`，可以为一个调速过程，根据控制指令 `current_twist_` 给出的线速度和角速度，计算发送给小车左右轮的速度。通过 `boost::asio::write` 发送到串口

```C++
void ChassisDriver::send_speed_callback(const ros::TimerEvent&){
  double left_d, right_d, radio;//左右轮运动距离，比率
  double model_param;//模型参数
  short left, right;

  double linear_speed, angular_speed;
  if ((ros::Time::now() - last_twist_time_).toSec()<=1.0){//计算线速度和角速度
    linear_speed = current_twist_.linear.x;  
    angular_speed = current_twist_.angular.z;
  }else{
    linear_speed = 0;
    angular_speed = 0;
  }

  if (angular_speed <= 0){
    model_param = model_param_cw_;
  }else{
    model_param = model_param_acw_;
  }

  left_d = (linear_speed - model_param/2 * angular_speed) * pulse_per_cycle_;
  right_d = (linear_speed + model_param/2 * angular_speed) * pulse_per_cycle_;

  radio = std::max(std::max(std::abs(left_d), std::abs(right_d)) / maximum_encoding_, 1.0);

  left = static_cast<short>(left_d / radio);
  right = static_cast<short>(right_d / radio);

  uint8_t data[14] = {0x55, 0xAA, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
  data[3] = msg_seq_++;
  data[5] = (left >> 8) & 0xff;
  data[6] = left & 0xff;
  data[7] = (right >> 8) & 0xff;
  data[8] = right & 0xff;
  check(data, 13, data[13]);
  boost::asio::write(*port_.get(), boost::asio::buffer(data, 14), ec_);
  ROS_DEBUG_STREAM("send -> left: " << left << "; right: " << right);
}
```
