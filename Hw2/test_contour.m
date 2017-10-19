function test_contour(ymin,ymax)
step = 0.1;
X = -1.5:step:1.5;
Y = ymin:step:ymax;
n = size(X,2);
m = size(Y,2);
Z = zeros(m,n);
for j = 1:m
for i = 1:n
 Z(j,i) = ft(X(i),Y(j));
end
end
%contourf(X,Y,Z,100);
contour(X,Y,Z,100);
%plot(X,Y,'-','LineWidth',3);
%surf(X,Y,Z,gradient(Z));
% surfc(X,Y,Z);
% meshz(X,Y,Z);
% meshc(X,Y,Z);
% contour3(X,Y,Z);
% pcolor(X,Y,Z);
 %mesh(X,Y,Z);


%hidden off
%axis tight
%waterfall(X,Y,Z);
%ezsurf('(1-x)^2+100*(y-x)^2');
%ezmesh('(1-x)^2+100*(y-x)^2')
%ezmeshc('(1-x)^2+100*(y-x)^2'); 
  
     





    function z=ft(x,y)
        z= (1-x)^2+100*(y-x^2)^2;
        %z= (x^2+y^2)/2;
    end
end