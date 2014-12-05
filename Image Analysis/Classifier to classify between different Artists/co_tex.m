% Co-Occurrence Based Model Texture Analysis
 
% Read pictures from the Van Gogh/

for n=1:7
    number=strcat(num2str(n),'.jpg');
    imageName=strcat('Van Gogh/', number);
    image = imread(imageName);
    image=rgb2gray(image);
    [glcms,SI]=graycomatrix(image);
    % get the Homogeneity Energy Contrast Correlation
    stats1(n)= graycoprops(glcms,'Homogeneity Energy Contrast Correlation');
end


% Read pictures from the Van Gogh/
for n=1:7
    number=strcat(num2str(n),'.jpg');
    imageName=strcat('Georges Seura/', number);
    image = imread(imageName);
    image=rgb2gray(image);
    [glcms,SI]=graycomatrix(image);
     % get the Homogeneity Energy Contrast Correlation
    stats2(n)= graycoprops(glcms,'Homogeneity Energy Contrast Correlation');
end

for n=1:4
    stats11(n)=0;
end

for n=1:7
    stats11(1)=stats11(1)+stats1(1,n).Contrast;
end

for n=1:7
    stats11(2)=stats11(2)+stats1(1,n).Correlation;
end

for n=1:7
    stats11(3)=stats11(3)+stats1(1,n).Energy;
end

for n=1:7
    stats11(4)=stats11(4)+stats1(1,n).Homogeneity;
end

for n=1:4
    stats11(n)=stats11(n)/7;
end

    