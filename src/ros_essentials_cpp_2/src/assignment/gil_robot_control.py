#! /usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import math
import time
from std_srvs.srv import Empty
import numpy as np

x=0
y=0
z=0
yaw=0
msg_num = 0
velocity_publisher = None
direction = 1
inc = 1

#5.54
target_x, target_y = 9, 2
 

def poseCallback(pose_message):
    global x, target_x, target_y
    global y, z, yaw
    global msg_num, velocity_publisher, direction, inc
    
    x= pose_message.x
    y= pose_message.y
    yaw = pose_message.theta
    #msg_num = msg_num + 1
    
    new_linear_velocity = 0
    new_angular_velocity = 0

    dx =  target_x - x
    dy =  target_y - y
    distance = np.sqrt(dy*dy+dx*dx)
    
    angle_to_target_deg = 180*np.arctan(np.abs(dy/dx))/np.pi
    print('Pre {}'.format(angle_to_target_deg))
    if dx > 0 and dy > 0:
        angle_to_target_deg = angle_to_target_deg
    if dx < 0 and dy > 0:
        angle_to_target_deg = 180 - angle_to_target_deg
    if dx < 0 and dy < 0:
        angle_to_target_deg = 180 + angle_to_target_deg
    if dx > 0 and dy < 0:
        angle_to_target_deg = 360 - angle_to_target_deg
    
    print('Post {}'.format(angle_to_target_deg))
    yaw_angle = (yaw/np.pi)*180
    if yaw_angle < 0:
        yaw_angle = 360+yaw_angle

    desired =  angle_to_target_deg
    diff = desired - yaw_angle
    
    new_linear_velocity = distance*0.2 + 0.5
    new_angular_velocity = diff*0.02

    if distance < 0.1:
        new_linear_velocity = 0
        target_x, target_y = 5.45,5.45

    #print('{},{},{}'.format(x,y,yaw))
    
    velocity_message = Twist()
    velocity_message.linear.x = new_linear_velocity
    velocity_message.angular.z = new_angular_velocity
        
    #print ('x = {}'.format(pose_message.x)) #new in python 3
    #print ('y = %f' %pose_message.y) #used in python 2
    #print ('yaw = {}'.format(pose_message.theta)) #new in python 3
    velocity_publisher.publish(velocity_message)

'''
def poseCallback2(pose_message):
    global x
    global y, z, yaw
    global msg_num, velocity_publisher, direction, inc
    x= pose_message.x
    y= pose_message.y
    yaw = pose_message.theta

    msg_num = msg_num + 1
    

    if msg_num%1 == 0:
        # x is between 0 and 11
        #print(x)
        
        if direction == 1 and x > 10:
            inc = -1
            direction = -1
        if direction == -1 and x < 0.1:
            inc = 1
            direction = 1

        velocity_message = Twist()
        velocity_message.linear.x += inc
        velocity_publisher.publish(velocity_message)
    

            

    if msg_num > 100000:
        rospy.signal_shutdown('Ended')
        velocity_message = Twist()
        velocity_message.linear.x = 0
        velocity_publisher.publish(velocity_message)
    #print ('x = {}'.format(pose_message.x)) #new in python 3
    #print ('y = %f' %pose_message.y) #used in python 2
    #print ('yaw = {}'.format(pose_message.theta)) #new in python 3

'''

if __name__ == '__main__':
    try:
        
        #give the controller a name
        rospy.init_node('gil_robot_control', anonymous=True)

        #declare velocity publisher. Publish velocity commands
        cmd_vel_topic='/turtle1/cmd_vel'
        velocity_publisher = rospy.Publisher(cmd_vel_topic, Twist, queue_size=10)
        
        #sub
        position_topic = "/turtle1/pose"
        pose_subscriber = rospy.Subscriber(position_topic, Pose, poseCallback) 
        time.sleep(2)
        
        print ('start reset: ')
        rospy.wait_for_service('reset')
        reset_turtle = rospy.ServiceProxy('reset', Empty)
        reset_turtle()
        print ('end reset: ')
        
        rospy.spin()
       
    except rospy.ROSInterruptException:
        rospy.loginfo("node terminated.")