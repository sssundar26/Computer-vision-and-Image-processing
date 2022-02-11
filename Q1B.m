InputIm=imread("valley.jpg");
total=size(InputIm,1)*size(InputIm,2);
[counts,binLocations] = imhist(InputIm);
counts=counts/total;
figure; plot(binLocations,counts); title("PDF")
sum=0;
cdf=zeros(256,1);
for i=1:256
	sum=sum+counts(i);
	cdf(i)= sum;
end  
output=floor(cdf*255) ;
figure;plot(binLocations,cdf); title("CDF")
OutputIm=zeros(683,1024);
for i=1:683
    for j=1:1024
        OutputIm(i,j)=output(InputIm(i,j)+1);       
    end
end
figure; imshow(InputIm);title("Original image")
figure; imhist(InputIm);title("Histogram of original image")
figure; imshow(uint8(OutputIm)); title("Transformed image")
figure;imhist(uint8(OutputIm)); title("Histogram of transformed image")

pixels=double(InputIm);
denom=max(max(pixels))-min(min(pixels));
C= (pixels-min(min(pixels)))/denom;
C=C*255;
figure(); imshow(uint8(C)); title("Stretched image")
figure(); imhist(uint8(C)); title("Histogram of Stretched image")


figure;
subplot(1,2,1)
imshow(InputIm);title("Original image")
subplot(1,2,2)
imshow(uint8(OutputIm)); title("Histogram equalization image")


figure;
subplot(1,2,1)
imhist(InputIm);title("Histogram of Original image")
subplot(1,2,2)
imhist(uint8(OutputIm)); title("Histogram of transformed image")

figure;
subplot(1,2,1)
imshow(InputIm);title("Original image")
subplot(1,2,2)
imshow(uint8(C)); title("Histogram stretched image")

figure;
subplot(1,2,1)
imhist(InputIm);title("Histogram of Original image")
subplot(1,2,2)
imhist(uint8(C)); title("Histogram of stretched image")




