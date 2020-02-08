% Plots the stationary figure using forward kinematics, Peter Corke
% Defining range of angles
%q1 = linspace(0,2*pi,100);
%q2 = linspace(0,2*pi,100);
%q3 = linspace(0,2*pi,100);
%q4 = linspace(0,2*pi,100);
%q5 = linspace(0,2*pi,100);

% Defining physical Parameters
d1 = 300;
d5 = 150;
l3 = 200;
l2 = 200;

t = linspace(0,4,20);

qi = [0 pi/4 pi/2 -3*pi/4 0];
qf = [pi/2 3*pi/2 3*pi/4 pi/2 pi];

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
fivelink_r.base = transl([1000,200,0]);

%Plot the Robot zero configuration
fivelink_l.plot([0 0 0 -pi/2 0 ]);
hold on
fivelink_r.plot([0 -pi 0 pi/2 0 ]);
xlim([-600,1600]);

% Defining the final transformation matrix
T = fivelink_l.fkine([0 0 0 -pi/2 0]);  % zero configuration

% Plotting the trajectory
M = jtraj(qi,qf,t)
plot(M,t)
ylabel('time(s)')
xlabel('trajectory')