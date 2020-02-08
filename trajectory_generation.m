clc;
clear all;
  %% left manipulator
d1 = 20;  % length of first link
l2 = 100; % length of second link
l3 = 180; % length of third link
d5 = 140; % length of the fourth & fifth link

% define the theta range
theta1 = -180:0.1:180;
theta2 = -180:0.1:180; 
theta3 = -180:0.1:180;   
theta4 = -180:0.1:180;  
theta5 = -180:0.1:180; 

% Calculate the joint angles
c1 = cosd(theta1);
c2 = cosd(theta2);
c234 = cosd(theta2+theta3+theta4);
c23 = cosd(theta2+theta3);
s1 = sind(theta1);
s2 = sind(theta2);
s234 = sind(theta2+theta3+theta4);
s23 = sind(theta2+theta3);

% Compute the end-effector coordinates
x = c1.*(d5*c234+l3*c23+l2*c2); 
y = s1.*(d5*c234+l3*c23+l2*c2); 
z = d1-l2*s2-l3*s23-d5*s234;

%% right manipulator
D1 = 20;  % length of first link
L2 = 100; % length of Second link
L3 = 180; % length of third link
D5 = 140; % length of the fourth & fifth link

% define the THETA range
THETA1 = -180:0.1:180; 
THETA2 = -180:0.1:180;   
THETA3 = -180:0.1:180;   
THETA4 = -180:0.1:180;   
THETA5 = -180:0.1:180; 

% Calculate the joint angles for right manipulator
C1 = cosd(THETA1);
C2 = cosd(THETA2);
C234 = cosd(THETA2+THETA3+THETA4);
C23 = cosd(THETA2+THETA3);
S1 = sind(THETA1);
S2 = sind(THETA2);
S234 = sind(THETA2+THETA3+THETA4);
S23 = sind(THETA2+THETA3);

% Compute the end effector coordinates with offset
X = 900 + C1.*(D5*C234+L3*C23+L2*C2); % compute X coordinateS
Y = S1.*(D5*C234+L3*C23+L2*C2); % compute Y coordinateS
Z = D1-L2*S2-L3*S23-D5*S234;

%% Plot
figure
scatter3(x,y,z)
hold on
scatter3(X,Y,Z)

axis equal;
xlabel('X axis','fontsize',10);
ylabel('Y axis','fontsize',10);
zlabel('Z axis','fontsize',10);
title('trajectory generation using forward kinematics','fontsize',10);

