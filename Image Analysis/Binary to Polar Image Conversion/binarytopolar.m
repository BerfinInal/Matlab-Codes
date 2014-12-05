%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will convert a binary image to a curve in polar
%coordinate.
%bin_img.jpg is the binary image.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;

bin_img=imread('bin_img.jpg');
b=rgb2gray(bin_img);
bin_edge_img=edge(b);


k=1;
[x,y]=size(bin_edge_img);

%Plotting the polar co-ordinates
for i=1:x
    for j=1:y
        if bin_edge_img(i,j)==1
        [r(k),t(k)]=cart2pol(i-x/2,j-y/2);
        plot(r(k),t(k));
        k=k+1;
        hold on
        end
    end
end
hold off


%retrieve back the original binary image from the colar coordinates
for k1=1:k-1
    [x1(k1),y1(k1)]=pol2cart(r(k1),t(k1));
    x1(k1)=x1(k1)+x/2;
    y1(k1)=y1(k1)+y/2;
end

x1=uint16(x1);
y1=uint16(y1);

for i=1:x
    for j=1:y
        ret_img(i,j)=0;
    end
end

for i=1:k-1
        ret_img(x1(i),y1(i))=1;
end

%retrieved image from the polar coordinates
figure(2);
ret_img=imcomplement(ret_img);
imshow(ret_img);

%original binary image
figure(3);
ori_img=imcomplement(bin_edge_img);
imshow(ori_img);