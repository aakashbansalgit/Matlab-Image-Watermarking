function y=ext_watermark(A,B,C)

% defining the image names that have beeen used
A = 'test.jpg';
B = 'watermark.png';
C = 'watermarked.png';
%---------------------

%reading the base image
readimage=imread(A);

%taking size of image
[m n p]=size(readimage);

%using matlab dwt2 function for dicrete wavelet transform
[readimage_LL,readimage_LH,readimage_HL,readimage_HH]=dwt2(readimage,'haar');
water_mark=imread(B);
water_mark=imresize(water_mark,[m n]);
[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');
wm=imread(C);
[wm_LL,wm_LH,wm_HL,wm_HH]=dwt2(wm,'haar');
output_watermark= (wm_LL-readimage_LL)/0.03;
ext=idwt2(output_watermark,water_mark_LH,water_mark_HL,water_mark_HH,'haar');
figure
imshow(uint8(ext));
title('output watermark');
end