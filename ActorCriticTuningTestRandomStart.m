% Actor-Critic Tuning Test

% Constant definition
clear all;
rsprd = .001;
lsprd = .001;
% rsprd = .01;
% lsprd = .01;
labels = ['theta thetaDot x xDot'];
% timeStep = .02;
timeStep = .1;
% initState = [0 0 0 0]';
initState = [-.1+.2*rand -.05+.1*rand -2+4*rand -.5+rand]';
ActorDef0;
% ActorDef1;     %ZE+3
% ActorDef2;      %ZE-2,PL+5,PM+3,PS+2,NM+1
CriticDef0;
% CriticDef1;
oldActor = Actor;
oldCritic = Critic;
ActorAlpha = .5;
CriticAlpha = .3;
gamma = .95;

% Variable initialization
cartPosition = [];
poleAngel = [];
scores = [];
forces = [];
i = 1;
currentCrispState = initState;
failures = 0;
maxi = 0;

% ALGORITHM INITIALIZATION
% Fuzzify the current crisp state
currentFuzzyState = fuzzify(currentCrispState, labels, lsprd, rsprd);
% Determine the value of the current fuzzy state
Critic = TSK(Critic, currentFuzzyState);
currentStateValue = get(Critic, 'output');
% Set the TD error to zero for the initial state
delta = 0;
% Determine the action at the current fuzzy state
Actor = TSK(Actor, currentFuzzyState);
currentForce = get(Actor, 'output');

% THE MAIN ALGORITHM
while i < 5000
    % Determine the new crisp state
    [newCrispState r] = invPend0(currentCrispState, currentForce, timeStep);
%     [newCrispState r] = invPend1(currentCrispState, currentForce, timeStep);
    % Fuzzify the new crisp state
    newFuzzyState = fuzzify(newCrispState, labels, lsprd, rsprd);
    % Determine the value of the new fuzzy state
    Critic = TSK(Critic, newFuzzyState);
    newStateValue = get(Critic, 'output');
    % Determine the new TD error
    if (r < 0)
        newStateValue = 0;
%         newCrispState = [0 0 0 0]';
        newCrispState = [-.1+.2*rand -.05+.1*rand -2+4*rand -.5+rand]';
        ActorAlpha = .5;
        CriticAlpha = .3;
        failures = failures + 1;
        display([num2str(failures) 'th failure occured after ' num2str(i) ' time steps.']);
        maxi = i;
        i = 1;
    end
    ActorAlpha = .95*ActorAlpha;
    CriticAlpha = .95*CriticAlpha;
    delta = r + gamma*newStateValue - currentStateValue;
    % Determine the action at the new fuzzy state
    Actor = TSK(Actor, newFuzzyState);
    newForce = get(Actor, 'output');
    % Use the explorer to determine the force' and the stochastic term
    newForcePrime = Explorer(newForce, delta/(floor(failures*maxi/100)+1));
    % Calculate the gradient term for the Critic and the Actor
    if i > 2
        d2v = newStateValue-2*currentStateValue+scores(i-2);
    else
        d2v = 0;
    end
    CriticGTerm = (delta*(1-gamma)+sign(d2v));
    ActorGTerm = -sign((newStateValue-currentStateValue)/(newForce-currentForce));
    % Tune the Critic and the Actor
    Critic = Tuner(Critic, CriticAlpha, CriticGTerm);
    Actor = Tuner(Actor, ActorAlpha, ActorGTerm);
    % Save the position of the cart, the angel of the pole and the scores to be plotted
    poleAngel = [poleAngel currentCrispState(1)];
    cartPosition = [cartPosition currentCrispState(3)];
    scores = [scores currentStateValue];
    forces = [forces newForcePrime];
    % Set the current variables to new ones
    currentCrispState = newCrispState;
    currentStateValue = newStateValue;
    currentForce = newForcePrime;
    % Disply the counter
    i = i + 1;
end

% Plot the results
close all;
figure;
plot(1:length(cartPosition), cartPosition);
title('Cart Position');
figure;
plot(1:length(poleAngel), poleAngel);
title('Pole Position');
figure;
plot(1:length(scores), scores);
title('Scores');
figure;
plot(1:length(forces), forces);
title('force');
plot(oldActor);
plot(Actor);
plot(oldCritic);
plot(Critic);