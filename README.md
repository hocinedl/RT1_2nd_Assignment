# RT1_assignment2

The purpose of assignment
================================

The purpose of this assignment is to construct a ROS package for a robot simulation in Gazebo and Rviz. The package will consist of three separate nodes:

* An action client node that allows the user to specify a target location or cancel it, and also publishes the robot's position and velocity as a custom message using values from the topic /odom.
* A service node that, when activated, prints the number of goals that have been reached and cancelled.
* A node that subscribes to the robot's position and velocity using the custom message and prints the distance of the robot from the target and the robot's average speed. A parameter will be used to set the frequency of publishing the information.
* A launch file will be created to start the entire simulation, and it will also set the frequency at which the third node publishes information.



Installing
--------
Initially,it is imperative to install the xterm library prior to executing the program. Open a terminal window and execute the following command to install the xterm package. This library aids us in printing outputs of the nodes in a new terminal window::

    	sudo apt-get install xterm -y

Subsequently, go to your ROS workspace 'src' folder and duplicate this repository using the following command:

    	git clone https://github.com/sametkosum/RT1_assignment2
    
When the repository has been duplicated, proceed to the work space directory and execute the following command to construct the package:


    	catkin_make

Running
---------
First of all, we need to run the ROS master in a separete terminal:

    	roscore
            
The RT1_assignment2.launch file for the assignment can be located in the "launch" folder within the "assignment_2_2022" directory. To initiate the simulation, utilize the following command:


    	roslaunch assignment_2_2022 RT1_assignment2.launch


![Gazebo](https://user-images.githubusercontent.com/117012520/214143438-53d0393d-941e-4860-b790-d3391dddcf79.PNG)
![rviz](https://user-images.githubusercontent.com/117012520/214143844-dfa064fa-34ca-447b-b927-f48987f0a222.PNG)
![action_client](https://user-images.githubusercontent.com/117012520/214143988-4d04e925-548f-48da-8873-4a8c082de845.PNG)
![Output](https://user-images.githubusercontent.com/117012520/214144002-7d63b2dc-5178-4ae3-8fdb-3eb100433960.PNG)

     

Launch 
------------

It provide a convenient way to start up multiple nodes and a master, as well as other initialization requirements such as setting parameters.

### RT1_assignment2.launch ###

This code is a launch file written in XML, which is used to launch multiple nodes at once in the ROS (Robot Operating System) framework.

```python
<?xml version="1.0"?>
<launch>
    <include file="$(find assignment_2_2022)/launch/sim_w1.launch" />
    <param name="des_pos_x" value= "0.0" />
    <param name="des_pos_y" value= "1.0" />
    
    <!--Parameter to set the frequency the info is printed with-->
    <param name="frequency" type="double" value="1.0" />
    
    <node pkg="assignment_2_2022" type="wall_follow_service.py" name="wall_follower" />
    <node pkg="assignment_2_2022" type="go_to_point_service.py" name="go_to_point"  />
    <node pkg="assignment_2_2022" type="bug_as.py" name="bug_action_service" output="screen" />
    <node pkg="assignment_2_2022" type="ACTION_CLIENT.py" name="ACTION_CLIENT" output="screen" launch-prefix="xterm -hold -e" />
    <node pkg="assignment_2_2022" type="TARGERSERVICE.py" name="TARGETSERVICE"  />
    <node pkg="assignment_2_2022" type="OUTPUT.py" name="OUTPUT" output="screen" launch-prefix="xterm -hold -e" />
</launch>
```

The launch file does the following:

1)Includes the sim_w1.launch file from the assignment_2_2022 package, which launches the simulation environment for the robot.

2)Sets two parameters, `des_pos_x` and `des_pos_y` which are used to set the desired position of the robot.

3)Sets a parameter `frequency` which is used to set the frequency at which the information is printed.

4)Launches six nodes:
* `wall_follower` is a node that runs the `wall_follow_service.py` script, which follows a wall using a service.
* `go_to_point` is a node that runs the `go_to_point_service.py` script, which moves the robot to a desired point using a service.
* `bug_action_service` is a node that runs the `bug_as.py` script, which implements the Bug algorithm using an action server.
* `ACTION_CLIENT` is a node that runs the `ACTION_CLIENT.py` script, which is a client for the Bug algorithm action server and allows users to input target positions.
* `TARGETSERVICE` is a node that runs the `TARGETSERVICE.py` script, which is a service that tracks the number of goals reached and cancelled.
* `OUTPUT` is a node that runs the `OUTPUT.py` script, which subscribes to the `/posxy_velxy` topic, which contains information about the robot's position and velocity, and prints the distance and speed information of the robot with a specific frequency.

