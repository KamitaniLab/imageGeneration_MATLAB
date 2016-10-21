function im = randDot(vhSize, dotSize, dotCol, backCol, density)
% rdIm generates random dot display 
% im = randDot(hvSize, dotSize, dotCol, backCol, density)
% hvSize: [Image heigh, Image width]
% dotSize: Size of each dot in pixel (1x1)
% dotCol, backCol: color value
% density: density of white dots in ratio
%  
% PsychphysToolbox NOT required

sourceRdImSize = ceil(vhSize/dotSize);
sourceRdIm = rand(sourceRdImSize); 
sourceRdIm01 = backCol * ones(sourceRdImSize);
sourceRdIm01(find(sourceRdIm < density)) = dotCol;
im = imresize(sourceRdIm01, dotSize); % magnify;
im = im(1:vhSize(1), 1:vhSize(2));


