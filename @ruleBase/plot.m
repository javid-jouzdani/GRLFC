function plot(rb,inputVars,fireMethod)
%RULE/PLOT Plots a rule given a rule and the input variables
figure;
ruleBaseRules = rb.rules;
nOfRules = length(ruleBaseRules);
tmp = [];
for i = 1:nOfRules
    tmp1 = length(get(rb.rules(i),'antecedents'))+...
        length(get(rb.rules(i),'consequents'));
    tmp = [tmp tmp1];
end
maxCol = max(tmp);
if (nargin == 1)
    for i = 1:nOfRules        
        plot(rb.rules(i),[nOfRules i-1]);
    end
else
    for i = 1:nOfRules
        plot(rb.rules(i),[nOfRules i-1],inputVars,fireMethod);
    end
end