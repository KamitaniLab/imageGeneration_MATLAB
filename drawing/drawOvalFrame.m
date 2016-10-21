function im = drawOvalFrame(BaseIm, TopLeft_BotRight, foreground, penSize)
% Draw frame oval image without PsychTB
% im = drawOvalFrame(BaseIm, TopLeft_BotRight, foreground, penSize)
% BaseIm: image to draw on
% TopLeft_BotRight: [lty ltx rby rbx]
% foreground: color value
% PenSize: [1x1] 
%
% last modified 12/8/98
% (c) Yukiyasu Kamitani  
%
% e.g. > imshow(drawOvalFrame(ones(150, 150), [50 50 90 90], 0.5, 1))
%

[center Axis] = tlbr2cntHV(TopLeft_BotRight);
Y = [-(Axis(1)+penSize -1)/2:1:(Axis(1)+ penSize-1)/2];  % size(V,1) = Axis(1)
X = [-(Axis(2)+penSize - 1)/2:1:(Axis(2)+penSize-1)/2];
XY = ones(size(Y))' * (X.*X/(size(X,2)/2)^2) + ...
	(Y.*Y/(size(Y,2)/2)^2)' * ones(size(X));	% oval large image

ovIm = 2 * ones(size(BaseIm));
ovIm = imageOnImage(ovIm, XY, center); % Put image

ovImFrame = zeros(size(BaseIm));

if (Axis(2)/2-penSize/2) > 0 & (Axis(1)/2-penSize/2) > 0
  XYsmall = ones(size(Y))' * (X.*X / (Axis(2)/2-penSize/2).^2) + ...
	        (Y.*Y/ (Axis(1)/2-penSize/2).^2)'* ones(size(X)) ;
	ovImSmall = 2*ones(size(BaseIm));
	ovImSmall = imageOnImage(ovImSmall, XYsmall, center); % Put image

	ovImFrame(find(ovIm <= 1)) = 1;		 
	ovImFrame(find(ovImSmall <= 1)) = 0;	% im = ovImFrame;	
	BaseIm(find(ovImFrame== 1)) = foreground;
	im = BaseIm;
else
	BaseIm(find(ovIm <= 1)) = foreground;
	im = BaseIm;
end
