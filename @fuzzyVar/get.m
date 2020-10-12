function val = get(fv, propName)
% GET Get Fuzzy Variable properties from the specified object
% and return the value
switch propName
    case 'range'
        val = fv.range;
    case 'valueVector'
        val = fv.valueVector;
    case 'parameters'
        val = fv.parameters;
    case 'type'
        val = fv.type;
    case 'name'
        val = fv.name;
    case 'eTraces'
        val = fv.eTraces;
    case 'label'
        val = fv.label;
    otherwise
        error([propName,' is not a valid Fuzzy Variable property'])
end