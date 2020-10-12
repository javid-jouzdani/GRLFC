function rb = set(rb,varargin)
% SET Set ruleBase properties and return the updated object
propertyArgIn = varargin;
while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case 'rules'
            rb.rules = val;
        case 'output'
            rb.output = val;
        case 'name'
            rb.name = val;
        otherwise
            error('RuleBase properties: rules, output, name')
    end
end