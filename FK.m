clc;
clear all;
%% Forward Kinematics
% Angles are in radians
q1 = linspace(0,2*pi,100);
q2 = linspace(0,2*pi,100);
q3 = linspace(0,2*pi,100);
q4 = linspace(0,2*pi,100);
q5 = linspace(0,2*pi,100);

% Dimensions are in mm
d1 = 300;
d5 = 150;
l3 = 200;
l2 = 200;

t = linspace(0,10,100);
q = [q1 ;q2; q3; q4; q5];

C1 = cos(q1);
S1 = sin(q1);
C2 = cos(q2);
S2 = sin(q2);
S234 = sin(q2+q3+q4);
C234 = cos(q2+q3+q4);
C23 = cos(q2+q3);
S23 = sin(q2+q3);

% End effector position
X = C1.*(d5*C234 + l3*C23 + l2*C2);
Y = S1.*(d5*C234 + l3*C23 + l2*C2);
Z = d1-(l2*S2 + l3*S23 - d5*S234);

% Plot end effector position
subplot(3,1,1)
plot(X,q1)
xlabel('X coordinates of the end effector (mm)');
ylabel('Joint angle 1');
title('Variation of End Effector position with Joint Angles')

hold on
subplot(3,1,2)
plot(Y,q2)
xlabel('Y coordinates of the end effector (mm)');
ylabel('Joint angle 2');

hold on
subplot(3,1,3)
plot(Z,q3)
xlabel('Z coordinates of the end effector (mm)');
ylabel('Joint angle 3 ');

hold off
figure(2)
subplot(3,1,1)
plot(X,Y)
title('Trajectory in XY plane')
xlabel('X cordiante (mm)')
ylabel('Y cordiante (mm)')

hold on
subplot(3,1,2)
plot(X,Z)
title('Trajectory in XZ plane')
xlabel('X cordiante (mm)')
ylabel('Z cordiante (mm)')

hold on
subplot(3,1,3)
plot(Y,Z)
title('Trajectory in YZ plane')
xlabel('Y cordiante (mm)')
ylabel('Z cordiante (mm)')

figure(3)
[A,B] = meshgrid(X,Y);
surf(A,B);
title('3D visualization')
xlabel('X cordiante (mm)')
ylabel('Y cordiante (mm)')
zlabel('Z cordiante (mm)')


figure(4)
subplot(3,1,1)
plot(q,X)
title('Position in x with varying joint angles')
xlabel('Joint variables in radians')
ylabel('X cordinate of the end frame')

subplot(3,1,2)
plot(q,Y)
title('Position in Y with varying joint angles')
xlabel('Joint variables in radians')
ylabel('Y cordinate of the end frame')

subplot(3,1,3)
plot(q,Z)
title('Position in Z with varying joint angles')
xlabel('Joint variables in radians')
ylabel('Z cordinate of the end frame')


