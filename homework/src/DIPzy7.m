clear;
clc;



% %%%%%%%%%%% 1.������ֵ�˲�  &  ���ξ�ֵ�˲���  &  ����Ӧ��ֵ�˲�
% 
% img=imread('ckt-board-orig.tif');
% figure;
% subplot(231);imshow(img);xlabel('a.ԭͼ');
% % �����ܶ�0.1��˹������
% imgNoise=imnoise(img,'gaussian',0,0.01);
% subplot(232);imshow(imgNoise);xlabel('b.����');
% [m,n]=size(imgNoise);
% % ѡ��mask��С��maskΪ�ɵ�����3��5��7��9 ����
% mask=9;
% imgNoise=double(imgNoise);
% varNoise=var(imgNoise(:)); % ���������1
% % varNoise=(std2(imgNoise))^2; % ���������2
% % ������չ
% imgEx=[255*ones((mask-1)/2,n+(mask-1));255*ones(m,(mask-1)/2),imgNoise,255*ones(m,(mask-1)/2);255*ones((mask-1)/2,n+(mask-1))];
% temp=zeros(mask,mask);
% arithMean=zeros(m,n);
% geomeMean=zeros(m,n);
% adaptMean=zeros(m,n);
% 
% for x=1+(mask-1)/2:m+(mask-1)/2
%     for y=1+(mask-1)/2:n+(mask-1)/2
%         temp=imgEx(x-(mask-1)/2:x+(mask-1)/2,y-(mask-1)/2:y+(mask-1)/2); % mask����
%         varLocal=var(temp(:)); % �ֲ������1
%         % varLocal=(std2(temp))^2; % �ֲ������2
%         arithMean(x-(mask-1)/2,y-(mask-1)/2)=mean(mean(temp)); % ������ֵ
%         geomeMean(x-(mask-1)/2,y-(mask-1)/2)=(prod(prod(temp),2))^(1/(mask*mask)); % ���ξ�ֵ
%         adaptMean(x-(mask-1)/2,y-(mask-1)/2)=imgEx(x,y)-varLocal/0.01*(imgEx(x,y)-arithMean(x-(mask-1)/2,y-(mask-1)/2)); % ����Ӧ��ֵ
%     end
% end
% subplot(234);imshow(uint8(arithMean));xlabel('c.����ƽ��');
% subplot(235);imshow(uint8(geomeMean));xlabel('d.����ƽ��');
% subplot(236);imshow(uint8(adaptMean));xlabel('e.����Ӧƽ��');




% %%%%%%%%%%% 2.����Ӧ��ֵ�˲�  &  ��ֵ�˲�
% 
% im=imread('ckt-board-orig.tif');
% figure;
% subplot(221);imshow(im);xlabel('a.ԭͼ');
% 
% % �����ܶ�0.4��������
% iNoise=imnoise(im,'salt & pepper',0.4);
% subplot(222);imshow(iNoise);xlabel('b.����');
% 
% % ������ͨ��ֵ�˲�
% imMed=medfilt2(iNoise,[3 3]);
% imMed=medfilt2(imMed,[3 3]);
% subplot(223);imshow(imMed);xlabel('c.2����ֵ�˲�');
% 
% % ���ߴ�9*9������Ӧ��ֵ�˲���
% [w,h]=size(iNoise);
% nmin=3;nmax=9; % ��ʼ��nmin*nmin,���nmax*nmax
% imAdaptMed=iNoise; % ���帴ԭ��ͼ��
% % ��iNoise��չ
% imEx=[zeros((nmax-1)/2,h+(nmax-1));zeros(w,(nmax-1)/2),iNoise,zeros(w,(nmax-1)/2);zeros((nmax-1)/2,h+(nmax-1))];
% for x=1:w
%     for y=1:h
%         for n=nmin:2:nmax
%             % iNoise��ĳ��(x,y)������
%             Sxy=imEx(x+(nmax-1)/2-(n-1)/2:x+(nmax-1)/2+(n-1)/2,y+(nmax-1)/2-(n-1)/2:y+(nmax-1)/2+(n-1)/2);
%             Smax=max(max(Sxy));
%             Smin=min(min(Sxy));
%             Smed=median(median(Sxy));
%             if Smed>Smin && Smed<Smax
%                 if iNoise(x,y)<=Smin || iNoise(x,y)>=Smax
%                     imAdaptMed(x,y)=Smed;
% %                 else
% %                     imAdaptMed(x,y)=iNoise(x,y);
%                 end
%                 break  % ���������ѭ���ж�
%             end
%         end
%         imAdaptMed(x,y)=Smed; % �ﵽ��󴰿ڶ�û����������������ȡ�����ֵ
%         % imAdaptMed(x,y)=iNoise(x,y); % ����ԭֵ���ܴ�����
%     end
% end
% subplot(224);imshow(imAdaptMed);xlabel('d.����Ӧ��ֵ�˲�');




