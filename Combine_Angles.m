clc;
clear all;

  %% left manipulator
d1 = 20;  % length of first link
l2 = 100; % length of second link
l3 = 180; % length of third link
d5 = 140; % length of the fourth & fifth link

theta1 = -180:0.1:180; % all possible theta1 values
theta2 = -180:0.1:180;   % all possible theta2 values
theta3 = -180:0.1:180;   % all possible theta3 values
theta4 = -180:0.1:180;   % all possible theta4 values
theta5 = -180:0.1:180; % all possible theta5 values


[THETA1] = meshgrid(theta1);
[THETA2] = meshgrid(theta2);
[THETA3] = meshgrid(theta3);
[THETA4] = meshgrid(theta4);

c1 = cosd(THETA1);
c2 = cosd(THETA2);
c234 = cosd(THETA2+THETA3+THETA4);
c23 = cosd(THETA2+THETA3);
s1 = sind(THETA1);
s2 = sind(THETA2);
s234 = sind(THETA2+THETA3+THETA4);
s23 = sind(THETA2+THETA3);

x = c1.*(d5*c234+l3*c23+l2*c2); % compute x coordinates
y = s1.*(d5*c234+l3*c23+l2*c2); % compute y coordinates
z = d1-l2*s2-l3*s23-d5*s234;

mesh(theta1,theta2,theta3)
