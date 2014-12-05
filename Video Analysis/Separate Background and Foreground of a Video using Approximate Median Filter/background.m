%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will separate the background from a Video taken from a
%non-moving camera. This code uses Approximate Median Filter to generate
%the background.
%The background image is stored as background.jpg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% Input frames with VideoReader

inputObj = VideoReader('video.mp4')
nFrames = inputObj.NumberOfFrames;

%first frame as the back-frame
back_frame = read(inputObj, 1);
[x,y,z] = size(back_frame);
back_frame1 = rgb2gray(back_frame);

%iterate through all the frames to get the background
for k = 2 : nFrames
    fore_frame = read(inputObj,k);
    fore_frame1 = rgb2gray(fore_frame);
    diff = abs (double(fore_frame1) - double(back_frame1));
    for i=1:x
        for j=1:y
            
            
            if (double(fore_frame1(i,j)) > double(back_frame1(i,j)) && back_frame1(i,j)<255)
                back_frame1(i,j) = back_frame1(i,j)+1;
                
            elseif (double(fore_frame1(i,j)) < double(back_frame1(i,j))&& back_frame1(i,j)>0)
                back_frame1(i,j) = back_frame1(i,j)-1;
            
            end
        end
    end
    
    %show foreground and background
    figure(1),subplot(1,2,1),imshow(fore_frame)     
    title('Input Frame') 
    subplot(1,2,2),imshow(uint8(back_frame1))
    title('Background Model') 
     
end

%store the background
imwrite(back_frame1, 'background.jpg');