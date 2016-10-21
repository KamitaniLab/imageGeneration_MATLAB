function im = sinConcentric(vhSize, cyclePer100pix, phase, mean, amplitude)
% Draw sinusoidal concentric stripes and returns the imgage in matrix
% im = sinConcentric(vhSize, cyclePerRot, phase, mean, amplitude)
% vhSize: size of pattern, [vSize hSize]
% cyclesPerRot: sets s.f. equivalent to the wind mill
% phase: phase of grating in degree
% mean: mean color value
% amplitude: amplitude of color value
%
% last modified 12/17/98
% (c) Yukiyasu Kamitani  
% 
% eg > imshow(sinConcentric([100 100], 10, 0, 0.5, 0.5))
%

center = vhSize/2;
Y = [-(vhSize(1)-1)/2:1:(vhSize(1)-1)/2];  % size(V,1) = Axis(1)
X = [-(vhSize(2)-1)/2:1:(vhSize(2)-1)/2]; 
distanceMap = sqrt( ones(vhSize(1),1)*(X.^2) + (Y'.^2)*ones(1,vhSize(2)) );

im =  mean * ones(vhSize)  + amplitude*sin(2*pi* cyclePer100pix/100 * distanceMap ...
		- deg2rad(phase)*ones(vhSize) );


% frequency modulation with radius
%
% im = mean + amplitude ... 
% 	* sin(2 * pi * (cyclePerRot * ones(vhSize) ...
% 					./(2 * (distanceMap + 20 * ones(vhSize)))...
% 	                    .* (distanceMap - 20 * ones(vhSize))...
% 					)...
% 		  - deg2rad(phase)*ones(vhSize) ...
% 		  );
% % frequency function is shifted to left and above by nPixels/10