NODES
-----------
It is an executable program running inside your application. You will write many nodes and put them into packages.

Nodes are combined into a graph and communicate with each other using ROS topics, services, actions, etc

### 1) ACTION_CLIENT.py ###

This code is a Python script that uses the ROS (Robot Operating System) framework to control a robot. The script creates an action client that sends goals to an action server, and a subscriber that listens for odometry data from the robot.

The script does the following:

1) Imports various modules, including `rospy` for ROS functionality, `actionlib` for creating the action client, and `assignment_2_2022.msg` for the custom message types used in the script.
2) Defines the 'publisher' function, which is a callback for the odometry subscriber. This function takes in an odometry message, extracts the position and velocity data, and uses it to create a custom message of type `Posxy_velxy`. This custom message is then published.
3) Defines the `action_client` function, which creates an action client that connects to an action server at the `/reaching_goal` topic. The function then enters a loop that waits for keyboard input from the user. If the user enters `c`, the goal is cancelled. Otherwise, the user is prompted to enter the target position, which is then converted to a goal message and sent to the action server.
4) The main function initializes the ROS node, creates the publisher and subscriber, and calls the `action_client` function.

```python
#!/usr/bin/env python

import rospy
import actionlib
import actionlib.msg
import assignment_2_2022.msg
from std_srvs.srv import *
import sys
import select
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Point, Pose, Twist
from assignment_2_2022.msg import Posxy_velxy
from colorama import Fore, Style
from colorama import init
init()

def publisher(msg): # callback function for the subscriber
    global pub
    POSITION = msg.pose.pose.position # get the position from the msg
    VELOCITY = msg.twist.twist.linear# get the twist from the msg
    posxy_velxy = Posxy_velxy() # create custom message
    # assign the parameters of the custom message
    posxy_velxy.msg_pos_x = POSITION.x
    posxy_velxy.msg_pos_y = POSITION.y
    posxy_velxy.msg_vel_x = VELOCITY.x
    posxy_velxy.msg_vel_y = VELOCITY.y
    pub.publish(posxy_velxy)# publish the custom message
def action_client():
    # create the action client
    action_client = actionlib.SimpleActionClient('/reaching_goal', assignment_2_2022.msg.PlanningAction)
    # wait for the server to be started
    action_client.wait_for_server()

    status_goal = False

    while not rospy.is_shutdown():
        # Get the keyboard inputs
        print(Fore.WHITE + " Enter position of the target or type c to cancel it ")
        #print(Fore.MAGENTA + "X position of target: ")
        INPUT_XPOS = input(Fore.BLUE + "Desired X Position : ")
        #print(Fore.MAGENTA + "Y position of target: ")
        INPUT_YPOS = input(Fore.BLUE + "Desired Y Position : ")
        
 	# If user entered 'c' and the robot is reaching the goal position, cancel the goal
        if INPUT_XPOS == "c" or INPUT_YPOS == "c":
            # Cancel the goal
            action_client.cancel_goal()
            status_goal = False
        else:
            # Convert numbers from string to float
            SEND_XPOS = float(INPUT_XPOS)
            SEND_YPOS = float(INPUT_YPOS)
            # Create the goal to send to the server
            goal = assignment_2_2022.msg.PlanningGoal()
            goal.target_pose.pose.position.x = SEND_XPOS
            goal.target_pose.pose.position.y = SEND_YPOS
            action_client.send_goal(goal) # Send the goal to the action server
            status_goal = True


def main():
    
    rospy.init_node('ACTION_CLIENT') #initialize the node
    global pub  # global publisher
    pub = rospy.Publisher("/posxy_velxy", Posxy_velxy, queue_size = 1)  # publisher: send a message which contains two parameters (velocity and position) 
    sub_from_Odom = rospy.Subscriber("/odom", Odometry, publisher)  # subscriber: get from "Odom" two parameters (velocity and position)
    action_client() # call the function client

if __name__ == '__main__':
    main()
```
### The Pseudocode of ACTION_CLIENT.py : ###
-----------------

Pseudocode for the script could look like this:

