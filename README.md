# DIP homework , source code(matlab)& reference books

## Ⅰ.CONTENT

```
│  README.md
│
├─homework
│  │  作业1（第二章）.pdf
│  │  作业2（第三章）.pdf
│  │  作业3（第三章）.pdf
│  │  作业4（第三章）.pdf
│  │  作业5（第四章）.pdf
│  │  作业6（第四章）.pdf
│  │  作业7（第五章）.pdf
│  │  作业8(第8章）.pdf
│  │  作业9(第10章）.pdf
│  │  作业10（第11章）_yang.doc
│  │  蒲尧201630258438作业1.pdf
│  │  蒲尧201630258438作业2.pdf
│  │  蒲尧201630258438作业3.pdf
│  │  蒲尧201630258438作业4.pdf
│  │  蒲尧201630258438作业6.pdf
│  │  蒲尧201630258438作业7.pdf
│  │  蒲尧201630258438作业8.pdf
│  │
│  └─src
│          aerial_view_no_turb.tif
│          Bfilter.m
│          ckt-board-orig.tif
│          color2gray.m
│          colordivider.m
│          dct.m
│          DIPzy1.m
│          DIPzy2.m
│          DIPzy3.m
│          DIPzy4.m
│          DIPzy6.m
│          DIPzy7.m
│          DIPzy8_1.m
│          DIPzy8_2.m
│          DIPzy8_3.m
│          download.jpg
│          Esther Heesch.jpg
│          Esther Heesch1.jpg
│          Esther Heesch2.jpg
│          Gfilter.m
│          idct.m
│          img1.jpg
│          img2.jpg
│          img3.jpg
│          img4.jpg
│          img5.jpg
│          img6.jpg
│          img7.jpg
│          imgdata.xlsx
│          lena.jpg
│          lena256.bmp
│          lena_1.jpg
│          original_DIP.tif
│          test.png
│
└─reference books
        Digital Image Processing 3rd Edition.pdf
        DIP_3E_Manual_Master_File（answer）.pdf
        MATLAB版冈萨雷斯+中文高清版.pdf
```

## Ⅱ.Introduction

### 作业

以下是实验作业的简单列举，代码在 `./homework/src/DIPzy*` ，*为对应作业序号。有些m文件会调用函数、图片、excel等文件，请视情况下载。

- 作业一

1、用matlab程序实现同时对比度实验。

2、用matlab 程序实验空间分辨率变化效果。

3、用matlab程序实验幅度分辨率变化效果。

- 作业二

1、用matlab实现一种灰度变换增强图像。

2、用matlab做出图像的直方图(注意:不能直接调用Matlab中的直方图生成函数imhist)。

- 作业三

1、用matlab实现图像的直方图均衡化

2、用matlab 实现多幅图像平均去高斯白噪声

- 作业四

1、用matlab实现均值滤波去除高斯白噪声.不能用Imfilter(X,mask)

2、用matlab 实现中值滤波去除脉冲噪声，不能用nedian(a)

3、分别用Laplacian算子和sobel算子实现图像的锐化增强，并对比实验结果。

- 作业六

实验作业

1、用理想低通滤波器在频率域实现低通滤波

2、用理想高通滤波器在频率域实现高频增强(可能用到的函数fft2( )，f1iplr(H)， flipud(H) )

提升作业(不要求，有兴趣的同学可以做一下):

1、用巴特沃斯低通滤波器和高斯低通滤波器实现图像的低通滤波。

2、用巴特沃斯低通滤波器和高斯低通滤波器实现图像的高频增强。

- 作业七

实验作业(1和2选做一题，第3题必做)

1、用matlab (或C语言)实现自适应均值滤波,并和算术均值滤波的结果做对比;

2、用matlab (或C语言)实现自适应中值滤波,并和中值滤波的结果做对比;

3、用式(5.6-3)对图像进行模糊H(u,v)=e^(-k(U^2+v^2)^(5/6))处理，然后加白高斯噪声，得到将质图像。用逆滤波和维纳滤波恢复图像，对结果进行分析。

- 作业八

1、分别用区域编码和阈值编码方法实现图像压缩，用8X8DCT变换，保留50%的系数(区域编码保留前50%个系数，阈值编码保留50%的大系数)，并对解码图像进行比较。

(要求: DCT 要自己实现，不能用matlab中的DCT函数)

### 参考书

`Digital Image Processing 3rd Edition.pdf` 数字图像处理第三版英文版PDF电子书

`DIP_3E_Manual_Master_File（answer）.pdf` 数字图像处理第三版答案英文版PDF电子书

`MATLAB版冈萨雷斯+中文高清版.pdf` 数字图像处理MATLAB编程教学PDF电子书

## Ⅲ.Link

DIP3/e: Book Images Downloads Link: http://imageprocessingplace.com/DIP-3E/dip3e_book_images_downloads.htm