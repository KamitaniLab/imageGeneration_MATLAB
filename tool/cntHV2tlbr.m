function fourElementVec = cntHV2tlbr(center, hv)
% Convert [center, halfaxix] to [leftTop,, rightBottom,,]
% hv 
% rounded

fourElementVec(1) = center(1) - (hv(1)-1)/2;
fourElementVec(3) = center(1) + (hv(1)-1)/2;
fourElementVec(2) = center(2) - (hv(2)-1)/2;
fourElementVec(4) = center(2) + (hv(2)-1)/2;
fourElementVec = round(fourElementVec);
