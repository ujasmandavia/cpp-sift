// Include standard libraries
#include <iostream>
#include <string>
#include <typeinfo>
#include <fstream>

// Include OpenCV libraries
#include <stdio.h>
#include <iostream>
#include "opencv2/core.hpp"
#include "opencv2/opencv.hpp"
#include "opencv2/features2d.hpp"
#include "opencv2/xfeatures2d.hpp"
#include "opencv2/highgui.hpp"
#include <boost/algorithm/string.hpp>

// Set namespaces
using namespace std;
using namespace cv;
using namespace cv::xfeatures2d;


// Global variables
string query_window = "Query (cam) image";
string map_window = "Map image";
string matches_window = "Matches image";

const float inlier_threshold = 100.0f; // Distance threshold to identify inliers
const float match_ratio = 0.8f;   // Nearest neighbor matching ratio

int main(int argc, char* argv[]) {
  
  // Init matrices for cam images and the map image
  Mat query_img, query_img_gray;
  Mat map_img, map_img_gray;

  // Path of map  
  string map_img_path = "../data/newMaze17_full.jpg";

  // Path of drone information
  string drone_info_path =  "../data/data_preprocessed.csv";
  ifstream drone_info_file(drone_info_path.c_str());

  // Homograpy
  Mat homography;

  map_img = imread(map_img_path, CV_LOAD_IMAGE_COLOR); 
  cvtColor(map_img, map_img_gray, CV_BGR2GRAY);

  // Check for invalid input
  if(! map_img.data )
    {
        cout << "Could not open or find the image" << endl;
        return -1;
    }

  // Webcam usage or recorded video

  string video_path = "../data/output.avi";
  //int video_path = 1;
  
  // Load camera
  VideoCapture video(video_path);
  
  if(!video.isOpened()) {
    cerr << "Capture not opened!" << endl;
    return -1;
  }
  
  // Create a window for display.
  namedWindow(query_window, WINDOW_AUTOSIZE);
  namedWindow(matches_window, WINDOW_AUTOSIZE);

  //-- Step 1: Detect the keypoints using SURF Detector
  vector<KeyPoint> keypoints_query, keypoints_map;

  Mat descriptors_query, descriptors_map;

  int minHessian = 400;
  Ptr<SURF> detector = SURF::create(minHessian);

  detector->detectAndCompute(map_img_gray, 
			     noArray(), 
			     keypoints_map,
			     descriptors_map);

  // Read video frame by frame and do calculations
  while (true) {
    
    // Read video, convert it to grayscale and display it 
    video.read(query_img);
    
    cvtColor(query_img, query_img_gray, COLOR_BGR2GRAY);
    imshow(query_window, query_img_gray);
    
    // Safely exit the recording on pressing any key
   if(waitKey(1) >= 0) break;
   
   // Calculate keypoints
   
   detector->detectAndCompute(query_img_gray, 
			      noArray(), 
			      keypoints_query,
			      descriptors_query);
   
   
   FlannBasedMatcher matcher;
   
   vector< vector<DMatch> > matches;
   
   matcher.knnMatch(descriptors_query, 
		    descriptors_map, 
		    matches,
		   2);
   
   vector<KeyPoint> matched_query, matched_map, inliers_query, inliers_map;
   vector<DMatch> good_matches;

   //-- Localize the object
   vector<Point2f> pts_query;
   vector<Point2f> pts_map;
   
  for(size_t i = 0; i < matches.size(); i++) {
    
    DMatch first = matches[i][0];
    float dist_query = matches[i][0].distance;
    float dist_map = matches[i][1].distance;
    
    if(dist_query < match_ratio * dist_map) {
      matched_query.push_back(keypoints_query[first.queryIdx]);
      matched_map.push_back(keypoints_map[first.trainIdx]);

      pts_query.push_back(keypoints_query[first.queryIdx].pt);
      pts_map.push_back(keypoints_map[first.trainIdx].pt);
      

    }
  }

  Mat mask; 

  homography = findHomography(pts_query, 
				pts_map,
				RANSAC,
				5,
				mask);

  
  vector center[2], center_transformed[2];

  center = {query_img.rows, query_img.cols};

  perspectiveTransform(center, center_transformed, homography);


  cout << center_transformed << '\n';
 
  for(unsigned i = 0; i < matched_query.size(); i++) {

    Mat col = Mat::ones(3, 1, CV_64F);
    col.at<double>(0) = matched_query[i].pt.x;
    col.at<double>(1) = matched_map[i].pt.y;
    
    col = homography * col;
    col /= col.at<double>(2);
    double dist = sqrt( pow(col.at<double>(0) - matched_map[i].pt.x, 2) +
			pow(col.at<double>(1) - matched_map[i].pt.y, 2));
    
    cout << dist << '\n';
   
    if(dist < inlier_threshold) {
      int new_i = static_cast<int>(inliers_query.size());
      inliers_query.push_back(matched_query[i]);
     inliers_map.push_back(matched_map[i]);
     good_matches.push_back(DMatch(new_i, new_i, 0));
   }
  }
  
  Mat res, res_small;
  drawMatches(query_img_gray, inliers_query, 
	      map_img_gray, inliers_map, 
	      good_matches, res);
  

  Size size(640, 480);//the dst image size,e.g.100x100
  resize(res, res_small, size);
  
  imshow(matches_window, res_small);
  
  double inlier_ratio = inliers_query.size() * 1.0 / matched_query.size();
  cout << "Matching Results" << endl;
  cout << "*******************************" << endl;
  cout << "# Keypoints 1:                        \t" << keypoints_query.size() << endl;
  cout << "# Keypoints 2:                        \t" << keypoints_map.size() << endl;
  cout << "# Matches:                            \t" << matched_query.size() << endl;
  cout << "# Inliers:                            \t" << inliers_query.size() << endl;
  cout << "# Inliers Ratio:                      \t" << inlier_ratio << endl;
  cout << endl;
  
}
  
  return 0; 
  
}
