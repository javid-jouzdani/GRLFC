function r = TSKFire(r,inputVars)

% Varable definition
ruleAnts = r.antecedents;
ruleCons = r.consequents;
nOfAnts = length(ruleAnts);
nOfCons = length(ruleCons);

% Check for error
if isempty(ruleAnts) | isempty(ruleCons)
    error('Cannot fire rule because either consequents or antecedents are empty.')
end

% Fire the rule and determine the degree of firing
tau = 1;
for i = 1:nOfAnts
    tempTau = pMaxMin(ruleAnts(i), inputVars(i));
    tau = softmin(tau, tempTau, 10);
%     tau = min(tau, tempTau);
end
r.dof = tau;

% Calculate the defuzzified output
for i = 1:nOfCons
    mfType = get(r.consequents(i),'type');
    if mfType ~= 'p'
        error('Only "p" type membership function is acceptable for LMOM defuzzification.');
    end
    params = get(r.consequents(i),'parameters');
    c = params(1);
    ls = params(2);
    rs = params(3);
    out(i) = c + .5*(rs - ls)*(1 - tau);
end
r.defOuts = out;