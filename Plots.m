r = 155; %rod lenght
a = 44; %crank radius
t = 0:0.01:4*pi; %Theta

x_max = r + a; %maximum positon
x_min = r - a; %minimum positon
S = 2*a; %stroke
x = a*cos(t) + sqrt(r^2-a^2*sin(t).^2); %Expression for Instantaneous Position

%plotting position
subplot(3,1,3);
plot(t,x);
xlabel('\theta');
ylabel('x [mm]');

dx = -a*sin(t)+ (-a^2*sin(t).*cos(t))./(sqrt(r^2-a^2*sin(t).^2));  %Expression for Instantaneous Speed

%plotting speed
subplot(3,1,2);
plot(t,dx);
ylabel('Velocity [mm/rad]');

%since expression of Acceleration d2x is large and cumbersome
%it is simplified using variable l,m,n,o,p
l = -a*cos(t);
m = a^2 * (cos(t).^2 - sin(t).^2);
n = r^2 - a^2*(sin(t).^2);
o = a^4*sin(t).^2.*cos(t).^2;
p = (r^2 - a^2*sin(t).^2).^1.5;
d2x = l - (m.*n + o)./p; %Expression for Instantaneous Acceleration

%plotting acceleration
subplot(3,1,1);
plot(t,d2x);
ylabel('Acceleration [mm/rad^2]');
