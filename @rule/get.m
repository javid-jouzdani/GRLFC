function val = get(r, propName)
% GET Get Rule properties from the specified object
% and return the value
switch propName
    case 'antecedents'
        val = r.antecedents;
    case 'consequents'
        val = r.consequents;
    case 'outputs'
        val = r.outputs;
    case 'dof'
        val = r.dof;
    case 'defOuts'
        val = r.defOuts;
    case 'eTrace'
        val = r.et;
    case 'name'
        val = r.name;
    otherwise
        error([propName,' is not a valid rule property'])
end