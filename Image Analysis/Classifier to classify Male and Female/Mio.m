%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Modifications by: Jagannathan Chakravarthy

%Purpose: This code was originally for Face recognition. Now, this has been
%converted as a classifier to determine whether an input image of a person
%is Male or a Female. 
%Training images for male are numbered from 1.bmp to 12.bmp
%Training images for female are numbered from 1a.bmp to 12a.bmp
%The Test image is named as Test.bmp
%The classifier will output whether the input image is of a male or a
%female upon running.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Face recognition by Santiago Serrano
% Modified by Karoly Pados
% For class use only

clear all
close all
clc

% In this example we will only use 10 male and female images as the
% training set.
%test images T1 to T6 are used to test the classifier.


% number of images on your training set for male and female.
M=10;

%Chosen std and mean. 
%It can be any number that it is close to the std and mean of most of the images.
um=100;
ustd=80;

%read and show images(bmp);
S=[];   %img matrix
for i=1:M
    str=strcat(int2str(i),'.bmp');   %concatenates two strings that form the name of the image
    eval('img=imread(str);');
    [irow icol]=size(img);    % get the number of rows (N1) and columns (N2)
    temp=reshape(img',irow*icol,1);     %creates a (N1*N2)x1 matrix
    S=[S temp];         %X is a N1*N2xM matrix after finishing the sequence
                        %this is our S
end

%read and show images(bmp);
S1=[];   %img matrix
for i=1:M
    str1=strcat(int2str(i),'a.bmp');   %concatenates two strings that form the name of the image
    eval('img=imread(str1);');
    [irow1 icol1]=size(img);    % get the number of rows (N1) and columns (N2)
    temp1=reshape(img',irow*icol,1);     %creates a (N1*N2)x1 matrix
    S1=[S1 temp1];         %X is a N1*N2xM matrix after finishing the sequence
                        %this is our S
end

%Here we change the mean and std of all images. We normalize all images.
%This is done to reduce the error due to lighting conditions.
for i=1:size(S,2)
    temp=double(S(:,i));
    m=mean(temp);
    st=std(temp);
    S(:,i)=(temp-m)*ustd/st+um;
end

%Here we change the mean and std of all images. We normalize all images.
%This is done to reduce the error due to lighting conditions.
for i=1:size(S1,2)
    temp1=double(S1(:,i));
    m1=mean(temp1);
    st1=std(temp1);
    S1(:,i)=(temp1-m1)*ustd/st1+um;
end


%mean image;
m=mean(S,2);   %obtains the mean of each row instead of each column
tmimg=uint8(m);   %converts to unsigned 8-bit integer. Values range from 0 to 255
img=reshape(tmimg,icol,irow);    %takes the N1*N2x1 vector and creates a N2xN1 matrix
img=img';       %creates a N1xN2 matrix by transposing the image.
figure(3);
imshow(img);
title('Mean Image Male','fontsize',18)

%mean image;
m1=mean(S1,2);   %obtains the mean of each row instead of each column
tmimg1=uint8(m1);   %converts to unsigned 8-bit integer. Values range from 0 to 255
img1=reshape(tmimg1,icol1,irow1);    %takes the N1*N2x1 vector and creates a N2xN1 matrix
img1=img1';       %creates a N1xN2 matrix by transposing the image.
figure(6);
imshow(img1);
title('Mean Image Female','fontsize',18)

% Change image for manipulation
dbx=[];   % A matrix
for i=1:M
    temp=double(S(:,i));
    dbx=[dbx temp];
end

% Change image for manipulation
dbx1=[];   % A matrix
for i=1:M
    temp1=double(S1(:,i));
    dbx1=[dbx1 temp1];
end

%Covariance matrix C=A'A, L=AA'
A=dbx';
L=A*A';
% vv are the eigenvector for L
% dd are the eigenvalue for both L=dbx'*dbx and C=dbx*dbx';
[vv dd]=eig(L);
% Sort and eliminate those whose eigenvalue is zero
v=[];
d=[];
for i=1:size(vv,2)
    if(dd(i,i)>1e-4)
        v=[v vv(:,i)];
        d=[d dd(i,i)];
    end
end
 
%Covariance matrix C=A'A, L=AA'
A1=dbx1';
L1=A1*A1';
% vv are the eigenvector for L
% dd are the eigenvalue for both L=dbx'*dbx and C=dbx*dbx';
[vv1 dd1]=eig(L1);
% Sort and eliminate those whose eigenvalue is zero
v1=[];
d1=[];
for i=1:size(vv1,2)
    if(dd1(i,i)>1e-4)
        v1=[v1 vv1(:,i)];
        d1=[d1 dd1(i,i)];
    end
 end
 
 %sort, will return an ascending sequence
 [B index]=sort(d);
 ind=zeros(size(index));
 dtemp=zeros(size(index));
 vtemp=zeros(size(v));
 len=length(index);
 for i=1:len
    dtemp(i)=B(len+1-i);
    ind(i)=len+1-index(i);
    vtemp(:,ind(i))=v(:,i);
 end
 d=dtemp;
 v=vtemp;
 
 %sort, will return an ascending sequence
 [B1 index1]=sort(d1);
 ind1=zeros(size(index1));
 dtemp1=zeros(size(index1));
 vtemp1=zeros(size(v1));
 len1=length(index1);
 for i=1:len1
    dtemp1(i)=B1(len1+1-i);
    ind1(i)=len1+1-index1(i);
    vtemp1(:,ind1(i))=v1(:,i);
 end
 d1=dtemp1;
 v1=vtemp1;


%Normalization of eigenvectors
for i=1:size(v,2)       %access each column
    v(:,i) = v(:,i)/norm(v(:,i));
end

%Normalization of eigenvectors
for i=1:size(v1,2)       %access each column
    v1(:,i) = v1(:,i)/norm(v1(:,i));
end

%Eigenvectors of C matrix
u=[];
for i=1:size(v,2)
    temp=sqrt(d(i));
    u=[u (dbx*v(:,i))./temp];
end

%Eigenvectors of C matrix
u1=[];
for i=1:size(v1,2)
    temp1=sqrt(d1(i));
    u1=[u1 (dbx1*v1(:,i))./temp1];
end

%Normalization of eigenvectors
for i=1:size(u,2)
   u(:,i) = u(:,i)/norm(u(:,i));
end

%Normalization of eigenvectors
for i=1:size(u1,2)
   u1(:,i) = u1(:,i)/norm(u1(:,i));
end

% show eigenfaces;
figure(4);
for i=1:size(u,2)
    img=reshape(u(:,i),icol,irow);
    img=img';
    img=histeq(img,255);
    subplot(ceil(sqrt(M)),ceil(sqrt(M)),i)
    imshow(img)
    drawnow;
    if i==3
        title('Eigenfaces - Male','fontsize',18)
    end
end

% show eigenfaces;
figure(41);
for i=1:size(u1,2)
    img1=reshape(u1(:,i),icol1,irow1);
    img1=img1';
    img1=histeq(img1,255);
    subplot(ceil(sqrt(M)),ceil(sqrt(M)),i)
    imshow(img1)
    drawnow;
    if i==3
        title('Eigenfaces - Female','fontsize',18)
    end
end



% Find the weight of each face in the training set.
omega = [];
for h=1:size(dbx,2)
    WW=[];    
    for i=1:size(u,2)
        t = u(:,i)';    
        WeightOfImage = dot(t,dbx(:,h)');
        WW = [WW; WeightOfImage];
    end
    omega = [omega WW];
end

% Find the weight of each face in the training set.
omega1 = [];
for h=1:size(dbx1,2)
    WW1=[];    
    for i=1:size(u1,2)
        t1 = u1(:,i)';    
        WeightOfImage1 = dot(t1,dbx1(:,h)');
        WW1 = [WW1; WeightOfImage1];
    end
    omega1 = [omega1 WW1];
end


%------------------------------------------------------------
% NOW WE TEST A NEW IMAGE
%------------------------------------------------------------


% Acquire new image
InputImage = imread('Test','bmp');
figure(5)
subplot(1,2,1)
imshow(InputImage); colormap('gray');title('Input image','fontsize',18)
InImage=reshape(double(InputImage)',irow*icol,1);  
temp=InImage;
me=mean(temp);
st=std(temp);
temp=(temp-me)*ustd/st+um;
NormImage = temp;
Difference = temp-m;
Difference1 = temp-m1;

p = [];
aa=size(u,2);
for i = 1:aa
    pare = dot(NormImage,u(:,i));
    p = [p; pare];
end
ReshapedImage = m + u(:,1:aa)*p;    %m is the mean image, u is the eigenvector
ReshapedImage = reshape(ReshapedImage,icol,irow);
ReshapedImage = ReshapedImage';


p1 = [];
aa1=size(u1,2);
for i = 1:aa1
    pare1 = dot(NormImage,u1(:,i));
    p1 = [p1; pare1];
end
ReshapedImage1 = m1 + u1(:,1:aa1)*p1;    %m is the mean image, u is the eigenvector
ReshapedImage1 = reshape(ReshapedImage1,icol1,irow1);
ReshapedImage1 = ReshapedImage1';

%show the reconstructed image.
subplot(1,2,2)
imagesc(ReshapedImage); colormap('gray');
title('Reconstructed image - From Male','fontsize',18)

figure(51)
subplot(1,2,1)
imshow(InputImage); colormap('gray');title('Input image','fontsize',18)

%show the reconstructed image.
subplot(1,2,2)
imagesc(ReshapedImage1); colormap('gray');
title('Reconstructed image - From Female','fontsize',18)


InImWeight = [];
for i=1:size(u,2)
    t = u(:,i)';
    WeightOfInputImage = dot(t,Difference');
    InImWeight = [InImWeight; WeightOfInputImage];
end

InImWeight1 = [];
for i=1:size(u1,2)
    t1 = u1(:,i)';
    WeightOfInputImage1 = dot(t1,Difference1');
    InImWeight1 = [InImWeight1; WeightOfInputImage1];
end

ll = 1:M;
figure(68)
subplot(1,2,1)
stem(ll,InImWeight)
title('Weight of Input Face - Male','fontsize',14)

% Find Euclidean distance
e=[];
for i=1:size(omega,2)
    q = omega(:,i);
    DiffWeight = InImWeight-q;
    mag = norm(DiffWeight);
    e = [e mag];
end

kk = 1:size(e,2);
subplot(1,2,2)
stem(kk,e)
title('Eucledian distance of input image','fontsize',14)

MaximumValue=max(e)
MinimumValue=min(e)


ll1 = 1:M;
figure(681)
subplot(1,2,1)
stem(ll1,InImWeight1)
title('Weight of Input Face - Female','fontsize',14)

% Find Euclidean distance
e1=[];
for i=1:size(omega1,2)
    q1 = omega1(:,i);
    DiffWeight1 = InImWeight1-q1;
    mag1 = norm(DiffWeight1);
    e1 = [e1 mag1];
end

kk1 = 1:size(e1,2);
subplot(1,2,2)
stem(kk1,e1)
title('Eucledian distance of input image','fontsize',14)

MaximumValue1=max(e1)
MinimumValue1=min(e1)

sum1 = abs(InImWeight).*transpose(e)
sum11 = abs(InImWeight1).*transpose(e1)

nsum = sum(sum1);
nsum1 = sum(sum11);

if(nsum > nsum1)
    classification = 'Female';
else
    classification = 'Male';
end

%displays whether the new image is a male or a female
disp(classification);