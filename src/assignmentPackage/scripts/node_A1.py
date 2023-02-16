#!/usr/bin/env python
from __future__ import print_function
import sys    
import rospy
import actionlib
from assignment_2_2022.msg import PlanningAction, PlanningGoal
from geometry_msgs.msg import PoseStamped

# the function that when it is called it cancel the target.
def cancel():
    client.cancel_goal()
    rospy.loginfo("Goal canceled !\n")
    #main()

#the function that send the robot to the target.
def target():
#asking the user to enter the target (x and Y ).
    x = float(input("Enter the value os the x position: "))
    y = float(input("Enter the value os the Y position: "))    
    print(f'Position entered successfully: \n x position: {x} \n y position: {y}')    
    #wait for the server
    client.wait_for_server()  
    #initializing the goal  
    goal = PoseStamped()    
    goal.pose.position.x = x
    goal.pose.position.y = y
    #setting the goal, using the desired x,y of the user.
    goal = PlanningGoal(goal) 
    #sending the goal       
    client.send_goal(goal) #sending a goal to the action server

def main():
    while True:
        rospy.loginfo("Enter Your choice :\n")
        rospy.loginfo("1 to send target. :\n")
        rospy.loginfo("2 to cancel target :\n")
        c= input("choice:  ")
        
        if (c == "2"):
            cancel()
        elif (c == "1"):
            target()
        else:
            exit()

if __name__ == '__main__':
	#node initialization
    rospy.init_node('action_client')
    	#client initialization and setting the server we want to send him request.
    client = actionlib.SimpleActionClient('/reaching_goal', PlanningAction)
    main()
    rospy.spin()
    

