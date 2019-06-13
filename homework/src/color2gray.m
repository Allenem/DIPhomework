lenna = imread('lena.jpg');
[row,col,channel]= size(lenna);
lenna_gray = zeros(row,col);
for r =1: row
    for l =1: col
        lenna_gray(r,l) = 2/5 * lenna(r,l,1)+ 2/5 * lenna(r, l, 2) + 1 / 5* lenna(r, l, 3);
    end;
end;
lenna_gray_rgb2gray=rgb2gray(lenna);
% Matlab 中采用的是对R、G、B分量进行加权平均的算法：
% 0.2989R+ 0.5870G + 0.1140B
% function imgray=rgbimage2gray(imrgb)
% [m,n,t]=size(imrgb);
% for i=1:m
%     for j=1:n
%         for k=1:t
%             imgray(i,j,k)=0.299*imrgb(i,j,1)+0.587*imrgb(i,j,2)+0.11400*imrgb(i,j,3);%加权实现从真彩到灰度的降维转换
%         end   
%     end
% end
figure
subplot(121);imshow(uint8(lenna_gray));
subplot(122);imshow(uint8(lenna_gray_rgb2gray));
imwrite(uint8(lenna_gray),'lena_1.jpg');