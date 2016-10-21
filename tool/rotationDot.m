function rdot = rotationDot(dot, center, angle)
% ratoation dot by angle around center
% counter-clockwise in matrix
angle = deg2rad(angle);
rdot = [cos(angle) -sin(angle); sin(angle) cos(angle)] * (dot - center)' + center'; 
rdot = rdot';


