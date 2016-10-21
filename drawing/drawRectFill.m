function im = drawRectFill(BaseIm, TopLeft_BotRight, foreground)
% draw filled rectangle
% im = drawRectFill(BaseIm, TopLeft_BotRight, foreground)
% BaseIm: Image matrix to draw on
% LeftTop_RightBottom: [lty ltx rby rbx]
% foreground: color value
%
% last modified 12/8/98
% (c) Yukiyasu Kamitani  
%
% eg > imshow(drawRectFill(zeros (100,100), [20 20 50 50], 1))
%
[center hv] = tlbr2cntHV(TopLeft_BotRight);
rect = ones(hv);
rectInZeros = zeros(size(BaseIm));
rectInZeros = imageOnImage(rectInZeros, rect, center);

BaseIm(find(rectInZeros == 1)) = foreground;
im = BaseIm;

