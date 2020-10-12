function rb = Tuner(rb, alpha, gTerm);
rules = get(rb, 'rules');
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
    c = params(1); ls = params(2); rs = params(3);
    dodc = sum(wj)/wSum;
    dodrs = (1/2)*sum(wj.*(1-wj))/wSum;
    dodls = -dodrs/wSum;
    c = c + alpha*dodc*gTerm;
    rs = rs + alpha*dodrs*gTerm;
    ls = ls + alpha*dodls*gTerm;
    v = set(v, 'parameters', [c ls rs]);
    for s = 1:length(indx)
        t = indx(s);
        rules(t) = set(rules(t), 'consequents', v);
        done(t) = 1;
    end
    indx =[]; wj =[];
end
rb = set(rb, 'rules', rules);