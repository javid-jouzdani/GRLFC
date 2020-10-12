function rb = TSK(rb,inputVars)
nOfRules = length(rb.rules);
num = 0;
denum = 0;
for i = 1:nOfRules
    rb.rules(i) = TSKFire(rb.rules(i),inputVars);
    w = get(rb.rules(i),'dof');
    z = get(rb.rules(i),'defOuts');
    num = num + w*z;
    denum = denum + w;
end
rb.output = num/denum;