
clc;
clear;
I=imread( 'download.jpg');
I0=rgb2gray(I);
[a,b]=size(I0);
figure;
subplot(331);imshow(I0);title('ԭͼ');
subplot(334);imshow(I0);title('ԭͼ');
subplot(337);imshow(I0);title('ԭͼ');

% �Ӹ�˹����
noise=randn(a,b)*20;
I1=double(I0)+noise;
subplot(332);imshow( uint8(I1));title('�Ӹ�˹������');

% ��չ
I2=zeros(a+2,b+2);
for m=1:a
    for n=1:b
        I2(m+1,n+1)=I1(m,n);
    end;
end;

% ��ֵ�˲�ȥ����˹������
I3=zeros(a,b);
for m=2:a+1
    for n=2:b+1       
        I3(m-1,n-1)=(I2(m-1,n-1)+I2(m-1,n)+I2(m-1,n+1)+I2(m,n-1)+I2(m,n)+I2(m,n+1)+I2(m+1 ,n-1 )+I2(m+1,n)+I2(m+1,n+1))/9;
    end;
end;
subplot(333);imshow(uint8(I3));title('��ֵȥ����˹������');

% �ӽ����������
I4=I0;
for n=0:100
    I4(ceil(rand*a),ceil(rand*b))=0;
end;
for n=0:100
    I4(ceil(rand*a),ceil(rand*b))=255;
end;
subplot(335);imshow(uint8(I4));title('�ӽ����������');

% ��չ
I5=zeros(a+2,b+2);
for m=1:a
    for n=1:b
        I5(m+1,n+1)=I4(m,n);
    end;
end;

% ��ֵȥ�������������
I6=zeros(a,b);
for m=2:a+1
    for n=2:b+1
        temp1=[I5(m-1,n-1),I5(m-1,n),I5(m-1,n+1),I5(m,n-1),I5(m,n),I5(m,n+1),I5(m+1 ,n-1 ),I5(m+1,n),I5(m+1,n+1)];
        temp2=sort(temp1);
        I6(m-1,n-1)=temp2(5);
    end;
end;
subplot(336);imshow(uint8(I6));title('��ֵȥ�������������');

% ֱ����չ
I7=zeros(a+2,b+2);
for m=1:a
    for n=1:b
        I7(m+1,n+1)=I0(m,n);
    end;
end;

% �� Laplacian ����ʵ��ͼ�������ǿ
%  Laplacian ����
% [ 0 -1  0
%  -1  5 -1
%   0 -1  0]
I8=zeros(a,b);
for m=2:a+1
    for n=2:b+1       
        I8(m-1,n-1)=-I7(m-1,n)-I7(m,n-1)+5*I7(m,n)-I7(m,n+1)-I7(m+1,n);
    end;
end;
subplot(338);imshow(uint8(I8));title('�� Laplacian ��������ǿ');

% �� sobel ����ʵ��ͼ�������ǿ
%  sobel ����
% [-1 -2 -1
%   0  0  0
%   1  2  1]
% [-1  0  1
%  -2  0  2
%  -1  0  1]
I9=zeros(a,b);
for m=2:a+1
    for n=2:b+1       
        I9(m-1,n-1)=abs(-I7(m-1,n-1)-2*I7(m-1,n)-I7(m-1,n+1)+I7(m+1,n-1)+2*I7(m+1,n)+I7(m+1,n+1))+abs(-I7(m-1,n-1)-2*I7(m,n-1)-I7(m+1,n-1)+I7(m-1,n+1)+2*I7(m,n+1)+I7(m+1,n+1));
    end;
end;
subplot(339);imshow(uint8(I9));title('�� sobel ��������ǿ');