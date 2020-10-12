function dof = pMaxMin(a,b)
%FUZZYVAR/ Implements Max(Min(triangularMF))
a = fuzzyVar(a);
b = fuzzyVar(b);
typea = a.type;
typeb = b.type;
if (typea ~= 'p') | (typeb ~= 'p')
    error('Either first or second fuzzyVar is not of type "p".');
end

paramsa = a.parameters;
paramsb = b.parameters;
ca = paramsa(1); lsa = paramsa(2); rsa = paramsa(3);
cb = paramsb(1); lsb = paramsb(2); rsb = paramsb(3);
if cb > ca
    dof = pMaxMin(b,a);
    return;
end

if (lsa < 0) | (rsb < 0)
    dof = 1;
elseif (rsa == 0) && (rsb == 0)
    dof = 0;
else
%     x = (lsa*cb+rsb*ca)/(lsa+rsb);
    dof = (cb-ca+lsa+rsb)/(lsa+rsb);
    if dof < 0
        dof = 0;
    end
end