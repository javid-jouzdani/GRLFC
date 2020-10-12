function r = set(r,varargin)
% SET Set Rule properties and return the updated object
propertyArgIn = varargin;
while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case 'antecedents'
            r.antecedents = val;
        case 'consequents'
            r.consequents = val;
        case 'outputs'
            r.output = val;
        case 'dof'
            r.dof = val;
        case 'defOuts'
            r.defOuts = val;
        case 'eTrace'
            r.et = val;
        case 'name'
            r.name = val;
        otherwise
            error('Rule properties: antecedents, consequents, outputs, dof, defOuts')
    end
end