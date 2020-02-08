% This file plots the Trajectory of the Robots using Inverse Kinematics in
% Peter Corke
clc;
clear all;
% Angles are in radians
% Defining the range of joint variables
q1 = linspace(0,2*pi,100);
q2 = linspace(0,2*pi,100);
q3 = linspace(0,2*pi,100);
q4 = linspace(0,2*pi,100);
q5 = linspace(0,2*pi,100);

% Defining the Link lengths
d1 = 300;
d5 = 150;
l3 = 200;
l2 = 200;

% Create Link
%L(i) = Link([theta d a alpha]);
%Defining the left manipulator
L_f(1) = Link([0 d1 0 -pi/2],'standard');
L_f(2) = Link([0 0 l2 0],'standard');
L_f(3) = Link([0 0 l3 0],'standard');
L_f(4) = Link([0 0 0 -pi/2],'standard');
L_f(5) = Link([0 d5 0 0],'standard');

fivelink_l = SerialLink(L_f,'name', 'five link left');

%Defining the Right manipulator
L_r(1) = Link([0 d1 0 pi/2],'standard');
L_r(2) = Link([0 0 l2 0],'standard');
L_r(3) = Link([0 0 l3 0],'standard');
L_r(4) = Link([0 0 0 pi/2],'standard');
L_r(5) = Link([0 d5 0 0],'standard');

fivelink_r = SerialLink(L_r,'name', 'five link right');
fivelink_r.base = transl([800,200,0]);

% Change the configuration for different results
% Defining the initial and final configuration of Left arm
TI_l = [1 0 0 550 ; 0 1 0 0 ; 0 0 1 300 ; 0 0 0 1];
TF_l = [1 0 0 150 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];

% Defining the initial and final configuration of Right arm
TI_r = [1 0 0 250 ; 0 1 0 200 ; 0 0 1 300 ; 0 0 0 1];
TF_r = [1 0 0 350 ; 0 1 0 200 ; 0 0 1 0 ; 0 0 0 1];

QI_l = fivelink_l.ikine(TI_l,'Q0',[0 0 0 -pi/2 0],'mask', [1 1 1 1 0 1]);
QF_l = fivelink_l.ikine(TF_l,'Q0',[0 0 0 -pi/2 0],'mask', [1 1 1 1 0 1]);

QI_r = fivelink_r.ikine(TI_r,'Q0',[0 -pi 0 pi/2 0],'mask', [1 1 1 1 0 1]);
QF_r = fivelink_r.ikine(TF_r,'Q0',[0 -pi 0 pi/2 0],'mask', [1 1 1 1 0 1]);

%Plotting stationary arms
fivelink_l.plot([0 0 0 -pi/2 0 ]);
hold on
fivelink_r.plot([0 -pi 0 pi/2 0 ]);
xlim([-600,1600]);
     
fivelink_l.plot(QF_l);
fivelink_r.plot(QF_r);

%Plotting Trajectory
t=0:0.1:4;               %Time vector & steps
traj1=jtraj(QI_l, QF_l, t);
traj2=jtraj(QI_r, QF_r, t);
fivelink_l.plot(traj1);
fivelink_r.plot(traj2);


