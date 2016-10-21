function im = drawPolygon(BaseIm, dotPos, foreground)
% Draw line and returns imgage matrix
% im = drawPolygon(BaseIm, dotPos, foreground)
% BaseIm: Image matrix to draw on
% dotPos: [y1 x1; y2 x2;...]
% forground : color 
%
% last modified 12/8/98
% (c) Yukiyasu Kamitani  
%
% eg >> imshow(drawPolygon(ones(100,100), [10 10 ; 90 30 ;  90 90], 0.5))

xv = [dotPos(:,1); dotPos(1,1)];
yv = [dotPos(:,2); dotPos(1,2)];

zeroImage = zeros(size(BaseIm));
index = find(zeroImage == 0);
[x y] = ind2sub(size(BaseIm), index); 

in = inpolygon(x,y,xv,yv);
xSub = x(find(in >= 0.5));
ySub = y(find(in >= 0.5));

BaseIm(sub2ind(size(BaseIm), xSub, ySub)) = foreground;
im = BaseIm;






