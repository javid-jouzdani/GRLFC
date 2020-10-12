function [newState failureSignal] = invPend0(state, force, timeStep)

% Constants definition
g = 9.81;
mp = .1;
mc = 1;
lp = .5;
muc = .0005;
mup = .000002;

% Variable defintion
f = force;
theta = state(1);
thetaDot = state(2);
x = state(3);
xDot = state(4);
sinTheta = sin(theta);
cosTheta = cos(theta);
theta = state(1)*pi/180;
thetaDot = state(2)*pi/180;

% Dynamics equations
stateDot(1) = state(2);
stateDot(3) = state(4);
stateDot(2) = (g*sinTheta + cosTheta*...
    ((-f - mp*lp*thetaDot^2*sinTheta + muc*sign(xDot))/(mc + mp)) -...
    (mup*thetaDot)/(mp*lp)) / (lp*((4/3) - ((mp*cosTheta^2)/(mc + mp))));
stateDot(4) = (f + mp*lp*(thetaDot^2*sinTheta - stateDot(2)*cosTheta) -...
    muc*sign(xDot)) / (mc + mp);

% Finalization
theta = state(1)*180/pi;
thetaDot = state(2)*180/pi;
stateDot = stateDot';
newState = state + timeStep*stateDot;
if (abs(newState(3)) > 2.4) | (abs(newState(1)) > .3) | (abs(force) > 10)
    failureSignal = -1;
else
    failureSignal = 0;
end