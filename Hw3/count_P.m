function [mi,col]=count_P(d)

[mii, coll]=min(d);

 if ~isempty(mii)
    col=coll;
    mi=mii;
 else   %���b  A=NULL
    mi = [];
    col = [];
 end

end