% %%%%%%%%%% ϰ��5.1 
% 
% I=zeros(244,233);
% for i=18:227 % �׵�����210px
%     for j=1:233
%         for k=1:9
%             if 24*k-7<=j&&j<=24*k % �׵�����7px
%                 I(i,j)=255;
%             end
%         end
%     end
% end
% figure
% subplot(2,2,1),imshow(I),title('ԭʼͼ��');
% K1=filter2(fspecial('average',3),I)/255;
% K2=filter2(fspecial('average',7),I)/255;
% K3=filter2(fspecial('average' ,9),I)/255;
% subplot(2,2,2),imshow(K1 ),title('3*3������ֵ�˲�ͼ��');
% subplot(2,2,3) ,imshow(K2),title('7*7������ֵ�˲�ͼ��');
% subplot(2,2,4),imshow(K3),title('9*9������ֵ�˲�ͼ��');



% %%%%%%%%%% ϰ��5.2
% 
% I=zeros(244,233);
% for i=18:227  % �׵�����210px
%     for j=1:233
%         for k=1:9
%             if 24*k-7<=j&&j<=24*k % �׵�����7px
%                 I(i,j)=255;
%             end
%         end
%     end
% end
% figure;
% subplot(221),imshow(I),title('ԭʼͼ��');
% F=I;G=I;H=I;M=I;
% for i=2:243
%     for j=2:232
%         P=F(i-1:i+1,j-1:j+1);
%         X=prod(prod(P),2);
%         G(i,j)=X^(1/9);
%     end
% end
% subplot(222),imshow(G),title('3*3����ƽ���˲�ͼ')
% for i=4:241
%     for j=4:230
%         P=F(i-3:i+3,j-3:j+3);
%         X=prod(prod(P),2);
%         H(i,j)=X^(1/49);
%     end
% end
% subplot(223),imshow(H),title('7*7����ƽ���˲�ͼ')
% for i=5:240
%     for j=5:229
%         P=F(i-4:i+4j-4j+4);
%         X=prod(prod(P),2);
%         M(i,j)=X^(1/81);
%     end
% end
% subplot(224),imshow(M),title('9*9����ƽ���˲�ͼ')




% %%%%%%%%%%% 3.��ͼ�����ģ�� H(u,v)=exp(-k*(u^2+v^2)^(5/6))����Ȼ��Ӱ׸�˹�������õ�����ͼ�������˲���ά���˲��ָ�ͼ��
% % img=imread('original_DIP.tif');
% % img=imread('aerial_view_no_turb.tif');
% img=imread('lena256.bmp');
% figure;
% subplot(231);imshow(img);xlabel('a.ԭͼ');
% f=double(img);
% F=fftshift(fft2(img)); % ԭͼ����Ҷ
% subplot(234);imshow(abs(F),[]);xlabel('b.����Ҷ�任����Ƶ��');
% [m,n]=size(F);
% H=zeros(m,n);  % ���ݺ���
% B=zeros(m,n);  % ģ������Ҷ
% F1=zeros(m,n); % ���˲�
% F2=zeros(m,n); % ά���˲�
% a=0.1;b=0.1;T=1;K=0.00259;
% for u=1:m
%     for v=1:n
%         H(u,v)=(T/(pi*(a*u+b*v)))*sin(pi*(a*u+b*v))*exp(-1i*pi*(a*u+b*v)); 
% %         H(u,v)=(T/(pi*(a*u)))*sin(pi*(a*u))*exp(-1i*pi*(a*u)); 
%         B(u,v)=H(u,v)*F(u,v);
%     end
% end
% blur=ifft2(ifftshift(B)); % ģ��
% blur=256*blur/max(max(blur));
% blur=uint8(real(blur));
% subplot(232);imshow(blur);xlabel('c.����Ҷ���任����ģ��ͼ��');
% 
% 
% % ģ���Ӹ�˹������
% g=imnoise(blur,'gaussian',0,0.01);
% subplot(235);imshow(abs(g));xlabel('d.ģ������ͼ��');
% g=double(g);
% G=fftshift(fft2(g)); % ģ���Ӹ�˹����������Ҷ
% 
% for u=1:m
%     for v=1:n
%         F1(u,v)=1/H(u,v)*G(u,v);
%         F2(u,v)=1/H(u,v)*(abs(H(u,v)))^2/((abs(H(u,v)))^2+K)*G(u,v);
%     end
% end
% 
% f1=ifft2(ifftshift(F1)); 
% f1=256.*f1./max(max(f1));
% f1=uint8(real(f1));
% subplot(233);imshow(f1);xlabel('e.���˲�ͼ��');
% 
% f2=ifft2(ifftshift(F2)); 
% f2=256.*f2./max(max(f2));
% f2=uint8(real(f2));
% subplot(236);imshow(f2);xlabel('f.ά���˲�ͼ��');


