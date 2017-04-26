function hough_transform_sobel(img,r_min,r_max)
subplot(2,2,1)
imshow(img)
img=rgb2gray(img);
gaussianFilter = fspecial('gaussian',3, 2);
blur_img=conv2(img,gaussianFilter);
sobelx=[-1, 0, 1;-2, 0, 2;-1, 0, 1];
sobely=[-1, -2, -1;0, 0, 0;1, 2, 1];

Filtx=conv2(blur_img,sobelx);
Filty=conv2(blur_img,sobely);

edge_det=sqrt((Filtx.^2)+(Filty.^2));
edge_det(edge_det>40)=255;
edge_det(edge_det<=40)=0;
imshow(uint8(edge_det))
BW=edge_det;
subplot(2,2,2)
imshow(BW)       
    centers = zeros(30, 2);
    radii = zeros(size(centers,1),1);
    row_num = 0;
    for r = linspace(r_min, r_max, 3)
        %hough transform accumulator array
        %function
        acc = hough_circles_acc(BW, r);
        %calculating the maximum of array
        accnorm = (acc ./ max(max(acc)));
        [mx,my] = find(accnorm > .66); 
        temp_centers = horzcat(mx,my);
  
        if (size(temp_centers,1) > 0)
            row_num_new = row_num + size(temp_centers,1);
            centers(row_num + 1:row_num_new,:) = temp_centers;
            radii(row_num + 1:row_num_new) = r;
            row_num = row_num_new;       
        end
    end
    centers = centers(1:row_num,:);
    radii = radii(1:row_num);
    
    subplot(2,2,3)
    imshow(img);
    hold on;
    for i = 1 : size(centers, 1)
        r = radii(i);
        center_x = centers(i, 2);
        center_y = centers(i, 1);
        theta = linspace(0, 2 * pi, 360);
        xx = center_x + r * cos(theta);
        yy = center_y + r * sin(theta);
        plot(xx, yy,'g', 'LineWidth', 1);
    end

    

