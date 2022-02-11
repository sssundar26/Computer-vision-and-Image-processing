%3A
I=imread("horse1-2.jpg"); figure; imshow(I)
%3B
res=imresize(I,1/3); figure; imshow(res)
%3C
gray=rgb2gray(I); figure; imshow(gray)
bw=im2bw(I,0.5); figure; imshow(bw)
%3D
figure; imhist(gray)
%3E
e=double(gray);
e1= uint8(255-e); figure; imshow(e1)
figure; imhist(e1)
e21= uint8(20*log(e+1)); figure; imshow(e21); figure; imshow(e21)
e22= uint8(40*log(e+1)); figure; imshow(e22); figure; imhist(e22)
e31= e>100; figure; imshow(e31); figure;imhist(e31)
e32= e>150; figure; imshow(e32); figure; imhist(e32)
e4 = e + 50; 
e4(e>175) = 225;
e4(e<=-25) = 25;
figure; imshow(uint8(e4)); figure; imhist(uint8(e4))
e5= (e-min(min(e)))/(max(max(e))-min(min(e)));
e5=e5*200;
figure; imshow(uint8(e5));figure; imhist(uint8(e5))
old_cont=max(max(e))-min(min(e));
%3F
filter1 = ones(3,3)/9;
f1 = uint8(double(gray) + normrnd(0,10,563,1000));
f2 = imfilter(f1,filter1);
figure;imshow(f1)
figure;imshow(f2)
%3G
filter2 = [-1 -1 -1;-1 9 -1;-1 -1 -1];
g = imfilter(I,filter2);
figure; imshow(g)
