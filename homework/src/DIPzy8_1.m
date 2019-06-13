% DCT�任�ͷ��任

clc;clear;
img = rgb2gray(imread('Esther Heesch.jpg'));
figure;imshow(img); xlabel('ԭͼ')

% 1��ʹͼ������Ϊ 8�ı���
n = 8;
[row,col] = size(img);
row = round(row/n) * n; 
col = round(col/n) * n;
img = imresize(img, [row, col]);

% 2����ͼ������dct�任
img_dct = zeros(row, col); % ���ת�����dctϵ��
for i=1:n:row-7
    for j=1:n:col-7
        img_block = im2double(img(i:i+7, j:j+7));
        dct_block = dct(img_block,n,n); % Ҳ���øղ�ʵ�ֵ�(�����һ����������)
        % imshow(dct_block); % ��ʾdct��
        img_dct(i:i+7, j:j+7) = dct_block;
    end
end
figure;imshow(img_dct); xlabel('dct�任ͼ��')
% figure, imshow(img_dct); % ��ʾ���ɵ�dctϵ��

% 3��dct���任
new_img = zeros(row,col);
for i=1:n:row-7
    for j=1:n:col-7
        dct_block = img_dct(i:i+7, j:j+7);
        img_block = idct(dct_block,n,n); % Ҳ���øղ�ʵ�ֵ�(�����һ����������)
        new_img(i:i+7, j:j+7) = img_block;
    end
end
figure;imshow(new_img); xlabel('dct���任ͼ��')
% figure,  imshow(mat2gray(new_img)); % ��ʾ���任������ͼ��