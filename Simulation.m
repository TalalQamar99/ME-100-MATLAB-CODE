syms pistHeight(L,a,theta)
pistHeight(L,a,theta) = a*cos(theta) + sqrt(L^2-a^2*sin(theta)^2);
syms pistVol(L,a,theta,B)
pistVol(L,a,theta,B) = pi*(B/2)^2*(L+a-pistHeight);
syms t0 t;
rpmConv = 2*pi/60;
angVel(t0) = piecewise(t0<=3, 30, t0>3 & t0<=7, 30 + 50/4*(t0-3), t0>7, 80)*rpmConv;
angPos(t) = int(angVel,t0,0,t);
H(t) = pistHeight(150,50,angPos);
figure;
plot([-43 -43],[50 210],'k','LineWidth',3)
hold on;
plot([43 43],[50 210],'k','LineWidth',3)
plot([-43 43],[210 210],'k','LineWidth',3)
axis equal;
fanimator(@rectangle,'Position',[-43 H(t) 86 10],'FaceColor',[0.8 0.8 0.8])
fanimator(@(t) plot([0 50*sin(angPos(t))],[H(t) 50*cos(angPos(t))],'r-','LineWidth',3))
fanimator(@(t) plot([0 50*sin(angPos(t))],[0 50*cos(angPos(t))],'g-','LineWidth',3))
fanimator(@(t) text(-25,225,'Timer: '+num2str(t,2)));
hold off;
playAnimation;
