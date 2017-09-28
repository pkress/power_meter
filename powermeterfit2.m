% Power meter fit 2

% load initial data file
load('powermeterdata2.mat');
powermeter = unnamed1(1:35,1);
gizmo = unnamed1(1:35,2);
x = gizmo;
 % define the fitting function with fittype
 % notice that it is quite human readable
 % Matlab automatically treats x as independent variable
f=fittype(@(P0, slope, x) P0 + slope*x);
 
% let's see did Matlab guessed fit parameters right
coeffs = coeffnames(f);

 pin=[0,1];

% % We fit our data here
[fitobject,gof] = fit (x,powermeter, f, 'StartPoint', pin);

 %disp('confidence interval/errorbars for  Vo, and Responsivity');
ci = confint(fitobject) ;

 p = coeffvalues(fitobject);
P0 = p(1)
relationship = p(2)
fitvals = P0+relationship*powermeter;
 res=gizmo - fitvals;
%% plotting

plot(fitobject,'k-')
hold on
plot(gizmo,powermeter,'k.')
ylabel('PM Power mW')
xlabel('Gizmo Power mW')
title('Gizmo vs Powermeter ')
hold off
 

figure 
plot(res,'k*')
hold on
plot(0,'k-')
title('Residuals of the fit')
hold off
