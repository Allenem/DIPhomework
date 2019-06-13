function [im1,im2] = Gfilter(ima,D0)
% 高斯滤波器，在频率域进行滤波
% 输入为需要进行滤波的灰度图像photo，截止频率D0
% 输出为滤波之后的低通和高通灰度图像

[r,c] = size(ima); %获取输入图像的行和列
D = zeros(r,c); %D(u,v)是距频率矩形中心的距离

for i=1:r
   for j=1:c
       D(i,j)=sqrt((i-r/2)^2+(j-c/2)^2);
   end
end

%计算滤波器，得到高斯低高通滤波器
H1=exp(-(D.^2)/(2*D0*D0));
H2=1-H1;

F1=fft2(ima,size(H1,1),size(H1,2)); %对原图像进行傅里叶变换
F2=fft2(ima,size(H2,1),size(H2,2));

F1=fftshift(F1); %对傅里叶变换后的F进行中心移位
F2=fftshift(F2);

Fl=ifft2(ifftshift(H1.*F1)); %对中心移位后的F使用高斯低通滤波器后进行反FFT移动,并进行反变换
Fh=ifft2(ifftshift(H2.*F2));

im1=real(Fl); %从结果中获取幅度（或称频率谱）
im2=real(Fh);

im1=uint8(im1);
im2=uint8(im2);