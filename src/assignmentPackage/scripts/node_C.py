#! /usr/local/bin/python

from __future__ import print_function
import rospy,math,time

from assignment_2_2022.msg import PlanningActionGoal,PlanningGoal
from actionlib_msgs.msg import GoalStatusArray
from assignmentPackage.msg import my_msg as my_message
from geometry_msgs.msg import Point

goal = PlanningGoal()
my_msg = my_message()
status = 0
tmp = 0
start = 0
startingPose = Point()

def callback1(msg):
    global my_msg
    my_msg = msg
def callback2(msg):
    global goal,startingPose,start
    goal = msg.goal
    startingPose.x = my_msg.position_x
    startingPose.y = my_msg.position_y
    start = time.perf_counter()
def callback(msg):
    global status,tmp,end,startingPose
    if (len(msg.status_list)>0):
        status= msg.status_list[0].status
    if(status==3):
        if status !=tmp:
            end = time.perf_counter()
            duration = (end-start)
            distanceTraveled = math.sqrt((my_msg.position_x - startingPose.x)**2 + (my_msg.position_y - startingPose.y)**2)
            avgspeed = distanceTraveled/duration
            print("duration is ",duration," distance is ",distanceTraveled," avg speed ",avgspeed)
    tmp = status

def main():
    rospy.init_node("subscriber")
    odomSub = rospy.Subscriber("/position_and_velocity",my_message,callback1,queue_size=1000)
    goalSub = rospy.Subscriber("/reaching_goal/goal",PlanningActionGoal,callback2,queue_size=1000)
    statusSub = rospy.Subscriber("/reaching_goal/status",GoalStatusArray,callback,queue_size=1000)
    rospy.loginfo("starting the loop")
    rospy.spin()
        
if __name__ == "__main__":
    main()
