function im = drawLines(BaseIm, startPos_endPos, foreground, PenSize)
% Draw lines on a image and returns image matrix
% im = drawLines(BaseIm, startPos_endPos, foreground, PenSize)
% BaseIm: Image matrix to draw on
% startPos_endPos: [lty ltx rby rbx; ...] (multiple lines acceptable)
% foreground: color value (scalar)
% PenSize: [ysize xsize] or [1x1]
%
% last modified 12/15/98
% (c) Copyright  Yukiyasu Kamitani  
%
% e.g. >> imshow(drawLines(zeros(200,200), [100 100  100 200], 0.5, [2 2]))

if size(PenSize) == [1 1]
  PenSize = [PenSize PenSize];
end 

num = size(startPos_endPos, 1); % number of lines
im = BaseIm;
startPos = startPos_endPos(:,1:2);
endPos = startPos_endPos(:,3:4);
penDot = foreground * ones(PenSize);
imSize = size(BaseIm);

linePos = [];
for k = 1:num
%  linePos = [];
  for i = floor(-(PenSize(1)-1)/2):floor((PenSize(1)-1)/2)
    for j= floor(-(PenSize(2)-1)/2):floor((PenSize(2)-1)/2)
      linePos = [linePos; onePixLine(startPos(k,:)+[i j], endPos(k,:)+[i j])];
    end
  end
end
linePos(find(linePos(:,1) <= 0 | linePos(:,1) > imSize(1) ...  
	     | linePos(:,2) <= 0 | linePos(:,2) > imSize(2)), :) = []  ;
linePos = sub2ind(size(BaseIm), linePos(:,1), linePos(:,2));
im(linePos) = foreground;

function positions = onePixLine(sPos, ePos)
dotNumber = max(abs(ePos - sPos)) +1;
if dotNumber > 1 	
  positions = round([sPos(1):(ePos(1)-sPos(1))/(dotNumber-1):ePos(1);...
  		   sPos(2):(ePos(2)-sPos(2))/(dotNumber-1):ePos(2)   ]');				   if ePos(1) == sPos(1) 
	positions(:,1) = [sPos(1) * ones(1, dotNumber)]';
	positions(:,2) = [sPos(2):(ePos(2)-sPos(2))/(dotNumber-1):ePos(2)]';
   end
   if ePos(2) == sPos(2) 
	positions(:,1) = [sPos(1):(ePos(1)-sPos(1))/(dotNumber-1):ePos(1)]';
	positions(:,2) = [sPos(2) * ones(1, dotNumber)]';
   end 
else
  positions(:,1) = [sPos(1) * ones(1, dotNumber)]';
  positions(:,2) = [sPos(2) * ones(1, dotNumber)]';
end
return





