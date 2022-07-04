clear all,close all,clc;
%%
syms t real
syms x1(t) x2(t) x3(t) u(t)
syms  r(t) r_dot(t) r_dotdot(t) r_dotdotdot(t) real
%%

syms phi1 phi2 real
syms z2(t) z3(t) real
x1dot=(x1)^2+x2
x2dot=x3
x3dot=u

phi1=[r_dot-(x1^2)]+[r-x1]
phi1_dot=diff(phi1,t)
phi1_dot=subs(phi1_dot,diff(r(t), t),r_dot)
phi1_dot=subs(phi1_dot,diff(r_dot(t), t),r_dotdot)
phi1_dot=subs(phi1_dot,diff(x1(t), t),(x1)^2+x2)
phi1_dot=expand(phi1_dot)
%
phi2=phi1_dot+[r-x1]-z2
phi2=subs(phi2,z2,x2-phi1)
phi2_dot=diff(phi2,t)

phi2_dot=subs(phi2_dot,diff(r(t), t),r_dot)
phi2_dot=subs(phi2_dot,diff(r_dot(t), t),r_dotdot)
phi2_dot=subs(phi2_dot,diff(r_dotdot(t), t),r_dotdotdot)
phi2_dot=subs(phi2_dot,diff(x1(t), t),(x1)^2+x2)
phi2_dot=subs(phi2_dot,diff(x2(t), t),x3)
phi2_dot=expand(phi2_dot)

u=-z2-z3+phi2_dot
u=subs(u,z2,x2-phi1);
u=subs(u,z3,x3-phi2);

% u = 3*r + 5*r_dot + 3*r_dotdot + r_dotdotdot ...
% - 3*x1 - 5*x2 - 3*x3 - 6*x1*x2 - 2*x1*x3- 5*x1^2 ...
% - 6*x1^3 - 2*x2^2 - 6*x1^4 - 8*x1^2*x2



