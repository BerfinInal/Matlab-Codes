%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This function is used to calculate the clarity of a given image.
%The score is given as a number between 1 and 10.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function score = clarity(image)

%convert image to grayscale
gray=rgb2gray(image);
%perform dct
dctimg = dct2(gray);
imshow(log(abs(dctimg)),[]), colormap(jet(64)), colorbar

%get absolute values
absimg=log(abs(dctimg));
[x y] = size(absimg);

%get high freq and low freq values (first 6 and last 6)
high = abs(absimg(1,1))+abs(absimg(1,2))+abs(absimg(1,3))+abs(absimg(2,1))+abs(absimg(2,2))+abs(absimg(3,1));
low = abs(absimg(x,y))+abs(absimg(x-1,y))+abs(absimg(x-2,y))+abs(absimg(x-1,y-1))+abs(absimg(x,y-1))+abs(absimg(x,y-2));
score1= high/low;

%output a score from 1 to 10
score = uint8((score1/15)*10);
if(score>10)
    score=10;
end