```python
Initialize ROS node
Create publisher and subscriber

Define publisher callback function:
    Extract position and velocity data from odometry message
    Create custom message with the data
    Publish the custom message

Define action client function:
    Create action client and connect to action server
    Loop:
        Wait for user input
        If input is "c":
            Cancel goal
        Else:
            Convert input to goal message
            Send goal to action server

Call action client function
```

### 2) TARGETSERVICE.py ###

This code is a Python script that uses the ROS (Robot Operating System) framework to create a service that keeps track of how many goals have been reached and how many goals have been cancelled by the robot. The script creates a service that listens to the `/reaching_goal/result` topic and counts the number of goals that have been cancelled and reached.

The script does the following:

1) Imports various modules, including `rospy` for ROS functionality, `actionlib` for creating the action client, and `assignment_2_2022.msg` for the custom message types used in the script.
2) Defines a `Service` class, which has an `__init__` method that initializes the counters for goals reached and cancelled, creates the service, and subscribes to the `/reaching_goal/result` topic.
3) Defines a `result_callback` method that is called when the subscriber receives a message on the `/reaching_goal/result` topic. This method extracts the status of the result from the message and increments the appropriate counter.
4) Defines a `data` method that is called when the service is requested. This method returns a 'goal_rcResponse' message containing the current values of `TARGET_CANCELLED` and `TARGET_REACHED`.
5) The `main` function initializes the ROS node, creates an instance of the Service class, and enters a loop that waits for messages.
```python
#! /usr/bin/env python

import rospy # Import the ROS python library
from assignment_2_2022.srv import goal_rc, goal_rcResponse # Import the service and service response messages
import actionlib   # Import the actionlib library
import actionlib.msg  # Import the actionlib message library
import assignment_2_2022.msg  # Import the package message library

class Service:
    def __init__(self):
        # Initialize the counters for goals reached and cancelled
        self.TARGET_CANCELLED = 0
        self.TARGET_REACHED   = 0
        # Create the service
        self.srv = rospy.Service('TARGETSERVICE', goal_rc, self.data) 
        # Subscribe to the result topic
        self.sub_result = rospy.Subscriber('/reaching_goal/result', assignment_2_2022.msg.PlanningActionResult, self.result_callback)
    def result_callback(self, msg):
        # Get the status of the result from the msg
        status = msg.status.status
        # Goal cancelled (status = 2)
        if status == 2:
            self.TARGET_CANCELLED += 1
        # Goal reached (status = 3)
        elif status == 3:
            self.TARGET_REACHED += 1
    def data(self, req):
        # Return the response containing the current values of TARGET_CANCELLED and TARGET_REACHED
        return goal_rcResponse(self.TARGET_REACHED, self.TARGET_CANCELLED)
def main():
    # Initialize the node
    rospy.init_node('TARGETSERVICE')
    # Create an instance of the Service class
    TARGETSERVICE = Service()
    # Wait for messages
    rospy.spin()
if __name__ == "__main__":
    main()
```

#### How to find the number of goal reached or cancelled ? ####


One way to access the service is by using the rqt tool, which is a graphical user interface provided in the Robot Operating System (ROS) for debugging, analyzing and inspecting various aspects of the system. It allows users to easily view and manipulate data streams, such as topics, services, and parameters, as well as perform tasks like logging, plotting, and debugging. Additionally, rqt has a plugin system that enables developers to create custom plugins for specific tasks. With rqt, it's easy to monitor, control and debug the ROS nodes and topics.
```python
    rqt
```
To reach the Service Caller function in rqt, follow these steps:
1) Go to the "Plugins" menu
2) Select "Services"
3) Click on "Service Caller"
4) In the Service Caller window, locate the "goal_service"
5) Click the "Call" button
6) The response window will display the number of targets reached and cancelled.

Another way start the TARGETSERVICE.py service node, which displays the number of goals achieved and those that have been cancelled, use the following command:
```python
	rosservice call /TARGETSERVICE
```



### 3) OUTPUT.py ###
This code is a Python script that uses the ROS (Robot Operating System) framework to subscribe to the '/posxy_velxy' topic, which contains information about the robot's position and velocity, and to print the distance and speed information of the robot with a specific frequency.

The script does the following:

