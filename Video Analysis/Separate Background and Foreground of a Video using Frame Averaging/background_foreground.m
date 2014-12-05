%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will separate the background and foreground from a Video taken from a
%non-moving camera. This code averages all the frames to generate the
%background and using this background, it separates the foreground.
%The background image is stored as background.jpg.
%The foreground image is stored as foreground.jpg.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
% Input frames with VideoReader

inputObj = VideoReader('video.mp4')
nFrames = inputObj.NumberOfFrames;
back_frame = double(read(inputObj, 1));
[x,y,z] = size(back_frame);

%average of all frames
for k = 2 : nFrames
    fore_frame = double(read(inputObj,k));
   
    back_frame = back_frame+fore_frame;
    
end

back_frame = round(back_frame ./nFrames);
back_frame = uint8(back_frame);



figure(3);
imshow(back_frame);

%get foreground from first frame
foreground1 = abs(double(back_frame) - double(read(inputObj, 1)));
for i=1:x
    for j=1:y
        for k =1:z
            if(foreground1(i,j,k) <50)
                foreground1(i,j,k)=0;
            else
            end
        end
    end
end

foreground1 = uint8(foreground1);
figure (5);
imshow(foreground1);
back_frame1 = rgb2gray(back_frame);
imwrite(back_frame, 'background.jpg');
imwrite(back_frame1, 'backnew.jpg');
foreground1  = rgb2gray(foreground1);
fg_filt = medfilt2(foreground1, [4,4]);
imwrite(fg_filt,'foreground.jpg');