clc;
clear;

%理想滤波器
A=imread('lena.jpg');
I=rgb2gray(A);
figure;
subplot(331);
imshow(I);
title('原图像');
gn=imnoise(I,'gaussian',0,0.01);
J=I+gn;
subplot(332);
imshow(J);
title('加高斯噪声图像');

F=fftshift(fft2(I));
subplot(333);
imshow(abs(F),[]);
title('傅里叶变换所得频谱');

[a,b]=size(F);
a0=round(a/2);
b0=round(b/2);

r=[5,50,150];
for x=1:3;
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=r(x) hl=1;hh=0; % hl为低通滤波器，hh为高通滤波器
        else hl=0;hh=1;
        end;
        F1(i,j)=hl*F(i,j);
        F2(i,j)=hh*F(i,j);
    end;
end;
lf=uint8(real(ifft2(ifftshift(F1))));
hf=uint8(real(ifft2(ifftshift(F2))));
subplot(3,3,(x+3));
imshow(lf);
title(['r=',num2str(r(x)),'低通滤波图像']);
subplot(3,3,(x+6));
imshow(hf);
title(['r=',num2str(r(x)),'高通滤波图像']);
end;


% 巴特沃兹低通滤波器
image  = imread('test.png');
image1 = rgb2gray(image);

[image2,image7] = Bfilter(image1, 5, 2);
[image3,image8] = Bfilter(image1, 15, 2);
[image4,image9] = Bfilter(image1, 30, 2);
[image5,image10] = Bfilter(image1, 80, 2);
[image6,image11] = Bfilter(image1, 230, 2);

% 显示图像
figure;
subplot(2,3,1), imshow(image1), title('原图像');
subplot(2,3,2), imshow(image2), title('D0 = 5, n = 2, 低通');
subplot(2,3,3), imshow(image3), title('D0 = 15, n = 2, 低通');
subplot(2,3,4), imshow(image4), title('D0 = 30, n = 2, 低通');
subplot(2,3,5), imshow(image5), title('D0 = 80, n = 2, 低通');
subplot(2,3,6), imshow(image6), title('D0 = 230, n = 2, 低通');
figure;
subplot(2,3,1), imshow(image1), title('原图像');
subplot(2,3,2), imshow(image7), title('D0 = 5, n = 2, 高通');
subplot(2,3,3), imshow(image8), title('D0 = 15, n = 2, 高通');
subplot(2,3,4), imshow(image9), title('D0 = 30, n = 2, 高通');
subplot(2,3,5), imshow(image10), title('D0 = 80, n = 2, 高通');
subplot(2,3,6), imshow(image11), title('D0 = 230, n = 2, 高通');

%高斯滤波器
image  = imread('test.png');
image1 = rgb2gray(image);

[image2,image7] = Gfilter(image1, 5);
[image3,image8] = Gfilter(image1, 15);
[image4,image9] = Gfilter(image1, 30);
[image5,image10] = Gfilter(image1, 80);
[image6,image11] = Gfilter(image1, 230);

% 显示图像
figure;
subplot(2,3,1), imshow(image1), title('原图像');
subplot(2,3,2), imshow(image2), title('D0 = 5, 低通');
subplot(2,3,3), imshow(image3), title('D0 = 15, 低通');
subplot(2,3,4), imshow(image4), title('D0 = 30, 低通');
subplot(2,3,5), imshow(image5), title('D0 = 80, 低通');
subplot(2,3,6), imshow(image6), title('D0 = 230, 低通');
figure;
subplot(2,3,1), imshow(image1), title('原图像');
subplot(2,3,2), imshow(image7), title('D0 = 5, 高通');
subplot(2,3,3), imshow(image8), title('D0 = 15, 高通');
subplot(2,3,4), imshow(image9), title('D0 = 30, 高通');
subplot(2,3,5), imshow(image10), title('D0 = 80, 高通');
subplot(2,3,6), imshow(image11), title('D0 = 230, 高通');