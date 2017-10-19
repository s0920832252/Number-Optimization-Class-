%function h = hessian_f(X)
function hes = hessian_f( X )
  %  g is a function which can return gradient vector.
  %idea :  (g(x+h ; y)-g(x;y))/h -> g() for( delat_x )  
  %and     (g(x ; y+h)-g(x;y))/h -> g() for( delat_y ) 
  
  h=0.0001;
  g=gradient_f(X)';
  hes=[]; 
  for i=1:length(X)
      newX=X;
      newX(i)=X(i)+h;  
      new_g=gradient_f(newX)';
      hes=[hes (new_g-g)/h];    
  end
  
end

