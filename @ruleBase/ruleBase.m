function rb = ruleBase(a)
%RULEBASE Rule Base class constructor
if nargin == 0
    rb.name = '';
    rb.rules = [];
    rb.output = [];
    rb = class(rb,'ruleBase');
elseif isa(a,'ruleBase')
    rb = a;
else
    error([a, ' is not a ruleBase'])
end