1) Imports various modules, including 'rospy' for ROS functionality, `math` for mathematical operations, `time` for timing operations, and 'Posxy_velxy' for the custom message type used in the script.
2) Defines a `PrintInfo` class, which has an `__init__` method that initializes the `F`, the publishing frequency, and `LASTTIME`, the last time the information was printed, and subscribes to the '/posxy_velxy' topic.
3) Defines a `posvel_callback` method that is called when the subscriber receives a message on the `/posxy_velxy` topic. This method uses the frequency, the current time, and the last time the information was printed to check if the information should be printed. If the information should be printed, the method gets the desired and actual positions and velocities of the robot, computes the distance and average speed, and prints the information.
4) The `main` function initializes the ROS node, creates an instance of the `PrintInfo` class, and enters a loop that waits for messages.
```python
#! /usr/bin/env python

import rospy
import math
import time
from assignment_2_2022.msg import Posxy_velxy
from colorama import init
init()
from colorama import Fore, Back, Style

class PrintInfo:

    def __init__(self):
        self.F = rospy.get_param("frequency") # Get the publish frequency parameter
        self.LASTTIME = 0 # Last time the info was printed
        # Subscriber to the position and velocity topic
        self.sub_pos = rospy.Subscriber("/posxy_velxy", Posxy_velxy, self.posvel_callback)

    def posvel_callback(self, msg):
        P = (1.0/self.F) * 1000         # Compute time period in milliseconds
        CURRRENTTIME = time.time() * 1000         # Get current time in milliseconds

        # Check if the current time minus the last printed time is greater than the period
        if CURRRENTTIME - self.LASTTIME > P:
            # Get the desired position from ROS parameters
            X_TARGET = rospy.get_param("des_pos_x")
            Y_TARGET = rospy.get_param("des_pos_y")
            # Get the actual position of the robot from the message
            robot_x = msg.msg_pos_x
            robot_y = msg.msg_pos_y
            # Compute the distance between the desired and actual positions
            DIST = round(math.dist([X_TARGET, Y_TARGET], [robot_x, robot_y]),2)
            # Get the actual velocity of the robot from the message
            vel_x = msg.msg_vel_x
            vel_y = msg.msg_vel_y           
            # Compute the average speed using the velocity components from the message
            average_speed = round(math.sqrt(vel_x**2 + vel_y**2),2)
            # Print the distance and speed information
            print(Fore.BLUE + "Distance to Target: %s [m]", DIST)
            print(Fore.RED + "The Average Speed of RoboT: %s [m/s]", average_speed)
            # Update the last printed time
            self.LASTTIME = CURRRENTTIME

def main():
    # Initialize the node
    rospy.init_node('OUTPUT')
    
    # Create an instance of the PrintInfo class
    OUTPUT = PrintInfo()
    
    # Wait for messages
    rospy.spin()

if __name__ == "__main__":
    main()
```

### 4) wall_follow_servic.py ###

This code is a ROS (Robot Operating System) node that implements a wall following algorithm. The robot uses laser scan data to detect the distance to walls on its left, right and front, and navigates accordingly. The node also includes a service that allows the user to start or stop the wall following behavior, and a callback function that is triggered when new laser scan data is received. The pseudocode for this code is:

1) Initialize node and publisher for velocity commands.
2) Define callback function for the laser scan data, which saves the distances to the walls on the left, front, and right in a dictionary, and calls the function 'take_action'
3) Define function 'take_action' which decides which action the robot should take based on the distances to the walls in the dictionary, and calls the corresponding behavior function (e.g. 'find_wall', 'turn_left', 'follow_the_wall')
4) Define behavior functions (e.g. 'find_wall', 'turn_left', 'follow_the_wall') which return velocity commands for the robot to execute.
5) Define service function 'wall_follower_switch' which allows the user to start or stop the wall following behavior.
6) Spin and wait for callbacks and service requests.
7) When new laser scan data is received, callback function is triggered and calls 'take_action' which decides which behavior to execute and sends velocity commands to the robot.
8) Service can be used to start or stop the wall following behavior.



### 5) go_to_point_service.py ###

This code is a ROS (Robot Operating System) node that implements a navigation algorithm for a robot to move to a desired position, specified by parameters 'des_pos_x' and 'des_pos_y'. The node provides a service called 'go_to_point' that can be called by other nodes to activate or deactivate the navigation algorithm.

The code uses odometry data from the robot to determine its current position and yaw (orientation) and sensor data from a laser scanner to avoid obstacles in its path. The robot's movements are controlled by publishing Twist messages to the command velocity topic.

