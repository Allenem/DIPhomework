% DCT变换和反变换

clc;clear;
img = rgb2gray(imread('Esther Heesch.jpg'));
figure;imshow(img); xlabel('原图')

% 1，使图像行列为 8的倍数
n = 8;
[row,col] = size(img);
row = round(row/n) * n; 
col = round(col/n) * n;
img = imresize(img, [row, col]);

% 2，对图像块进行dct变换
img_dct = zeros(row, col); % 存放转换后的dct系数
for i=1:n:row-7
    for j=1:n:col-7
        img_block = im2double(img(i:i+7, j:j+7));
        dct_block = dct(img_block,n,n); % 也可用刚才实现的(定义成一个函数即可)
        % imshow(dct_block); % 显示dct块
        img_dct(i:i+7, j:j+7) = dct_block;
    end
end
figure;imshow(img_dct); xlabel('dct变换图像')
% figure, imshow(img_dct); % 显示生成的dct系数

% 3，dct反变换
new_img = zeros(row,col);
for i=1:n:row-7
    for j=1:n:col-7
        dct_block = img_dct(i:i+7, j:j+7);
        img_block = idct(dct_block,n,n); % 也可用刚才实现的(定义成一个函数即可)
        new_img(i:i+7, j:j+7) = img_block;
    end
end
figure;imshow(new_img); xlabel('dct反变换图像')
% figure,  imshow(mat2gray(new_img)); % 显示反变换回来的图像