%%%%%%%%%%%����matlab������ͼ�����ģ������Ȼ��Ӱ׸�˹�������õ�����ͼ�������˲���ά���˲��ָ�ͼ��
% % ��ȡԭʼͼ��
% img=imread('lena256.bmp');
% % img = imread('original_DIP.tif');
% img = im2double(img);
% figure;
% subplot(331);
% imshow(img);
% title('Original image');
% 
% % % ����˵��
% % ��FSPECIAL('motion',LEN,THETA)Ϊ�˶�ģ�����ӣ���ʾ����������ʱ�뷽����theta�Ƕ��˶���len�����أ�len��Ĭ��ֵΪ9��theta��Ĭ��ֵΪ0��
% % ��imfilter(f, w, filtering_mode, boundary_options, size_options)��fΪ����ͼ��wΪ�˲���ģ��
% % filtering_mode����ָ�����˲���������ʹ�á���ء���corr�����ǡ��������conv����
% % boundary_options���ڴ���߽�������⣬�߽�Ĵ�С���˲����Ĵ�Сȷ��(��circular��ͼ���Сͨ����ͼ�񿴳���һ����ά���ں�����һ����������չ)��
% 
% % ģ��ͼ��
% PSF = fspecial('motion', 50, -45); 
% img1 = imfilter(img, PSF, 'conv', 'circular');
% subplot(332);
% imshow(img1);
% title('Blurred image');
% 
% % ��Ӹ�˹����
% noise_var = 0.000001;
% img2 = imnoise(img1, 'gaussian', 0, noise_var);
% subplot(333);imshow(img2);title(['add Gaussian noise with variance is ',num2str(noise_var)]);
% 
% % % ����˵��
% % deconvwnr(I��PSF��NSR)���У�Iֵ�˻���ͼ����ԭͼ����һ������ɢ����PSFȻ����ϼ����������õ���;
% % NSR���űȣ�����Ϊһ������Ҳ����Ϊ��Iͬ����С�ľ���Ĭ��ֵΪ0��
% 
% % ���˲���NSR��Ϊ0(���ű�Ϊ0������ά���˲��˻�Ϊ�������˲�)
% % Specifying 0 for the NSR is equivalent to creating an ideal inverse filter.
% img3 = deconvwnr(img2, PSF, 0.0);
% subplot(323);imshow(img3);title('Result of invense filtering using function of matlab');
% 
% % ����ά���˲����������űȴ���
% estimated_NSR = noise_var / var(img(:));
% img4 = deconvwnr(img2, PSF, estimated_NSR);
% subplot(324);imshow(img4);title('Result of Wiener filtering using function of matlab');
% 
% 
% g=double(img1);
% G=fftshift(fft2(g)); % ģ���Ӹ�˹����������Ҷ
% [m,n]=size(G);
% H=zeros(m,n);  % ���ݺ���
% F1=zeros(m,n); % ���˲�
% F2=zeros(m,n); % ά���˲�
% a=0.1;b=0.1;T=1;K=0.06;
% for u=1:m
%     for v=1:n
%         H(u,v)=(T/(pi*(a*u+b*v)))*sin(pi*(a*u+b*v))*exp(-1i*pi*(a*u+b*v)); 
%         F1(u,v)=1/H(u,v)*G(u,v);
%         F2(u,v)=1/H(u,v)*(abs(H(u,v)))^2/((abs(H(u,v)))^2+K)*G(u,v);
%     end
% end
% 
% f1=ifft2(ifftshift(F1)); 
% f1=256*f1/max(max(f1));
% f1=uint8(real(f1));
% subplot(325);imshow(f1);title('Result of invense filtering using function typed');
% 
% f2=ifft2(ifftshift(F2)); 
% f2=256*f2/max(max(f2));
% f2=uint8(real(f2));
% subplot(326);imshow(f2);title(['Result of Wiener filtering using function typed K= ',num2str(K)]);
% 
% 
