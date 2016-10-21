function im = drawOvalFill(BaseIm, TopLeft_BotRight, foreground)
% Draw oval image without PsychTB
% im = drawOvalFill(BaseIm, TopLeft_BotRight, foreground)
% BaseIm: image to draw on
% TopLeft_BotRight: [lty ltx rby rbx]
% foreground: color value
%
% last modified 12/15/98
% (c) Yukiyasu Kamitani  
%
% eg>imshow(drawOvalFill(ones(150, 150), [50 50 90 90], 0.5))

[center Axis] = tlbr2cntHV(TopLeft_BotRight);
Y = [-(Axis(1)-1)/2:1:(Axis(1)-1)/2];  % size(V,1) = Axis(1)
X = [-(Axis(2)-1)/2:1:(Axis(2)-1)/2];

XY = ones(Axis(1),1) * (X.*X/(Axis(2)/2)^2) + (Y.*Y/(Axis(1)/2)^2)' * ones(1, Axis(2));	% oval image

ovIm = 2*ones(size(BaseIm));
ovIm = imageOnImage(ovIm, XY, center); % Put image
BaseIm(find(ovIm <= 1)) = foreground;
im = BaseIm;
