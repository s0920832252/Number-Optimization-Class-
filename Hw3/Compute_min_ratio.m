
function [row, mi] = Compute_min_ratio(a, s)

 m = size(a,1);
 c = 1:m;    %列編號
 a = a(:);   %直擺  (防呆)
 s = s(:);   %直擺  (防呆)
 l = c(s > 0);   %只挑 s>0 因為只有s>0  x才有上限   eg: b>=sx
 [mi, row] = min(a(l)./s(l));   % Compute_min_ratio
 row = l(row);     %回傳值最低列號  意即可全替換調attribute之 index  eg: x(low)=0   

end
