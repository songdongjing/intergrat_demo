#!/usr/bin/env python
import sys,select,tty,termios
import rospy
from std_msgs.msg import String




if __name__ == '__main__':
    key_pub=rospy.Publisher('keys', String,queue_size=1)#在“keys”中发布按键
    rospy.init_node("keyboard_driver")#初始化节点
    rate=rospy.Rate(100)
    old_attr=termios.tcgetattr(sys.stdin)#获取键盘输入
    tty.setcbreak(sys.stdin.fileno())#
    print("Publishing keystrol")
    while not rospy.is_shutdown():
        if select.select([sys.stdin], [], [],0)[0]==[sys.stdin]:
            key_pub.publish(sys.stdin.read(1))
        rate.sleep()
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, old_attr)