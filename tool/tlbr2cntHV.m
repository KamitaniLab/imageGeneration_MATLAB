function [center, Axis] = tlbr2cntHV(fourElementVec)
% Convert [leftTop,, rightBottom,,] to [center, half axix]

center(1) = (fourElementVec(3) + fourElementVec(1))/2;
center(2) = (fourElementVec(4) + fourElementVec(2))/2;
Axis(1) = fourElementVec(3) - fourElementVec(1) + 1 ;
Axis(2) = fourElementVec(4) - fourElementVec(2) + 1 ;
