import rospy
import actionlib
from assignment_2_2022.msg import PlanningAction, PlanningGoal

def main():
    client = actionlib.SimpleActionClient('/reaching_goal', PlanningAction)
    rospy.loginfo('Waiting for server to start...')
    client.wait_for_server()
    while True:
        choice = input("Please enter a position you want the robot to navigate to syntax:x,y\nif you want to cancel enter c,and to exit enter q\nyour choice:")
        if choice == 'c':
            client.cancel_goal()
            continue
        elif choice == 'q':
            break
        target = []
        for i in choice.split(','):
            target.append(float(i))
        goal = PlanningGoal()
        goal.target_pose.pose.position.x = target[0]
        goal.target_pose.pose.position.y = target[1]
        client.send_goal(goal)
        
if __name__ == '__main__':
    rospy.init_node('node_A')
    main()
    
    
    



x = float(choice)
            y = float(input("Enter the desired Y position: "))
            client.wait_for_server()
            goal = PoseStamped()	
            goal.pose.position.x = x
            goal.pose.position.y = y
            goal = assignment_2_2022.msg.PlanningGoal(goal)		
            client.send_goal(goal) 
            
            
    ]]]]]]]]]]]]]]]]]]]]]
    
    
    #!/usr/bin/env python
from __future__ import print_function
import sys    
import rospy
import actionlib
from assignment_2_2022.msg import PlanningAction, PlanningGoal
from geometry_msgs.msg import PoseStamped



def cancel():
	client.cancel_goal()
	rospy.loginfo("Goal canceled !\n")
	main()

def target():
	x = float(input("Enter the value os the x position: "))
	y = float(input("Enter the value os the Y position: "))	
	print(f'Position entered sucessefully: \n x position: {x} \n y position: {y}')	
	#wait for the server
	client.wait_for_server()	
	goal = PoseStamped()	
	goal.pose.position.x = x
	goal.pose.position.y = y
	goal = PlanningGoal(goal)		
	client.send_goal(goal) #sending a goal to the action server

def main():
    while True:
	rospy.loginfo("Enter Your choice :\n")
	rospy.loginfo("1 to send target. :\n")
	rospy.loginfo("2 to cancel target :\n")
        c= input("choice:  ")
      
        if (c == "2"):
            cancel()
        if (c == "1"):
            target()
        else:
          exit()
            
if __name__ == '__main__':
    rospy.init_node('action_client')
    client = actionlib.SimpleActionClient('/reaching_goal', PlanningAction)
    rospy.spin()
    main()
    ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
    
    
 #! /usr/local/bin/python

from __future__ import print_function
import rospy
from geometry_msgs.msg import Twist, Vector3, Point
from assignmentPackage.msg import my_msg
from nav_msgs.msg import Odometry

def callback1(msg):
    # call back function of the subscriber to /odom topic that returns the pose
    global pose
    pose = msg.pose.pose.position

def callback2(msg):
    # call back function of the subscriber to /duplicatedOdom topic that returns the angular and linear velocites.
    global vel_linear, vel_angular
    vel_linear = msg.linear
    vel_angular = msg.angular

# initializing liner and angular velocity and pose
vel_linear = Vector3()
vel_angular = Vector3()
pose = Point()

def main():
    global vel_linear, vel_angular, pose
    rospy.init_node("node_A_2") # initializing the node
    # Creating subscribers for "/odom" and "/cmd_vel" topics.
    sub = rospy.Subscriber("/odom", Odometry, callback1, queue_size=1000)
    cmd_velSub = rospy.Subscriber("cmd_vel", Twist, callback2, queue_size=1000)
    # creating publisher for "duplicatedOdom" topic.
    pub = rospy.Publisher("duplicatedOdom", my_msg, queue_size=100)
    rate = rospy.Rate(10)
    while True:
        # updating my custom message with values of linear and angular velocity and the pose.
        message = my_msg()
        message.pose = pose
        message.vel_angular = vel_angular
        message.vel_linear = vel_linear
        # publishing the customized message on the topic.
        pub.publish(message)
        rate.sleep()
        # spin once for callbacks
        rospy.spin()

if __name__ == "__main__":
    main()

