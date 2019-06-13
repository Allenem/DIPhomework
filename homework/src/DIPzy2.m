% % 用matlab实现一种灰度变换增强图像
% Ao=imread('lena256.bmp');
% figure;
% subplot(221);
% imshow(uint8(Ao));title('原图');
% Aomax=max(max(Ao));
% Aomin=min(min(Ao));
% k1=50/double(Aomax-Aomin);
% k2=512/double(Aomax-Aomin);
% Ao1=k1*(Ao-Aomin);
% Ao2=k2*(Ao-Aomin);
% Ao3=double(Aomax-Aomin)-Ao;
% subplot(222);
% imshow(uint8(Ao1));title('灰度减弱');
% subplot(223);
% imshow(uint8(Ao2));title('灰度增强');
% subplot(224);
% imshow(uint8(Ao3));title('灰度反转');


% % 用matlab做出图像的直方图 （注意：不能直接调用 Matlab 中的直方图生成函数 imhist）
% % 直接调用 Matlab 中的直方图生成函数 imhist
% figure;
% subplot(231);imshow(Ao);title('原图');
% subplot(232);imhist(Ao);title('调用函数生成的原图直方图');
% ylim('auto')
% Ao4=histeq(Ao,256);
% subplot(234);imshow(Ao4);title('均衡后的图');
% subplot(235);imhist(Ao4);title('调用函数生成的均衡图直方图');
% ylim('auto')
% 
% % 不直接调用 Matlab 中的直方图生成函数 imhist
% [r,l]=size(Ao);
% count=zeros(1,256);
% for x=1:256
%     for i=1:r
%         for j=1:l
%             if(Ao(i,j)==(x-1))
%                 count(x)=count(x)+1;
%             end;
%         end;
%     end;
% end;
% subplot(233);stem(count,'Marker','none');axis([0 256 0 700]);title('未用函数生成的原图直方图');
% 
% [r,l]=size(Ao);
% count1=zeros(1,256);
% for x=1:256
%     for i=1:r
%         for j=1:l
%             if(Ao4(i,j)==(x-1))
%                 count1(x)=count1(x)+1;
%             end;
%         end;
%     end;
% end;
% subplot(236);stem(count1,'Marker','none');axis([0 256 0 700]);title('未用函数生成的均衡图直方图');


% 直方图均衡化
rk=xlsread('imgdata.xlsx','sheet1','B1:I1');
pr=xlsread('imgdata.xlsx','sheet1','B2:I2');
len=length(rk);
sk=zeros(1,len);
sq=zeros(1,len);

% sk(1)=pr(1);
% for i=2:len
%     sk(i)=sk(i-1)+pr(i);
% end;
% for i=1:len
%     sq(i)=round((len-1)*sk(i));
% end;
sk=round((7*rk).^(0.5)+0.5);
sq=sk-1;

ps=zeros(1,len);
for i=1:len
    for j=1:len
         if(sq(j)==(i-1))
            ps(i)=ps(i)+pr(j);
        end;
    end;
end;

figure
subplot(221);stem(0:7,pr,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('原概率pr');
subplot(222);bar(0:7,sk);axis([-1 8 0 1]);ylim('auto');title('变换后sk');
subplot(223);stem(0:7,sq,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('量化后sq');
subplot(224);stem(0:7,ps,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('新概率ps');
disp(['灰度级rk为: ',num2str(rk)]);
disp(['原概率pr为: ',num2str(pr)]);
disp(['变换后sk为: ',num2str(sk)]);
disp(['量化后sq为: ',num2str(sq)]);
disp(['新概率ps为: ',num2str(ps)]);
