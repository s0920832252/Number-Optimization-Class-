function Mycontour()
step = 1;
X = -50:step:500;
Y = -50:step:1100;
Y1= (-2*X+1000);
Y2= (-3*X+2400)/4;
Y3= -X+700;
Y4= X+350;
n = size(X,2);
m = size(Y,2);
Z = zeros(m,n);


for j = 1:m
for i = 1:n
 Z(j,i) = ft(X(i),Y(j));
 
end
end
hold on;
%contourf(X,Y,Z,100);
contour(X,Y,Z,50);
 plot(X,Y1,'*');
 plot(X,Y2,'*');
 plot(X,Y3,'*');
 plot(X,Y4,'*');

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
        z= 8*x+5*y;
        %z= (x^2+y^2)/2;
    end


end

