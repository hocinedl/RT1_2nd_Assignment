#! /usr/local/bin/python
import rospy
from assignmentPackage.srv import my_service, my_serviceResponse
import actionlib
import actionlib.msg
import assignment_2_2022.msg

# initializing the count for canceled and reached goals
count_canceled = 0 
count_reached = 0 

def callback1_sub(msg):
    global count_canceled, count_reached
    state = msg.status.status
    if state == 2:
        count_canceled += 1
        print("Number of goal canceled is {:.1f}".format(count_canceled))
    elif state == 3:
        count_reached += 1
        print("Number of goal canceled is {:.1f}".format(count_reached))

def callback2_srv(req):
    global count_canceled, count_reached
    rospy.loginfo("Number of goal canceled is {:.1f} and Number of goal reached is {:.1f}".format(count_canceled, count_reached))
    return my_serviceResponse()

if __name__ == "__main__":
    rospy.init_node('node_B') # initializing the node.
    # subscribing to the topic /reaching goal/result callback..
    sub = rospy.Subscriber('/reaching_goal/result_callback', assignment_2_2022.msg.PlanningActionResult, callback1_sub)
    # creating a service server.
    srv = rospy.Service('statuofgoal', my_service, callback2_srv) 
    rospy.spin() # spin to handle callbacks

