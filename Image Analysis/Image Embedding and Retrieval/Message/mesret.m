%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author: Jagannathan Chakravarthy

%Purpose: This code will retrieve the secret message inside an image using
%standard 2-bit LSB substitution.
%steg_img.gif is the stego image which contains the secret message.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;
prompt='enter the size of messaage ';
y=input(prompt);

ci=imread('steg_img.gif');
ci=reshape(ci,[],8);
[x2,y2]=size(ci);

%get secret message from the stego image
for i=1:y
    for j=1:8
        mes(i,j)=bitand(ci(i,j),1);
    end
end

for i=1:y
    mes1(i)=0;
    for j=1:8
        mes1(i)=mes1(i)+mes(i,j)*2^(j-1);
    end
end

%display the secret message
mes1=char(mes1);
disp('Secret Message ');
disp(mes1);