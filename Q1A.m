    im=imread("tiger-1.jpg");
    D = double(im(:,:));
    K=imresize(im,[1500 1500]);
    rows = size(im,1);
    col = size(im,2);    
    Rowscale = rows / 1500;
    Colscale = col / 1500;
    [colout, rout] = meshgrid(1 : 1500, 1 : 1500);
    rout = rout * Rowscale;
    colout = colout * Colscale;
    r = floor(rout);
    c = floor(colout);
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > rows - 1) = rows - 1;
    c(c > col - 1) = col - 1;
   
    % Fiding four points for linear interpolation
    index1 = sub2ind([rows, col], r, c);
    index2 = sub2ind([rows, col], r+1,c);
    index3 = sub2ind([rows, col], r, c+1);
    index4 = sub2ind([rows, col], r+1, c+1); 

    temp1 = D(index1).*(1 - (rout - r)).*(1 - (colout - c)) + D(index2).*((rout - r)).*(1 - (colout - c));
    temp2 = D(index3).*(1 - (rout - r)).*((colout - c)) + D(index4).*((rout - r)).*((colout - c));
    resizeimg= temp1+temp2;
    figure; imshow(uint8(resizeimg)); title("Resize using Bilinear interpolation");
    figure; imshow(K); title("Resize using imresize");