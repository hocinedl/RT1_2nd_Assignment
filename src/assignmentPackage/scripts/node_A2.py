#!/usr/local/bin/python

from __future__ import print_function
import rospy
from assignmentPackage.msg import my_msg
from nav_msgs.msg import Odometry

#subsecriber callback function
def subscriber_callback(data):
    #declaring my custum msg
    msg = my_msg()
    # getting the current positions and velocities
    msg.vel_x = data.twist.twist.linear.x 
    msg.vel_y = data.twist.twist.linear.y
    msg.position_x = data.pose.pose.position.x 
    msg.position_y = data.pose.pose.position.y 
    #printing the data..
    rospy.loginfo(" Data received !\n %s",data)
     # declaring the publisher and the topic it will publish to..	
    pub = rospy.Publisher("position_and_velocity", my_msg, queue_size=10)
    # publishing the msg
    pub.publish(msg)
    print("Message published!")

if __name__ == "__main__":
    rospy.init_node("node_A2") # initialize the node
    #declaring and initializing the subscriber
    sub = rospy.Subscriber("/odom", Odometry, subscriber_callback)
    rospy.spin()

