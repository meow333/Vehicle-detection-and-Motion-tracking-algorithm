Vehicle-detection-and-Motion-tracking-algorithm
===============================================

ABSTRACT
========
Due to increase in number of vehicles, expressways, highways; roads are getting overcrowded. The frequent traffic jams at major junctions call for an efficient traffic management system in place. For the traffic management, vehicle velocity detection, tracking and counting is very important for military, civilian and government applications, such as highway monitoring, traffic planning, toll collection and traffic flow. A vehicle tracking and grouping algorithm is presented in this work using sparse optical flow method of Lukas-Kanade Tracking technique. A system is developed to gather useful information from stationary cameras for detecting moving objects in digital videos. To improve efficiency, every frame of the sequence is down-sampled. For every frame a background subtraction is done and only the foreground pixels inside the detection zone are kept aside; features will be specified only for these pixels, grouped and tracked until the vehicle leaves the detection zone, we also store the amount of vehicles that had entered the zone along with their directional vector. Our experiments on several real traffic video sequences demonstrate good results for our foreground object detection, tracking and vehicle detection approaches.

PROBLEM STATEMENT
=================
For many years, many video surveillance system implemented template or pattern matching to track the moving object. The main reason for implementing template or pattern matching to perform object tracking is because this method requires less resource than optical flow motion tracking. Simple template or pattern matching operation can produce acceptable result in object tracking. However, template or pattern matching requires sample of pattern or template before it can track any object. Object tracking can be difficult if the surface of the object do not remain same from frame to frame, such as reflection of light.

MOTIVATION
==========
Optical flow has varieties types of algorithms, and the very famous among them is Lucas-Kanade (LK) method. Originally proposed in 1981 (Lucas and Kanade, 1981), optical flow can compute the motion and its flow and producing quite accurate results theoretically. Yet, very few of traffic surveillance system implement this method, as optical flow was not easy to be implemented, and requires special optimized and designed system. Still, the accuracy of optical flow, and the theory behind make it a considerable and arguable solution for motion tracking. Fortunately, a numbered of research and improvements on optical flow has been made. Therefore it would be necessary to re-evaluate its practicability and performance, which is one of the objectives in this research project. OpenCV is becoming widely known in computer vision field for its library that mainly built for computer vision computation. Another notable feature is the library is cross-platform, which is usable in Windows, Linux and MacOS. Such high portability reduces burdens and works if port of system is needed. Nowadays, OpenCV has huge collection of popular computer vision computation algorithm, and optical flow is one of them.

OBJECTIVES
===========
The objectives of this project are:

1. To evaluate and assess the practicability and ability of OpenCV libraries in traffic monitoring system implementation.
2. To introduce optical flow into traffic monitoring system to track vehicular movements.
3. To develop a prototype of vehicle tracking system by implementing optical flow as motion detection algorithm.

SCOPE OF OUR METHODOLOGY
=========================
1. he video stream or video is captured from static camera.
This is because motion of camera itself will also affect the result of the system. Different movement of camera requires different motion tracking calculation approaches. Small motion can be ignored by applying thresholding to cancel out all the non significant motion, leaving significant motion behind. However this is not helpful if the motion of background is as significant as moving objects are.
2. Brightness will remain consistence from time to time, or only change smoothly and slowly from time to time.
Huge increase on brightness can affect how optical flow designed to run and compute, result in poor detection and tracking on moving objects. Optical flow can still able to track movement if the changes of brightness are smooth and slow from time to time.
3. Provide direction of motion and flow of the moving vehicles on the road
Vehicle movingon road usually only have one direction. In broader road, the road might contain two lanes where they have opposite direction, or actually same direction. Furthermore, flow of moving vehicle can also determine the traffic status of the road. All the motion detection will be done automatically without interaction from user.
4. Tracking the moving vehicles
The system will be able to keep track of every moving vehicle on the road once they are identified. Tracking vehicles can provide informative data such as their origin location, destination and moving behaviour. The system will also automatically track them once they are captured by camera.

OUR APPROACH
=============
After several testing on techniques available in OpenCV, the workable solution is found. The motion detection and tracking will consist of 3 major techniques: (1) Background subtraction (2) Contouring and object marking (3) LK optical flow method Background subtraction will help the system to extract out the foreground object. Contouring and object marking will get the raw foreground from background subtraction function, and then apply contours and object marking on any object found. LK optical flow will hold the biggest responsibility to track the object, and provide system some motion information of object such as direction of motion and trace of motion. In between motion detection and tracking (background subtraction and LK optical flow tracking), there is supposed to be vehicle identification and classification process before any tracking can be performed. While this research project is focus on motion tracking using optical flow approach, the vehicle identification and classification process will be replaced by contouring and object marking. Contouring and object marking will mark and analyze the object to provide better information for further operation. After information of detected object is gathered, it will compare with the optical flow detected object, to see whether the new object detected from background subtraction is already being tracked by optical flow. The object will be deleted if it is already being tracked by optical flow. This project will be implemented by using C++ programming language. The main reason of using C++ as the programming language for this project is the compatibility with OpenCV. C++ is one of the language that being supported by OpenCV. The other two programming languages are C and Python. Python interface in OpenCV is still being developed and has less support than C++.

Techniques/Input/Output
------------------------
Background subtraction/ Frame from camera or video/ Binary image that had background subtracted
Contouring and object marking/ Background subtracted binary image/ Object information (point, size, centre point, area of pixels)
LK optical flow/ Centre point of objects as features/ Tracked object motion information (direction, motion path)

USAGE
-----
```
make

./vhdetect <video-file-name>
```
