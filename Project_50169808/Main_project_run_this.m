%Circle detection using Hough Transform
clear all;
close all;
clc
% figure 1
img = imread('HoughCircles.jpg');
r_min=33;
r_max=54;
%t1 and t2 are the thresholds for edges detections and 
%max of hough accumulator
t1=0.22;
t2=0.66;
%g1 is the size of the gaussian kernal.
g1=3;
sigma=2;
hough_transform_Canny(img,r_min,r_max,t1,t2,g1,sigma)
title('Hough Circle image 1 using Canny Edge')
figure()
hough_transform_sobel(img,r_min,r_max)
title('Hough Circle image 1 using Sobel filter')

%figure 2
img = imread('Eagle_coins.jpg');
r_min=150;
r_max=200;
t1=0.28;
t2=0.75;
g1=8;
sigma=4;
figure()
hough_transform_Canny(img,r_min,r_max,t1,t2,g1,sigma)
title('Hough Circle image 2 using Canny Edge')

%figure 3
img = imread('Circles3.jpg');
r_min=80;
r_max=120;
t1=0.28;
t2=0.75;
g1=8;
sigma=4;
figure()
hough_transform_Canny(img,r_min,r_max,t1,t2,g1,sigma)
title('Hough Circle image 3 using Canny Edge')

%figure 4 test image
% Just uncomment the below lines and set the rmin and rmax to get the
% circles
% img = imread('Circles3.jpg');
% r_min=80;
% r_max=120;
% t1=0.28;
% t2=0.75;
% g1=8;
% sigma=4;
% figure()
% hough_transform_Canny(img,r_min,r_max,t1,t2,g1,sigma)
% title('Hough Circle image 4 using Canny Edge')

