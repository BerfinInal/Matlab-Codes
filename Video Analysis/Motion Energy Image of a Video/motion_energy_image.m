%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will generate the Motion Energy Image of a given Video.
%The background image is used from the code which generated the background
%of a video.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% Input frames with VideoReader

inputObj = VideoReader('video.mp4')
nFrames = inputObj.NumberOfFrames;
back_frame = imread('background.jpg');

[x,y] = size(back_frame);
foreground = zeros(x,y);

%get the motion energy image with threshold of 40
for k1 = 1:nFrames
    
    foreground1 = abs(double(back_frame) - double(rgb2gray(read(inputObj, k1))));
    for i=1:x
        for j=1:y
            
                if(foreground1(i,j) <40)
                    foreground(i,j)=foreground(i,j)+0;
                else
                    foreground(i,j)=foreground(i,j) + 255;
                end   
        end
    end
end


foreground = uint8(foreground);
figure (4);
imshow(foreground);

figure(5);
fg_filt = medfilt2(foreground, [4,4]);
imshow(fg_filt);

%store the motion energy image
imwrite(fg_filt, 'motion_energy_image.jpg');