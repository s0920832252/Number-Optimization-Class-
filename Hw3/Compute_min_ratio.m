
function [row, mi] = Compute_min_ratio(a, s)

 m = size(a,1);
 c = 1:m;    %�C�s��
 a = a(:);   %���\  (���b)
 s = s(:);   %���\  (���b)
 l = c(s > 0);   %�u�D s>0 �]���u��s>0  x�~���W��   eg: b>=sx
 [mi, row] = min(a(l)./s(l));   % Compute_min_ratio
 row = l(row);     %�^�ǭȳ̧C�C��  �N�Y�i��������attribute�� index  eg: x(low)=0   

end
