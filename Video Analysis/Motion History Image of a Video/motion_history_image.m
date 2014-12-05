%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will generate the Motion History Image of a given Video.
%The background image is used from the code which generated the background
%of a video.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% Input frames with VideoReader

inputObj = VideoReader('video.mp4')
nFrames = inputObj.NumberOfFrames;
back_frame = imread('background.jpg');
[x y] = size(back_frame);
foreground2 = zeros(x,y);

%get the motion energy image with threshold of 50
for k1 = 1:nFrames
    
    foreground1 = abs(double(back_frame) - double(rgb2gray(read(inputObj, k1))));
    foreground1 = uint8(foreground1);
    
    for i=1:x
        for j=1:y
                    if(foreground1(i,j) <50)
                    foreground2(i,j)=(foreground2(i,j)) - 0.15;
                    else
                            foreground2(i,j)=255;
                    end
         end
     end

figure (4);
imshow(uint8(foreground2));

end

%store the motion history image
imwrite(uint8(foreground2), 'motion_history_image.jpg');