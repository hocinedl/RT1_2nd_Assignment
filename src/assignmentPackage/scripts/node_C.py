#! /usr/bin/env python3

import rospy
import assignment_2_2022.msg
import math
import nav_msgs.msg
import actionlib

from assignmentPackage.msg import my_msg

#declaring variables..
dis = 0.0
vel = 0.0
init_time = 0.0
final_time = 0.0

def callback1(data):
    global init_time, dis
    # get the desired 'x' and 'y' positions
    position_x = rospy.get_param("/des_pos_x")
    position_y = rospy.get_param("/des_pos_y")

    # current 'x' and 'y' positions
    x = data.position_x
    y = data.position_y
    init_time = rospy.Time.now() # get the time at the current time
	
    # compute the distance to the goal 
    x_dist = position_x - x
    y_dist = position_y - y
    dis = math.sqrt((x_dist ** 2) + (y_dist ** 2))


def callback2(data):
    global final_time, init_time, dis, vel
    if (data.status.status == 3): # when the robot reaches the goal
        final_time = rospy.Time.now() # get the time 
        # compute the current velocity
        time = (final_time - init_time).to_sec()
        vel = dis / time # compute the velocity
    print(f"The distance to the goal is {dis} \nThe average speed of the robot is {vel}")


if __name__ == "__main__":
    rospy.init_node("node_C") # initialize the node
    # subscribing to the topic position & vel which we are publishing to in node A2.
    rospy.Subscriber("position_and_vel", my_msg, callback1)
    # subscribing to the topic /reaching_goal
    rospy.Subscriber('/reaching_goal/result', assignment_2_2022.msg.PlanningActionResult, callback2)
    rospy.spin()
