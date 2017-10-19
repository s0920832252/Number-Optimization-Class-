function[A, X, Z] = My_simplex(type, A, b,c)

 if(type == 'min')  %�P�O�O �D min or Max
    typ1=-1;
 else
    typ1=1;
    c=-c;
 end

b=b(:);     %�վ㬰 ���\   (���b)
c=c(:)';    %�վ㬰 ���\   (���b)
[m,n]=size(A);
A=[A eye(m)];
A=[A b];
cc=[c zeros(1,m+1)];
A=[A;cc];               %��F�賣�X�A�@�_  �N���Ψ���h�ܼƦs�Ӧs�h��.(�O��m�N�n)
Z=[];   %�����g�L���GZ��
X=[];   %�����g�L���|��}

background(A);

[mi,col]=count_P(A(m+1,1:m+n));
Bh = (n+1:m+n);               %����Xb�� index

[z ,x]=get_return(typ1,m,n,A,Bh);
Z=[Z z];
X=[X x];
%if (min p)~=0 �B >0 �h�|�i�H�~����  
while( (~isempty(mi)) && (mi < 0) )   
   
   B = A(1:m,n+1:end);
   s = B\A(1:m,col) ;
   if all(s <= 0)        %�p�G���t  �h �L�ɭ�   �]����� (B\b)-(B\A(1:m;col)*Xi) >=0
      disp(sprintf('\n  ======== NO Boundary ==============='));
      x = zeros(n,1);
      if typ1 == -1
         z = -inf;      %�D min  �ҥH�^�� �t�L��
      else
         z = inf;       %�D Max  �ҥH�^�� ���L��
      end
      return;
   end
    
   row = Compute_min_ratio(A(1:m,m+n+1),A(1:m,col)); %�o�� ����direct=X(col) �|�Q x(low)=0 ��low
   
   % AX>=b  �]��� direct=X(col)�վ�  �G������ A(col) 
   %        �B���w������ X(low)<=b 
   
   A(row,:)= A(row,:)/A(row,col);  
   Bh(row) = col;         %update Bh   
   for i = 1:m+1
      if i ~= row
         A(i,:)= A(i,:)-A(i,col)*A(row,:);  %�b�O��X(low)<=b�U update other row
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

