% ��ֵ���뱣�� 50%�Ĵ�ϵ����ֵ

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

% 2������, ��ֵ���뱣�� 50%�Ĵ�ϵ����ֵ��ʹ�þ�����С����λ���ĵ���Ϊ0�����ϡ��
arr=dct_img(:); % �����������
M = median(arr); % ����λ��
dct_img(abs(dct_img)<M)=0; 
subplot(224),imshow(1000*abs(dct_img), colormap(gray(5)));
colorbar;
xlabel('��ֵ����dct�任ͼ��')

% 3�����任����
% new_img = idct2(dct_img); % ϵͳ�Դ�����
new_img = idct(dct_img,m,n); % �Լ�д�ĺ���
new_img = mat2gray(new_img);
subplot(223),imshow(new_img); 
xlabel('dct���任ͼ��')