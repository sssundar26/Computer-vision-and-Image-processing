I1=imread("eye-1.jpg");
I2=imread("Camera-1.jpg");
image1=rgb2gray(I1);
image2=rgb2gray(I2);
high_pass=fspecial('laplacian',0.8)
low_frequencies = imgaussfilt(image1,1);
high_frequencies =imfilter(image2,high_pass);
hybrid_image = (low_frequencies + high_frequencies)/2;
figure; imshow(image1); title("Original Image")
figure; imshow(low_frequencies); title("Gaussian filter")
figure;imshow(image2); title("Orginal image")
figure; imshow(high_frequencies); title("High pass filter")
figure;imshow(uint8(hybrid_image));title("Hybrid image")

