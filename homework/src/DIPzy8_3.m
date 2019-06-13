% 区域编码保留前 50%个系数
 
clc;clear;
img = rgb2gray(imread('Esther Heesch1.jpg'));
figure,subplot(221), imshow(img); xlabel('原图')
[m,n] = size(img);
 
% 1，对整个图像dct变换
img = im2double(img);
% dct_img = dct2(img); % 系统自带函数
dct_img = dct(img,m,n); % 自己写的函数
subplot(222),imshow(1000*abs(dct_img), colormap(gray(5)));
colorbar;
xlabel('dct变换图像')
 
% 2，量化, 区域编码保留前 50%个系数，其他点置为0，变得稀疏
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
xlabel('区域处理dct变换图像')
 
% 3，反变换回来
% new_img = idct2(dct_img); % 系统自带函数
new_img = idct(dct_img,m,n); % 自己写的函数
new_img = mat2gray(new_img);
subplot(223),imshow(new_img); 
xlabel('dct反变换图像')
