% % ��matlabʵ��һ�ֻҶȱ任��ǿͼ��
% Ao=imread('lena256.bmp');
% figure;
% subplot(221);
% imshow(uint8(Ao));title('ԭͼ');
% Aomax=max(max(Ao));
% Aomin=min(min(Ao));
% k1=50/double(Aomax-Aomin);
% k2=512/double(Aomax-Aomin);
% Ao1=k1*(Ao-Aomin);
% Ao2=k2*(Ao-Aomin);
% Ao3=double(Aomax-Aomin)-Ao;
% subplot(222);
% imshow(uint8(Ao1));title('�Ҷȼ���');
% subplot(223);
% imshow(uint8(Ao2));title('�Ҷ���ǿ');
% subplot(224);
% imshow(uint8(Ao3));title('�Ҷȷ�ת');


% % ��matlab����ͼ���ֱ��ͼ ��ע�⣺����ֱ�ӵ��� Matlab �е�ֱ��ͼ���ɺ��� imhist��
% % ֱ�ӵ��� Matlab �е�ֱ��ͼ���ɺ��� imhist
% figure;
% subplot(231);imshow(Ao);title('ԭͼ');
% subplot(232);imhist(Ao);title('���ú������ɵ�ԭͼֱ��ͼ');
% ylim('auto')
% Ao4=histeq(Ao,256);
% subplot(234);imshow(Ao4);title('������ͼ');
% subplot(235);imhist(Ao4);title('���ú������ɵľ���ͼֱ��ͼ');
% ylim('auto')
% 
% % ��ֱ�ӵ��� Matlab �е�ֱ��ͼ���ɺ��� imhist
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
% subplot(233);stem(count,'Marker','none');axis([0 256 0 700]);title('δ�ú������ɵ�ԭͼֱ��ͼ');
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
% subplot(236);stem(count1,'Marker','none');axis([0 256 0 700]);title('δ�ú������ɵľ���ͼֱ��ͼ');


% ֱ��ͼ���⻯
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
subplot(221);stem(0:7,pr,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('ԭ����pr');
subplot(222);bar(0:7,sk);axis([-1 8 0 1]);ylim('auto');title('�任��sk');
subplot(223);stem(0:7,sq,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('������sq');
subplot(224);stem(0:7,ps,'Marker','none');axis([-1 8 0 1]);ylim('auto');title('�¸���ps');
disp(['�Ҷȼ�rkΪ: ',num2str(rk)]);
disp(['ԭ����prΪ: ',num2str(pr)]);
disp(['�任��skΪ: ',num2str(sk)]);
disp(['������sqΪ: ',num2str(sq)]);
disp(['�¸���psΪ: ',num2str(ps)]);
