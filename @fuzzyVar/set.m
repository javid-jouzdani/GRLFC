function fv = set(fv,varargin)
% SET Set Fuzzy Variable properties and return the updated object
propertyArgIn = varargin;
while length(propertyArgIn) >= 2,
    prop = propertyArgIn{1};
    val = propertyArgIn{2};
    propertyArgIn = propertyArgIn(3:end);
    switch prop
        case 'type'
            fv.type = val;
        case 'parameters'
            fv.parameters = val;        
        case 'range'
            fv.range = val;
        case 'valueVector'
            fv.valueVector = val;
        case 'name'
            fv.name = val;
        case 'eTraces'
            fv.eTraces = val;
        case 'label'
            fv.label = val;
        otherwise
            error('Fuzzy Variable properties: type, parameters, range, valueVector, name')
    end
end
Range = get(fv,'range');
Params = get(fv,'parameters');
if ~isempty(Range) &&  ~isempty(Params)
    fv = calcVVector(fv);
end