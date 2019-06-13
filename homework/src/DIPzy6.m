clc;
clear;

%�����˲���
A=imread('lena.jpg');
I=rgb2gray(A);
figure;
subplot(331);
imshow(I);
title('ԭͼ��');
gn=imnoise(I,'gaussian',0,0.01);
J=I+gn;
subplot(332);
imshow(J);
title('�Ӹ�˹����ͼ��');

F=fftshift(fft2(I));
subplot(333);
imshow(abs(F),[]);
title('����Ҷ�任����Ƶ��');

[a,b]=size(F);
a0=round(a/2);
b0=round(b/2);

r=[5,50,150];
for x=1:3;
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<=r(x) hl=1;hh=0; % hlΪ��ͨ�˲�����hhΪ��ͨ�˲���
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
title(['r=',num2str(r(x)),'��ͨ�˲�ͼ��']);
subplot(3,3,(x+6));
imshow(hf);
title(['r=',num2str(r(x)),'��ͨ�˲�ͼ��']);
end;


% �������ȵ�ͨ�˲���
image  = imread('test.png');
image1 = rgb2gray(image);

[image2,image7] = Bfilter(image1, 5, 2);
[image3,image8] = Bfilter(image1, 15, 2);
[image4,image9] = Bfilter(image1, 30, 2);
[image5,image10] = Bfilter(image1, 80, 2);
[image6,image11] = Bfilter(image1, 230, 2);

% ��ʾͼ��
figure;
subplot(2,3,1), imshow(image1), title('ԭͼ��');
subplot(2,3,2), imshow(image2), title('D0 = 5, n = 2, ��ͨ');
subplot(2,3,3), imshow(image3), title('D0 = 15, n = 2, ��ͨ');
subplot(2,3,4), imshow(image4), title('D0 = 30, n = 2, ��ͨ');
subplot(2,3,5), imshow(image5), title('D0 = 80, n = 2, ��ͨ');
subplot(2,3,6), imshow(image6), title('D0 = 230, n = 2, ��ͨ');
figure;
subplot(2,3,1), imshow(image1), title('ԭͼ��');
subplot(2,3,2), imshow(image7), title('D0 = 5, n = 2, ��ͨ');
subplot(2,3,3), imshow(image8), title('D0 = 15, n = 2, ��ͨ');
subplot(2,3,4), imshow(image9), title('D0 = 30, n = 2, ��ͨ');
subplot(2,3,5), imshow(image10), title('D0 = 80, n = 2, ��ͨ');
subplot(2,3,6), imshow(image11), title('D0 = 230, n = 2, ��ͨ');

%��˹�˲���
image  = imread('test.png');
image1 = rgb2gray(image);

[image2,image7] = Gfilter(image1, 5);
[image3,image8] = Gfilter(image1, 15);
[image4,image9] = Gfilter(image1, 30);
[image5,image10] = Gfilter(image1, 80);
[image6,image11] = Gfilter(image1, 230);

% ��ʾͼ��
figure;
subplot(2,3,1), imshow(image1), title('ԭͼ��');
subplot(2,3,2), imshow(image2), title('D0 = 5, ��ͨ');
subplot(2,3,3), imshow(image3), title('D0 = 15, ��ͨ');
subplot(2,3,4), imshow(image4), title('D0 = 30, ��ͨ');
subplot(2,3,5), imshow(image5), title('D0 = 80, ��ͨ');
subplot(2,3,6), imshow(image6), title('D0 = 230, ��ͨ');
figure;
subplot(2,3,1), imshow(image1), title('ԭͼ��');
subplot(2,3,2), imshow(image7), title('D0 = 5, ��ͨ');
subplot(2,3,3), imshow(image8), title('D0 = 15, ��ͨ');
subplot(2,3,4), imshow(image9), title('D0 = 30, ��ͨ');
subplot(2,3,5), imshow(image10), title('D0 = 80, ��ͨ');
subplot(2,3,6), imshow(image11), title('D0 = 230, ��ͨ');