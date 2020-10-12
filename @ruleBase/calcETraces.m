function rb = calcETraces(rb, lambda)
rules = rb.rules;
nOfRules = length(rules);
for i = 1:nOfRules
    et = get(rules(i), 'eTrace');
    dof = get(rules(i), 'dof');
    if dof > 0
        et = dof;
    else
        et = et*lambda;
    end
    rules(i) = set(rules(i), 'eTrace', et);
end
rb = set(rb, 'rules', rules);