% % ͬʱ�Աȶ�ʵ��
% clear;
% m=256;
% n=256;
% m0=100;
% n0=100;
% step=50;
% before_gray=128;
% ground_gray1=128-64;
% X1=ones(m,n)*ground_gray1;
% X1(m0:m0+step,n0:n0+step)=before_gray;
% figure('NumberTitle', 'off', 'Name', 'ͬʱ�Աȶ�ʵ��');
% subplot(121);
% imshow(uint8(X1));
% 
% ground_gray2=128+64;
% X2=ones(m,n)*ground_gray2;
% X2(m0:m0+step,n0:n0+step)=before_gray;
% subplot(122);
% imshow(uint8(X2));

% �ռ�ֱ��ʱ仯Ч��
clear;
Y1=imread('lena256.bmp');
figure('NumberTitle', 'off', 'Name', '�ռ�ֱ��ʱ仯Ч��');
subplot(231);
imshow(uint8(Y1));
title('256*256')

[a,b]=size(Y1);
Y2=Y1(1:2:a,1:2:b);
subplot(232);
imshow(uint8(Y2));
title('128*128')

Y3=Y1(1:4:a,1:4:b);
subplot(233);
imshow(uint8(Y3));
title('64*64')

Y4=Y1(1:8:a,1:8:b);
subplot(234);
imshow(uint8(Y4));
title('32*32')

Y5=Y1(1:16:a,1:16:b);
subplot(235);
imshow(uint8(Y5));
title('16*16')

Y5=Y1(1:32:a,1:32:b);
subplot(236);
imshow(uint8(Y5));
title('8*8')

% % ���ȷֱ��ʱ仯Ч��
% clear;
% Z1=imread('lena256.bmp');
% [a,b]=size(Z1);
% 
% figure('NumberTitle', 'off', 'Name', '���ȷֱ��ʱ仯Ч��');
% subplot(231);
% imshow(uint8(Z1));
% title('256��');
% 
% for i=1:a
%     for j=1:b
%         Z2(i,j)=4*(ceil(Z1(i,j)/4)-1);
%     end
% end
% subplot(232);
% imshow(uint8(Z2));
% title('64��');
% 
% for i=1:a
%     for j=1:b
%         Z3(i,j)=16*(ceil(Z1(i,j)/16)-1);
%     end
% end
% subplot(233);
% imshow(uint8(Z3));
% title('16��');
% 
% for i=1:a
%     for j=1:b
%         Z4(i,j)=32*(ceil(Z1(i,j)/32)-1);
%     end
% end
% subplot(234);
% imshow(uint8(Z4));
% title('8��');
% 
% for i=1:a
%     for j=1:b
%         Z5(i,j)=64*(ceil(Z1(i,j)/64)-1);
%     end
% end
% subplot(235);
% imshow(uint8(Z5));
% title('4��');
% 
% for i=1:a
%     for j=1:b
%         Z6(i,j)=128*(ceil(Z1(i,j)/128)-1);
%     end
% end
% subplot(236);
% imshow(uint8(Z6));
% title('2��');