#include <ros/ros.h>
#include"std_msgs/String.h"
#include <image_transport/image_transport.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>
#include <stdio.h>
//====================================//

#include <iostream>
#include "rosOpenCV/RectMsg.h"

#define MATCHMETHOD TM_SQDIFF_NORMED
using namespace cv;
using namespace std;

int detect();
rosOpenCV::RectMsg msg;
//====================================//
int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_publisher");
  ros::NodeHandle nh;

//========================================//
    ros::Publisher detect_pub=nh.advertise<rosOpenCV::RectMsg>("detection",1000);
    ros::Rate loop_rate(10);
    while (nh.ok())
    {
        ROS_INFO("-----------");
      detect();
      detect_pub.publish(msg);
      //ros::spinOnce();
      loop_rate.sleep();
    }
//========================================//
  //ros::spin();
}

int detect()
{
        Mat src = imread("/home/lilinxing/catkin_ws/src/rosOpenCV/src/001.png");
        Mat src_gray, binary;
        Mat Triangle = src.clone(), Rect = src.clone(), BigCircle = src.clone(), SmallCircle = src.clone();
        if (src.empty()) {
                printf("Could not load image...");
                return -1;
        }
        imshow("Input Image", src);


        cvtColor(src, src_gray, COLOR_BGR2GRAY);
        threshold(src_gray, binary, 0, 255, THRESH_BINARY | THRESH_OTSU);
        binary = ~binary;
        imshow("binary", binary);


        vector<vector<Point> > contours;
        vector<Point> point;
        vector<Vec4i> hireachy;
        findContours(binary, contours, hireachy, RETR_TREE, CHAIN_APPROX_SIMPLE, Point());


        vector<RotatedRect> minRect(contours.size());

        CvPoint2D32f rect_points[4];

        //ros::Publisher detect_pub=nh.advertise<rosOpenCV::RectMsg>("detection",1000);
        //rosOpenCV::RectMsg msg;

        for (size_t t = 0; t < contours.size(); t++)
        {

                int epsilon = 0.01 * arcLength(contours[t], true);
                approxPolyDP(contours[t], point, epsilon, true);
                //==============================================//
                minRect[t] = minAreaRect(Mat(contours[t]));
                if (point.size() == 3)
                {
                        drawContours(Triangle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
                        cvBoxPoints(minRect[t], rect_points);
                        cout << "-----------------------" << endl << "Triangle" << endl;
                        //cout << "center:\n" << minRect[t].center << endl;
                        cout << "center_x:     " << minRect[t].center.x << endl;
                        cout << "center_y:     " << minRect[t].center.y << endl;


                        //pub.publish(msg);
                        //cout << "size:\n" << minRect[t].size << endl;

                        cout << "size_height:  " << minRect[t].size.height << endl;
                        cout << "size_width:   " << minRect[t].size.width << endl;
                        msg.name="Triangle";
                        msg.center_x=minRect[t].center.x;
                        msg.center_y=minRect[t].center.y;
                        msg.rect_height=minRect[t].size.height;
                        msg.rect_width=minRect[t].size.width;

                }
                else if (point.size() == 4)
                {
                        drawContours(Rect, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
                        cvBoxPoints(minRect[t], rect_points);
                        cout << "-----------------------" << endl << "Rectangle" << endl;
                        //cout << "center:\n" << minRect[t].center << endl;
                        cout << "center_x:     " << minRect[t].center.x << endl;
                        cout << "center_y:     " << minRect[t].center.y << endl;
                        //cout << "size:\n" << minRect[t].size << endl;
                        cout << "size_height:  " << minRect[t].size.height << endl;
                        cout << "size_width:   " << minRect[t].size.width << endl;
                        msg.name="Rectangle";
                        msg.center_x=minRect[t].center.x;
                        msg.center_y=minRect[t].center.y;
                        msg.rect_height=minRect[t].size.height;
                        msg.rect_width=minRect[t].size.width;
                }

                else
                {
                        double area = contourArea(contours[t]);
                        if (area < 15000)
                        {
                                drawContours(SmallCircle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
                                cout <<"-----------------------"<<endl<< "SmallCircle" << endl;
                                //cout << "center:\n" << minRect[t].center << endl;
                                cout << "center_x:     " << minRect[t].center.x << endl;
                                cout << "center_y:     " << minRect[t].center.y << endl;
                                //cout << "size:\n" << minRect[t].size << endl;
                                cout << "size_height:  " << minRect[t].size.height << endl;
                                cout << "size_width:   " << minRect[t].size.width << endl;
                                msg.name="SmallCircle";
                                msg.center_x=minRect[t].center.x;
                                msg.center_y=minRect[t].center.y;
                                msg.rect_height=minRect[t].size.height;
                                msg.rect_width=minRect[t].size.width;

                        }
                        else
                        {
                                drawContours(BigCircle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
                                cvBoxPoints(minRect[t], rect_points);
                                cout << "-----------------------" << endl << "BigCircle" << endl;
                                //cout << "center:\n" << minRect[t].center << endl;
                                cout << "center_x:     " << minRect[t].center.x << endl;
                                cout << "center_y:     " << minRect[t].center.y << endl;
                                //cout << "size:\n" << minRect[t].size << endl;
                                cout << "size_height:  " << minRect[t].size.height << endl;
                                cout << "size_width:   " << minRect[t].size.width << endl;
                                msg.name="BigCircle";
                                msg.center_x=minRect[t].center.x;
                                msg.center_y=minRect[t].center.y;
                                msg.rect_height=minRect[t].size.height;
                                msg.rect_width=minRect[t].size.width;
                        }
                }

                cout << "edge number:" << point.size() << endl;
        }

        imshow("Triangle", Triangle);
        imshow("BigCircle", BigCircle);
        imshow("Rect", Rect);
        imshow("SmallCircle", SmallCircle);

        //waitKey(0);

        return 0;
}
