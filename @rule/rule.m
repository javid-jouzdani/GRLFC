function r = rule(a)
%RULE Rule class constructor
if nargin == 0
    r.antecedents = [];
    r.consequents = [];
    r.outputs = [];
    r.dof = 0;
    r.defOuts = 0;
    r.et = 0;
    r.name = '';
    r = class(r,'rule');
elseif isa(a,'rule')
    r = a;
else
    error([a, 'is not a rule'])
end