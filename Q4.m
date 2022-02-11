Image=imread("lotus-flower-1.jpg");
gray=rgb2gray(Image);
figure;
subplot(1,2,1);imshow(Image);title("Colored Image");
subplot(1,2,2);imshow(gray);title("Gray scale Image");
I = im2uint8(gray(:));
num_bins = 256;
counts = imhist(I,num_bins);
%Step 2: Calculate group mean
p = counts / sum(counts);
omega = cumsum(p);
mu = cumsum(p .* (1:num_bins)');
mu_t = mu(end);
%Step 3: find the maximum value of 
sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));
maxval = max(sigma_b_squared);
idx = mean(find(sigma_b_squared == maxval));
%Step 4: Thresholding and get final image
level = (idx - 1) / (num_bins - 1);
BW = gray > level*256;
figure; imshow(BW);title("Black and white image using Otsu's method");
disp(level*256);

%k-means
X=reshape(Image,size(Image,1)*size(Image,2),size(Image,3));
% segmentation with different K values
K=[2 3 4 5];
figure;
for i = 1:4
[L,Centers] = kmeans(double(X),K(i));
Y = reshape(L,size(Image,1),size(Image,2)); 
B = labeloverlay(Image,Y);
subplot (2,2,i);
imshow(B);
title("K="+num2str(K(i)));
end

%Sobel
a=double(gray);
op = [1 2 1; 0 0 0;-1 -2 -1]/8; x_mask = op';  y_mask = op;
fx = imfilter(a,x_mask,'replicate');
fy = imfilter(a,y_mask,'replicate');
subplot(1,2,1);
imshow((fx.*fx+fy.*fy)>150); 
title("High Threshold");
subplot(1,2,2);
imshow((fx.*fx+fy.*fy)>50); 
title("Low Threshold");

Image=imread("lotus-flower-1.jpg");
gray=rgb2gray(Image);
a=double(gray);


figure;
imshow(edge(a, 'sobel', 5))
title("Low cutoff")
figure;
imshow(edge(a, 'sobel', 10))
title("High Cutoff")

K= [-1 -1 -1;-1 8 -1;-1 -1 -1];  %Edge Detection
Y3 = imfilter(image,K);

figure; imshow(Y3)



