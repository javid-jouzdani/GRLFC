function rb = TunerLambda(rb, alpha, lambda, gamma, gTerm);
rules = get(rb, 'rules');
rbName = get(rb, 'name');
if size(rbName) == size('Actor')
    if rbName == 'Actor'
        tmpMult = -1;
    end
else
    tmpMult = 1;
end
nOfRules = length(rules);
for i = 1:nOfRules
    w(i) = get(rules(i), 'dof');
    cons(i) = get(rules(i), 'consequents');
end
wSum = sum(w);
if wSum == 0
    return;
end
indx = [];
wj = [];
done = zeros(1,nOfRules);
while length(find(done == ones(1,nOfRules))) ~= nOfRules
    r = min(find(done == 0));
    indx = [indx r];
    label = get(cons(r), 'label');
    wj = get(rules(r), 'dof');
    for i = r+1:nOfRules
        r = min(find(done == 0));
        if size(label) == size(get(cons(i),'label'))
            if label == get(cons(i),'label')
                indx = [indx i];
                wj = [wj get(rules(i), 'dof')];
            end
        end
    end
    v = cons(r);
    params = get(v, 'parameters');
    eTraces = get(v, 'eTraces');
    c = params(1); ls = params(2); rs = params(3);
    dodc = sum(wj)/wSum;
    dodrs = (1/2)*sum(wj.*(1-wj))/wSum;
    dodls = -dodrs/wSum;
    grd = [dodc dodrs dodls]*gTerm;
    c = c + alpha*grd(1)*eTraces(1);
    rs = rs + alpha*grd(2)*eTraces(2);
    ls = ls + alpha*grd(3)*eTraces(3);
    eTraces = lambda*gamma*eTraces + grd;
%     eTraces = get(rules(r), 'dof')*[1 1 1];
    v = set(v, 'parameters', [c ls rs], 'eTraces', eTraces);
    for s = 1:length(indx)
        t = indx(s);
        rules(t) = set(rules(t), 'consequents', v);
        done(t) = 1;
    end
    indx =[]; wj =[];
end
rb = set(rb, 'rules', rules);