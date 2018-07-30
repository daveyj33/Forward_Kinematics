%hold off
clear
clc
%Theta in degrees
T1=;
T2=;
%Theta in radians
T1=(T1/180)*pi;
T2=(T2/180)*pi;
%Arm Lengths
a1=1; 
a2=4; 
a3=1;
a4=4;
%Calculate the rotation for arm1 and arm2 seperately
R0_1=[cos(T1) -sin(T1) 0;sin(T1) cos(T1) 0; 0 0 1];
R1_2=[cos(T2) -sin(T2) 0;sin(T2) cos(T2) 0; 0 0 1];
%Roational Transformation Matrix
R0_2=(R0_1*R1_2);
%Calculate the Displacement for arm1 and arm2 seperately
D0_1=[a2*cos(T1);a2*sin(T1);a1];
D1_2=[a4*cos(T2);a4*sin(T2);a3];
%Calculate Homogeneous Transformation for arm1 and arm2 
H0_1=[R0_1 D0_1;0 0 0 1]
H1_2=[R1_2 D1_2;0 0 0 1];
%Homogeneous Transformation Matrix
H0_2=(H0_1*H1_2);
%End Effector Position in X-Y-Coordinate System
x=H0_2(1,4)
y=H0_2(2,4)
x=[0 H0_1(1,4)];
y=[0 H0_1(2,4)];
x1=[H0_1(1,4) H0_2(1,4)];
y1=[H0_1(2,4) H0_2(2,4)];
hold on
plot(x,y);  
plot(x1,y1);
axis([-8.5 8.5 -8.5 8.5])