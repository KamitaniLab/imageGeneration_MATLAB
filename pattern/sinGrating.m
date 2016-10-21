function im = sinGrating(vhSize, cyclesPer100Pix, orientation, phase, mean, amplitude)
% Draw sinusoidal grating and returns imgage matrix
% im = sinGrating(vhSize, cyclesPer100Pix, orientation, phase, mean, amplitude)
% vhSize: size of pattern, [vSize hSize]
% cyclesPer100Pix: cycles per 100 pixels
% phase: phase of grating in degree
% mean: mean color value
% amplitude: amplitude of color value
% orientation: orientation of grating, 0 -> horizontal, 90 -> vertical
%
% last modified 12/17/98 (c) Yukiyasu Kamitani
% 
% eg >imshow(sinGrating([200 200], 2, 90, 0, 0.5, 0.2))
% 

orientation = -orientation + 90;
X = ones(vhSize(1),1)*[1:vhSize(2)];
Y = [1:vhSize(1)]' * ones(1,vhSize(2));	

simIm = amplitude * sin(2.*pi.*(cyclesPer100Pix/100).* (cos(deg2rad(orientation)).*X ...
										  + sin(deg2rad(orientation)).*Y)  ...
						                  - deg2rad(phase)*ones(vhSize) ); 
im = simIm + mean * ones(vhSize);
% max(max(im))
% min(min(im))