The algorithm follows these steps:

1) Initialize the node, set global variables and get the desired position from the parameters.
2) Create a service 'go_to_point' that when called, sets the variable 'active_' to the value passed in the request and returns a message indicating success.
3) Define callbacks for the odometry and laser scan data. The odometry callback updates the robot's position and yaw variables, while the laser scan callback is not used in this node.
4) In a while loop, check if the 'active_' variable is true and if so, execute the following steps:
  If the current state is 0, call the function 'fix_yaw' to adjust the robot's yaw to point towards the desired position.
  
  If the current state is 1, call the function 'go_straight_ahead' to move the robot towards the desired position while maintaining the desired yaw, and checking for obstacles using the laser scan data.
   
  If the robot's position is close enough to the desired position, change the state to 2 and continue to maintain the position.
The final pseudocode for this algorithm is:

```python
def main():
# Initialize the node
rospy.init_node('go_to_point')
# Get the desired position from ROS parameters
desired_position_.x = rospy.get_param('des_pos_x')
desired_position_.y = rospy.get_param('des_pos_y')
#
```


### 6) bug_as.py ###

This script is written in Python and uses the ROS (Robot Operating System) framework. The script is a ROS node that implements a planning algorithm for a robot. The robot is supposed to move to a desired position while avoiding obstacles in its path. The node subscribes to the /odom topic to receive odometry information about the robot's position and orientation, and to the /scan topic to receive laser scan data about the environment.

The script starts by importing necessary libraries, then declaring and initializing global variables such as the position, yaw, desired position, regions, and state of the robot.

It then has several callback functions that update the values of position, yaw, and regions.

The script also has a change_state() function which changes the state of the robot and calls service clients to start or stop the go_to_point and wall_follower services.

The main function planning() is implemented, which takes in a goal, sets the desired position and rate of the robot, and starts a loop. In each iteration of the loop, the function checks the state of the robot, calls the appropriate service client, and sends feedback to the action client.

The function also has implemented a done() function that stops the robot's movement and sends a message to the action client that the goal is achieved.

In summary, this script is a ROS node that implements a planning algorithm for a robot. It subscribes to odometry and laser scan data, uses a state machine to navigate to a desired position while avoiding obstacles, and sends feedback to an action client. A pseudocode for the main function planning() would look like this
```python

def planning(goal):
    set desired_position to goal.target_pose.pose.position
    set rate to 20
    set success to True
    set state to 0
    while success:
        if state is 0:
            call go_to_point service with argument True
            call wall_follower service with argument False
            if distance between position and desired_position is less than dist_precision:
                set state to 1
        if state is 1:
            call go_to_point service with argument False
            call wall_follower service with argument True
            if distance between position and desired_position is less than dist_precision:
                set state to 2
        if state is 2:
            call go_to_point service with argument False
            call wall_follower service with argument False
            stop robot's movement
            send feedback to action client that goal is achieved
            set success to False
        sleep for rate
```



### Conclusion ###

A package was created featuring three different nodes in this task : the first node being an action client node that allows the user to set a target location or cancel it, and also publishes the robot's location and velocity as a custom message. The second node is a service node that prints the number of goals reached and cancelled, and the third node subscribes to the robot's position and velocity and prints the distance of the robot from the target and the robot's average speed. A launch file was also created to initiate the simulation and set the frequency of which the third node publishes information. Overall, the package illustrates the use of action clients, services, and custom messages in ROS and how they can be utilized to control a robot and monitor its performance. Possible enhancements that could be made include:

* Utilizing markers in RViz to display the target location and the robot's current location in a more comprehensible way, such as by using different colors or shapes to indicate different states (e.g. goal reached, goal cancelled).
* Including the robot's orientation in the visualization, such as by using an arrow or a 3D model of the robot to indicate the direction it is facing
* Employing Gazebo's built-in visualization tools to display the target location in the simulated environment, such as by placing a marker or a flag at the target location.
* Incorporating a path-planning algorithm to display the robot's planned path to the target, such as by using RViz's "Path" display type.
*Implementing input validation to ensure that the user can only enter integers, and not other types of input such as floating point numbers or characters. Providing feedback to the user if an invalid input is entered, such as by displaying an error message or highlighting the input field in red.
*Adding a feature to check if the input value is within a certain range or not, and if not, prompt the user to enter a value within the range
