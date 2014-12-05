%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will track a given colour (green in this code) in a 
%video image and superimpose it on the background image.
%In the video which was taken, a green point keeps moving and was needed to
%be tracked.
%The superimposed track on the background gray image is stored as
%tracking_result_gray_image.jpg.
%The superimposed track on the background colour image is stored as 
%tracking_result_colour_image.jpg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% Input frames with VideoReader

inputObj = VideoReader('video.mp4')
nFrames = inputObj.NumberOfFrames;
back_frame = read(inputObj, 1);


[x,y,z] = size(back_frame);

%this is the green color
I = [62 239 255];
foreground1 =zeros(x,y);

%track green light
for k1 = 1:nFrames
    foreground = read(inputObj, k1);
    for i=1:x
        for j=1:y
            
                pix_track1 = abs(double(I(1,1)) - double (foreground(i,j,1))); 
                pix_track2 = abs(double(I(1,2)) - double (foreground(i,j,2)));  
                pix_track3 = abs(double(I(1,3)) - double (foreground(i,j,3))); 
               
                %track pixels close to the specified green color
                if(pix_track1 <120 && pix_track2 <60 && pix_track3 <60)
                    foreground1(i,j) = foreground1(i,j) + 255;
                else
                    foreground1(i,j) = foreground1(i,j) + 0;
                end
        end
    end
    
    imshow(uint8(foreground1));
end

%filter the result
fg_filt = medfilt2(foreground1, [4,4]);
imwrite(uint8(fg_filt),'track.jpg');

%superimpose the track result in gray background image
back_frame1 = imread('background_gray.jpg');
track = uint8(fg_filt) + uint8(back_frame1);
imwrite(uint8(track),'tracking_result_gray_image.jpg');

%superimpose the track result in color background image
back_frame2 = imread('background.jpg');
back_frame2(:,:,1) = back_frame2(:,:,1) + uint8(fg_filt);
back_frame2(:,:,2) = back_frame2(:,:,2) + uint8(fg_filt);
back_frame2(:,:,3) = back_frame2(:,:,3) + uint8(fg_filt);

imwrite (back_frame2, 'tracking_result_colour_image.jpg');