% colordivider

% �ԶԻ������ʽѡ���һ��ͼ��
[FileName,FilePath]=uigetfile('*.jpg;*.png;*.tif;*.img;*.gif;*.bmp;*.jpeg;','��ѡ��ͼ������');
str=[FilePath FileName];

% % ��1��
Y1=imread(str);
[r,l,c]=size(Y1);
Y2=Y1(:,:,1);
Y3=Y1(:,:,2);
Y4=Y1(:,:,3);

figure('NumberTitle', 'off', 'Name', '������ԭɫ');
subplot(141);imshow(uint8(Y1));title('ԭͼ')
subplot(142);imshow(uint8(Y2));title('��ͼ')
subplot(143);imshow(uint8(Y3));title('��ͼ')
subplot(144);imshow(uint8(Y4));title('��ͼ')

% % ��2��
Image=imread(str);
%���ò���
Gray=rgb2gray(Image);
R=Image(:,:,1); G=Image(:,:,2); B=Image(:,:,3);
diff_R=0; diff_G=0; diff_B=0;  % ���ú졢�̡���������ɫ��ȡ��ֵ��Խ��Խ�ϸ�

%��ɫ��ȡ
Image_R=Image;
RP_R=Image(:,:,1); RP_G=Image(:,:,2); RP_B=Image(:,:,3);
XYR=~((R-G)>diff_R&(R-B)>diff_R);  % ��ȡ��ɫ������R������G��B������ֵ�����趨
Mask=Gray(XYR);  % ����Ƭ��Ĥ
RP_R(XYR)=Mask; RP_G(XYR)=Mask; RP_B(XYR)=Mask;  % ʹ�÷Ǻ�ɫ�����Ϊ��ɫ
Image_R(:,:,1)=RP_R; Image_R(:,:,2)=RP_G;Image_R(:,:,3)=RP_B;

%��ɫ��ȡ
Image_G=Image;
GP_R=Image(:,:,1); GP_G=Image(:,:,2); GP_B=Image(:,:,3);
XYG=~((G-R)>diff_G&(G-B)>diff_G);  % ��ȡ��ɫ������G������R��B������ֵ�����趨
Mask=Gray(XYG);  % ����Ƭ��Ĥ
GP_R(XYG)=Mask; GP_G(XYG)=Mask;GP_B(XYG)=Mask;  % ʹ�÷���ɫ�����Ϊ��ɫ
Image_G(:,:,1)=GP_R; Image_G(:,:,2)=GP_G;Image_G(:,:,3)=GP_B;

%��ɫ��ȡ
Image_B=Image;
BP_R=Image(:,:,1);BP_G=Image(:,:,2);BP_B=Image(:,:,3);
XYB=~((B-R)>diff_B&(B-G)>diff_B);  % ��ȡ��ɫ������G������R��B������ֵ�����趨
Mask_B=Gray(XYB);  % ����Ƭ��Ĥ
BP_R(XYB)=Mask_B; BP_G(XYB)=Mask_B;BP_B(XYB)=Mask_B;  % ʹ�÷���ɫ�����Ϊ��ɫ
Image_B(:,:,1)=BP_R; Image_B(:,:,2)=BP_G;Image_B(:,:,3)=BP_B;

%��ʾ���
figure('NumberTitle', 'off', 'Name', '��ʾ��ԭɫ');
subplot(2,2,1),imshow(Image); title('Image');
subplot(2,2,2),imshow(Image_R); title('Red Pass');
subplot(2,2,3),imshow(Image_G); title('Green Pass');
subplot(2,2,4),imshow(Image_B); title('Blue Pass');
% ��ʾԭͼ��R/G/B��ɫ��ȡ����Ա�ͼ����ʾ��ǩ