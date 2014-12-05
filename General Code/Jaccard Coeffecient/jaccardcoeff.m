%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will calculate the Jaccard Distance and Jaccard
%Coeffecient of a given matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
X=[1 1 0 0 1;
   1 1 0 0 1
   1 0 1 1 0];

%Jaccard Distance
Dist = pdist(X,'jaccard');

%Jaccard index = 1 - Jaccard Distance
Coeff = 1-Dist;