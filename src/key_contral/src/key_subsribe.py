#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
key_mapping = {
    'w':[0,0.2],'x':[0,-1],
    'a':[0.5,0],'d':[-0.5,0],
    's':[0,-0.2]
}
g_last_twist=None
def keys_cb(msg,twist_pub):
    if len(msg.data)==0 or not msg.data[0] in key_mapping:
        return
    vels=key_mapping[msg.data[0]]
    t=Twist()
    t.angular.z=vels[0]
    t.linear.x=vels[1]
    twist_pub.publish(t)
if __name__ == '__main__':
    rospy.init_node("keys_to_twist")#初始化节点
    twist_pub=rospy.Publisher('cmd_vel', Twist,queue_size=1)#在“cmd_vel”中发布运动指令
    rospy.Subscriber('keys', String,keys_cb,twist_pub)#在"keys"订阅案件信息
    rate=rospy.Rate(10)#速率
    g_last_twist=Twist()#生成控制指令数据
    while not rospy.is_shutdown():
        twist_pub.publish(g_last_twist)
        rate.sleep()