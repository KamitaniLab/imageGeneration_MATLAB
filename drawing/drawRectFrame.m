function im = drawRectFrame(BaseIm, TopLeft_BotRight, foreground, penSize)
% draw frame rectangle
% im = drawRectFrame(BaseIm, TopLeft_BotRight, foreground, penSize)
% BaseIm: Image matrix to draw on
% LeftTop_RightBottom: [lty ltx rby rbx]
% foreground: color value
% penSize: [1x1]
%
% last modified 12/8/98
% (c) Yukiyasu Kamitani  
%
% eg > imshow(drawRectFrame(zeros (100,100), [20 20 50 50], 1,1))
%

[center hv] = tlbr2cntHV(TopLeft_BotRight);
% rect = ones(hv);
smallRect = zeros(hv - penSize*[1 1]);
largeRect = ones(hv + penSize*[1 1]);

rectInZeros = zeros(size(BaseIm));
rectInZeros = imageOnImage(rectInZeros, largeRect, center);
rectInZeros = imageOnImage(rectInZeros, smallRect, center);

BaseIm(find(rectInZeros == 1)) = foreground;
im = BaseIm;

