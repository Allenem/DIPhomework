% ������뱣��ǰ 50%��ϵ��
 
clc;clear;
img = rgb2gray(imread('Esther Heesch1.jpg'));
figure,subplot(221), imshow(img); xlabel('ԭͼ')
[m,n] = size(img);
 
% 1��������ͼ��dct�任
img = im2double(img);
% dct_img = dct2(img); % ϵͳ�Դ�����
dct_img = dct(img,m,n); % �Լ�д�ĺ���
subplot(222),imshow(1000*abs(dct_img), colormap(gray(5)));
colorbar;
xlabel('dct�任ͼ��')
 
% 2������, ������뱣��ǰ 50%��ϵ������������Ϊ0�����ϡ��
for i=1:round(sqrt(0.5)*m)
    for j=round(sqrt(0.5)*n):n
        dct_img(i,j)=0; 
    end;
end;
for i=round(sqrt(0.5)*m):m
    for j=1:n
        dct_img(i,j)=0; 
    end;
end;
subplot(224),imshow(1000*abs(dct_img), colormap(gray(5)));
colorbar; 
xlabel('������dct�任ͼ��')
 
% 3�����任����
% new_img = idct2(dct_img); % ϵͳ�Դ�����
new_img = idct(dct_img,m,n); % �Լ�д�ĺ���
new_img = mat2gray(new_img);
subplot(223),imshow(new_img); 
xlabel('dct���任ͼ��')
