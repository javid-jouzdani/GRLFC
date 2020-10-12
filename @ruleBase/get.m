function val = get(rb, propName)
% GET Get ruleBase properties from the specified object
% and return the value
switch propName
    case 'rules'
        val = rb.rules;
    case 'output'
        val = rb.output;    
    case 'name'
        val = rb.name;
    otherwise
        error([propName,' is not a valid ruleBase property'])
end