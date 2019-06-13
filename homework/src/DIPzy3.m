% ֱ��ͼ���⻯
clc;
clear;
rk=xlsread('imgdata.xlsx','sheet1','B1:I1');
pr=xlsread('imgdata.xlsx','sheet1','B2:I2');
len=length(rk);
sk=zeros(1,len);
sq=zeros(1,len);

sk(1)=pr(1);
for i=2:len
    sk(i)=sk(i-1)+pr(i);
end;
for i=1:len
    sq(i)=round((len-1)*sk(i));
end;

ps=zeros(1,len);
for i=1:len
    for j=1:len
         if(sq(j)==(i-1))
            ps(i)=ps(i)+pr(j);
        end;
    end;
end;

figure
subplot(221);stem(0:7,pr,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('ԭ����pr');
subplot(222);bar(0:7,sk);axis([-1 8 0 1]);ylim('auto');title('�任��sk');
subplot(223);stem(0:7,sq,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('������sq');
subplot(224);stem(0:7,ps,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('�¸���ps');
disp(['�Ҷȼ�rkΪ: ',num2str(rk)]);
disp(['ԭ����prΪ: ',num2str(pr)]);
disp(['�任��skΪ: ',num2str(sk)]);
disp(['������sqΪ: ',num2str(sq)]);
disp(['�¸���psΪ: ',num2str(ps)]);

% ���ͼ��ƽ��ȥ��˹������
clc;
clear;
I0=imread( 'lena.jpg');
I=rgb2gray(I0);
figure;
subplot(231);imshow(I);title('ԭͼ');
subplot(234);imshow(I);title('ԭͼ');
[a,b]=size(I);

% �Ӹ�˹������
noise=randn(a,b)*30;
I1=double(I)+noise;
subplot(232);imshow( uint8(I1));title('�Ӹ�˹������');

% ���ͼ��ƽ��ȥ��˹������
I2=zeros(a,b); 
for n=1:30
    noise=randn(a,b)*30;
    I1=double(I)+noise;
	I2=I2+double(I1);
end;
I2=I2/n;
subplot(233);imshow( uint8(I2));title('���ͼ��ƽ��ȥ��˹������');

% ���������
I3=zeros(a+2,b+2);
for n=1:a
    for m=1:b
        I3(n+1,m+1)=I(n,m);
    end;
end;
for n=0:100
    I3(ceil(rand*a),ceil(rand*b))=0;
end;
for n=0:200
    I3(ceil(rand*a),ceil(rand*b))=255;
end;
subplot(235);imshow(uint8(I3));title('���������');

% ��ֵȥ���������
I4=zeros(a,b);
for n=2:a
    for m=2:b        
        I4(n-1,m-1)=(I3(n-1,m-1)+I3(n-1,m)+I3(n-1,m+1)+I3(n,m-1)+I3(n,m)+I3(n,m+1)+I3(n+1 ,m-1 )+I3(n+1,m)+I3(n+1,m+1))/9;
    end;
end;
subplot(236);imshow(uint8(I4));title('��ֵȥ���������');

