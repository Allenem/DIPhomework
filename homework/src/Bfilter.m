function [image_out_low,image_out_high] = Bfilter(image_in, D0, N)
% Butterworth滤波器，在频率域进行滤波
% 输入为需要进行滤波的灰度图像，Butterworth滤波器的截止频率D0，阶数N
% 输出为滤波之后的低通和高通灰度图像

[m, n] = size(image_in);
P = 2 * m;
Q = 2 * n;

fp = zeros(P, Q);
%对图像填充0,并且乘以(-1)^(x+y) 以移到变换中心
for i = 1 : m
    for j = 1 : n
        fp(i, j) = double(image_in(i, j)) * (-1)^(i+j);
    end
end
% 对填充后的图像进行傅里叶变换
F = fft2(fp);

% 生成Butterworth滤波函数，中心在(m+1,n+1)
Bw_low = zeros(P, Q);
a = D0^(2 * N);
for u = 1 : P
    for v = 1 : Q
        temp = (u-(m+1.0))^2 + (v-(n+1.0))^2;
        Bw_low(u, v) = 1 / (1 + (temp^N) / a);
        Bw_high(u, v) = 1 / (1 + a / (temp^N));
    end
end

%进行滤波
G1 = F .* Bw_low;
G2 = F .* Bw_high;

% 反傅里叶变换
gp1 = ifft2(G1);
gp2 = ifft2(G2);

% 处理得到的图像
image_out_low = zeros(m, n, 'uint8');image_out_high = zeros(m, n, 'uint8');
gp1 = real(gp1);gp2 = real(gp2);
g1 = zeros(m, n);g2 = zeros(m, n);
for i = 1 : m
    for j = 1 : n
        g1(i, j) = gp1(i, j) * (-1)^(i+j);
        g2(i, j) = gp2(i, j) * (-1)^(i+j);        
    end
end

%归一
mmax1 = max(g1(:));mmax2 = max(g2(:));
mmin1 = min(g1(:));mmin2 = min(g2(:));
range1 = mmax1-mmin1;range2 = mmax2-mmin2;
for i = 1 : m
    for j = 1 : n
        image_out_low(i,j) = uint8(255 * (g1(i, j)-mmin1) / range1);
        image_out_high(i,j) = uint8(255 * (g2(i, j)-mmin2) / range2);
    end
end

end