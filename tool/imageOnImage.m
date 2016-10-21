function im = imageOnImage(backIm, foreIm, CenterPos)
% put an image on another centered at CeterPos
% multiple poses acceptable
% centerPos can be non-integer

num = size(CenterPos, 1);
backImSize = size(backIm);
foreImSize = size(foreIm);
for i = 1:num
	leftTopPos = round(CenterPos(i,:) - (foreImSize-ones(1,2))/2); 
	rightBottomPos = [leftTopPos(1)+foreImSize(1)-1   leftTopPos(2)+foreImSize(2)-1];
	leftTopPosN = leftTopPos;
	rightBottomPosN = rightBottomPos;

	if leftTopPos(1) <= 0 	leftTopPosN(1) = 1; 			end
	if rightBottomPos(1) > backImSize(1)   	rightBottomPosN(1) = backImSize(1) ; end
	if leftTopPos(2) <= 0 				leftTopPosN(2) = 1; end
	if rightBottomPos(2) > backImSize(2)   	rightBottomPosN(2) = backImSize(2) ; end

% 	a = backIm(leftTopPosN(1):rightBottomPosN(1), leftTopPosN(2):rightBottomPosN(2));
% 	sa = size(a)
% 	
% 	b = foreIm(leftTopPosN(1)-leftTopPos(1)+1:rightBottomPosN(1)-leftTopPos(1)+1,...
% 			     leftTopPosN(2)-leftTopPos(2)+1:rightBottomPosN(2)-leftTopPos(2)+1);
% 	sb = size(b)
	
	backIm(leftTopPosN(1):rightBottomPosN(1), leftTopPosN(2):rightBottomPosN(2))...
		= foreIm(leftTopPosN(1)-leftTopPos(1)+1:rightBottomPosN(1)-leftTopPos(1)+1,...
			     leftTopPosN(2)-leftTopPos(2)+1:rightBottomPosN(2)-leftTopPos(2)+1);
end
im = backIm;
