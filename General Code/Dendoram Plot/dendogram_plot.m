%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will plot a Dendogram for a given Eucledian Distance
%Matrix.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

%Eucledian Distance Matrix
A=[0 0 0 0 0;
   2 0 0 0 0;
   6 5 0 0 0;
   10 9 4 0 0;
   9 8 5 3 0];

%Get non-zero elements of A
B=A(A~=0);
B=transpose(B);

C=linkage(B);
%Plot Dendogram
dendrogram(C);