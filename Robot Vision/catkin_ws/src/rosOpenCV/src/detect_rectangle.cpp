#include <opencv2/opencv.hpp>
#include <iostream>

#define MATCHMETHOD TM_SQDIFF_NORMED
using namespace cv;
using namespace std;


int main(int argc, char** argv)
{
	Mat src = imread("001.png");
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

	vector<vector<Point>> contours;
	vector<Point> point;
	vector<Vec4i> hireachy;
	findContours(binary, contours, hireachy, RETR_TREE, CHAIN_APPROX_SIMPLE, Point());


	for (size_t t = 0; t < contours.size(); t++)
	{

		int epsilon = 0.01 * arcLength(contours[t], true);
		approxPolyDP(contours[t], point, epsilon, true);
		if (point.size() == 3)
		{
			drawContours(Triangle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
		}
		else if (point.size() == 4)
		{
			drawContours(Rect, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
		}

		else
		{
			double area = contourArea(contours[t]);
			if (area < 15000)
			{
				drawContours(SmallCircle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
			}
			else
			{
				drawContours(BigCircle, contours, t, Scalar(0, 0, 255), 2, 8, Mat(), 0, Point());
			}
		}

		cout << "NUM of side��" << point.size() << endl;
	}

	imshow("Triangle", Triangle);
	imshow("BigCircle", BigCircle);
	imshow("Rect", Rect);
	imshow("SmallCircle", SmallCircle);

	waitKey(0);

	return 0;
}