function [im1,im2] = Gfilter(ima,D0)
% ��˹�˲�������Ƶ��������˲�
% ����Ϊ��Ҫ�����˲��ĻҶ�ͼ��photo����ֹƵ��D0
% ���Ϊ�˲�֮��ĵ�ͨ�͸�ͨ�Ҷ�ͼ��

[r,c] = size(ima); %��ȡ����ͼ����к���
D = zeros(r,c); %D(u,v)�Ǿ�Ƶ�ʾ������ĵľ���

for i=1:r
   for j=1:c
       D(i,j)=sqrt((i-r/2)^2+(j-c/2)^2);
   end
end

%�����˲������õ���˹�͸�ͨ�˲���
H1=exp(-(D.^2)/(2*D0*D0));
H2=1-H1;

F1=fft2(ima,size(H1,1),size(H1,2)); %��ԭͼ����и���Ҷ�任
F2=fft2(ima,size(H2,1),size(H2,2));

F1=fftshift(F1); %�Ը���Ҷ�任���F����������λ
F2=fftshift(F2);

Fl=ifft2(ifftshift(H1.*F1)); %��������λ���Fʹ�ø�˹��ͨ�˲�������з�FFT�ƶ�,�����з��任
Fh=ifft2(ifftshift(H2.*F2));

im1=real(Fl); %�ӽ���л�ȡ���ȣ����Ƶ���ף�
im2=real(Fh);

im1=uint8(im1);
im2=uint8(im2);