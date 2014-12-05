%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will embed a secret message inside an image using
%standard 2-bit LSB substitution.
%cover_img.gif is the cover image inside which the secret message needs to
%be embedded.
%steg_img.gif is the stego image which contains the secret message.
%Variable psnr contains the PSNR value.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
prompt='enter message to encrypt ';
st=input(prompt,'s');
st=uint8(st);
[x,y]=size(st);

ci1=imread('cover_img.gif');
[rows cols]=size(ci1);
ci=ci1;
ci=reshape(ci,[],8);
[x2,y2]=size(ci);

%converting secret message to bitstream
for i=1:y
    for j=1:8
        st1(i,j)=bitand(st(1,i),2^(j-1));
    end
end

for i=1:y
    for j=1:8
        st2(i,j)=fi(st1(i,j),0,8,0);
        st2(i,j)=bitror(st2(i,j),j-1);
    end
end
st2=double(st2);
[x3,y3]=size(st2);

%embed secret message inside the image
for i=1:x3
    for j=1:y3
        ci(i,j)=bitand(ci(i,j),254);
        ci(i,j)=bitor(ci(i,j),st2(i,j));
    end
end

%reshape image and store it.
ci=reshape(ci,rows,cols);
imwrite(ci,'steg_img.gif');

%calculate psnr
ci1=double(ci1);
ci=double(ci);
value=0;
error=0;
data=rows*cols;
for i=1:rows
    for j=1:cols
            value=ci1(i,j)-ci(i,j);
            error=error+((value*value)/data);
    end
end
db=255/(sqrt(error));
psnr=20*(log10(db));