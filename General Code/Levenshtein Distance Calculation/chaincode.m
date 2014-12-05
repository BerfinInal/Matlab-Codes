%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will calculate the Levenshtein distances between 2
%matrices. The matrices are taken as chaincodes of cars, trucks and vans.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
clc;
%Initial model of car, truck and van
car1 = [2 0 1 0 7 0 6];
van1 = [2 0 1 0 0 6 6];
truck1 = [2 0 1 0 6 0 0 6];

%3 new cars
car11 = [2 0 1 7 7 0 6];
car12 = [2 0 1 7 6];
car13 = [2 0 1 0 7 0 6];

%3 new vans
van11 = [2 0 1 0 0 0 6 6];
van12 = [2 1 0 0 0 6 6];
van13 = [2 1 1 0 0 6 6];

%3 new trucks
truck11 = [2 0 1 0 6 0 0 6];
truck12 = [2 0 1 0 7 0 0 6];
truck13 = [2 0 1 1 0 0 0 6 6];

%every matrix converted to a string
car = mat2str(car1);
van = mat2str(van1);
truck = mat2str(truck1);

car1 = mat2str(car11);
van1 = mat2str(van11);
truck1 = mat2str(truck11);

car2 = mat2str(car12);
van2 = mat2str(van12);
truck2 = mat2str(truck12);

car3 = mat2str(car13);
van3 = mat2str(van13);
truck3 = mat2str(truck13);

%Levenshtein distance between any 2 vehicles
lev = strdist(truck,truck3);