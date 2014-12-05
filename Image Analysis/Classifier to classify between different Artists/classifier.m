%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code is a cassifier which determines whether a specific
%painting is the work of either Van Gough or Georges Seurat.
%test6.img is the test image which is the input given to this classifier.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;


image=imread('test6.jpg');
image=rgb2gray(image);
[glcms,SI]=graycomatrix(image);
% get the Homogeneity Energy Contrast Correlation
stats1(1)= graycoprops(glcms,'Homogeneity Energy Contrast Correlati');

%Average and standard deviation values of Van Gough Images
%obtained from co_text.m (modified). Average and standard deviation of 7
%images.
avg1=[0.255397539	0.772087774	0.286938198	0.884828564];
std1=[0.079726184	0.156987455	0.126211404	0.031188644];

%Average and standard deviation values of Georges Seurat Images
%obtained from co_text.m (modified). Average and standard deviation of 7
%images.
avg2=[1.350524416	0.611890906	0.06859688	0.663016525];
std2=[0.294988071	0.105095114	0.019946121	0.027024328];

k1=0;
k2=0;


%Check if atleast 2 attributes fit within one standard deviation of
%averages values. If yes, display the corresponding painter. If not,
%display 'cannot determine painter'.
if(abs(stats1(1,1).Contrast-avg1(1))<=std1(1))
    k1=k1+1;
end
if(abs(stats1(1,1).Contrast-avg2(1))<=std2(1))
    k2=k2+1;
end


if(abs(stats1(1, 1).Correlation-avg1(2))<=std1(2))
    k1=k1+1;
end
if(abs(stats1(1, 1).Correlation-avg2(2))<=std2(2))
    k2=k2+1;
end

if(abs(stats1(1, 1).Energy-avg1(3))<=std1(3))
    k1=k1+1;
end
if(abs(stats1(1, 1).Energy-avg2(3))<=std2(3))
    k2=k2+1;
end

if(abs(stats1(1, 1).Homogeneity-avg1(4))<=std1(4))
    k1=k1+1;
end
if(abs(stats1(1, 1).Homogeneity-avg2(4))<=std2(4))
    k2=k2+1;
end

if ((k1>=2)&&(k1>k2))
    disp('Van Gogh');

elseif((k2>=2)&&(k2>k1))
    disp('Georges Seurat');

elseif(k1==k2)
    disp('cannot determine painter');

else
    disp('cannot determine painter');
end