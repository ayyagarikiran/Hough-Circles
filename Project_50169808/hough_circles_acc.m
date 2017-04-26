function acc = hough_circles_acc(BW, radius)    
    acc = zeros(size(BW));
    for x = 1 : size(BW, 2)
        for y = 1 : size(BW, 1)
            if (BW(y,x))
                for theta = linspace(0, 2 * pi, 360)
                    a = round(x + radius * cos(theta));                
                    b = round(y + radius * sin(theta));
                    if (a > 0 && a <= size(acc, 2) && b > 0 && b <= size(acc,1))
                        acc(b,a) = acc(b,a) + 1;
                    end
                end
            end
        end
    end
end
