function idct_my = idct(f,m,n)
% Ҫ��fΪ8*8��
% m=n=8;
% f = (rand(n,n)*100); % ����8x8��
for i=0:m-1
    for j=0:n-1
        if i == 0
            c = sqrt(1/m);
        else
            c = sqrt(2/m);
        end
        A(i+1, j+1) = c * cos( (j + 0.5)* pi * i / m );
    end
end

idct_my = A'*f*A;

idct_matlab = idct2(f);
