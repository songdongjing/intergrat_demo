## 小车底盘代码整体结构

`src`文件中编写底盘控制的核心代码，订阅控制指令 `"/cmd_vel"`，发布指令小车 里程计 `坐标系中的位置` `wheel_odom"`，`剩余电量"remaining_battery"`，`电流` `"current"`，`电压 "voltage"`

`msg`文件中定义核心代码中需要用到的变量左右轮编码器的值

`launch`文件中定义一键启动节点的脚本和参数设置，用过 `roslaunch driver.lauch`启动底盘控制节点

`cfg`文件中定义仿真器相关的参数设置。

`CMakeLists.txt` 配置编译规则，比如源文件，依赖项，目标文件。

`package.xml` 用于描述包信息，比如包名，版本，作者，依赖项
