function fv = fuzzyVar(a)
%FUZZYVAR Fuzzy variable class constructor
if nargin == 0
    fv.type = '';
    fv.parameters = [];
    fv.range = [];
    fv.valueVector = [];
    fv.name = '';
    fv.eTraces = [0 0 0];
    fv.label = '';
    fv = class(fv,'fuzzyVar');
elseif isa(a,'fuzzyVar')
    fv = a;
else
    error([a, 'is not a fuzzyVar'])
end