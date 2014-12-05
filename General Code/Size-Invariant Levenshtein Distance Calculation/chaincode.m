%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will calculate SIZE INVARIANT Levenshtein distances
%between 2 matrices. The matrices are taken as chaincodes of cars, trucks
%and vans.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%Initial model of car, truck and van
car1 = [2 0 1 0 7 0 6];
van1 = [2 0 1 0 0 6 6];
truck1 = [2 0 1 0 6 0 0 6];

%convert to string
car = mat2str(car1);
van = mat2str(van1);
truck = mat2str(truck1);

%Put in the sized version of the new car, truck or van
car11 = [2 2 0 0 1 1 7 7 7 7 0 0 6 6];
[x1,y1]=size(car1);
[x2,y2]=size(car11);

siz = round(y2/y1);
k=1;
car111=zeros(x1,y1);

%convert the sized model into a normal size (sizing down) by averaging
for i=1:siz:y2
    for j=1:siz
    car111(k) = car111(k)+car11(i+j-1);
    end
    k=k+1;
end
car111 = car111/2;
car1 = mat2str(car111);

%Calculate Levenshtein distance
lev = strdist(car,car1);