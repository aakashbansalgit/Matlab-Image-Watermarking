function y= watermark(A,B)
A = 'test.jpg';
B = 'watermark.png';
readimage=imread(A);
[m n p]=size(readimage);
subplot(1,3,1)
imshow(readimage);
title('Original Image');
[readimage_LL,readimage_LH,readimage_HL,readimage_HH]=dwt2(readimage,'haar');
water_mark=imread(B);
water_mark=imresize(water_mark,[m n]);

subplot(1,3,2)
imshow(water_mark)
title('Watermark');
[water_mark_LL,water_mark_LH,water_mark_HL,water_mark_HH]=dwt2(water_mark,'haar');
water_marked_LL = readimage_LL + (0.03*water_mark_LL);
watermarked=idwt2(water_marked_LL,readimage_LH,readimage_HL,readimage_HH,'haar');
subplot(1,3,3)
imshow(uint8(watermarked));
title('Watermarked image');
imwrite(uint8(watermarked),'Watermarked.png');
y='Watermarked succesfully';
end