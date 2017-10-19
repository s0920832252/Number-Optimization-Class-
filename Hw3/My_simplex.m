function[A, X, Z] = My_simplex(type, A, b,c)

 if(type == 'min')  %判別是 求 min or Max
    typ1=-1;
 else
    typ1=1;
    c=-c;
 end

b=b(:);     %調整為 直擺   (防呆)
c=c(:)';    %調整為 橫擺   (防呆)
[m,n]=size(A);
A=[A eye(m)];
A=[A b];
cc=[c zeros(1,m+1)];
A=[A;cc];               %把東西都合再一起  就不用那麼多變數存來存去的.(記位置就好)
Z=[];   %紀錄經過結果Z值
X=[];   %紀錄經過路徑位址

background(A);

[mi,col]=count_P(A(m+1,1:m+n));
Bh = (n+1:m+n);               %紀錄Xb之 index

[z ,x]=get_return(typ1,m,n,A,Bh);
Z=[Z z];
X=[X x];
%if (min p)~=0 且 >0 則尚可以繼續找解  
while( (~isempty(mi)) && (mi < 0) )   
   
   B = A(1:m,n+1:end);
   s = B\A(1:m,col) ;
   if all(s <= 0)        %如果全負  則 無界限   因為限制為 (B\b)-(B\A(1:m;col)*Xi) >=0
      disp(sprintf('\n  ======== NO Boundary ==============='));
      x = zeros(n,1);
      if typ1 == -1
         z = -inf;      %求 min  所以回傳 負無限
      else
         z = inf;       %求 Max  所以回傳 正無限
      end
      return;
   end
    
   row = Compute_min_ratio(A(1:m,m+n+1),A(1:m,col)); %得到 移動direct=X(col) 會被 x(low)=0 的low
   
   % AX>=b  因選擇 direct=X(col)調整  故先消除 A(col) 
   %        且必定須限制 X(low)<=b 
   
   A(row,:)= A(row,:)/A(row,col);  
   Bh(row) = col;         %update Bh   
   for i = 1:m+1
      if i ~= row
         A(i,:)= A(i,:)-A(i,col)*A(row,:);  %在保證X(low)<=b下 update other row
      end
   end
  
   [mi, col] = count_P(A(m+1,1:m+n));
   
   [z ,x]=get_return(typ1,m,n,A,Bh);
   Z=[Z z];
   X=[X x];
end


end

function [z ,x]=get_return(typ1,m,n,A,Bh)
   
   z = typ1*A(m+1,m+n+1);
   x = zeros(1,m+n);
   x(Bh) = A(1:m,m+n+1);
   x = x(1:n)';
   
end

