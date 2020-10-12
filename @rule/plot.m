function plot(r,plotParams,inputVars,fireMethod)
%RULE/PLOT Plots a rule given a rule and the input variables
ruleAnts = r.antecedents;
ruleCons = r.consequents;
nOfAnts = length(ruleAnts);
nOfCons = length(ruleCons);
if (nargin == 1)
    plotParams = [1 0];
end
nOfRules = plotParams(1);
rNum = plotParams(2);
rs = nOfRules;
cs = nOfAnts+nOfCons;
cr = rNum*cs;
if (nargin == 1) | (nargin == 2)
    for i = 1:nOfAnts
        subplot(rs,cs,cr+i);
        plot(ruleAnts(i),'r');
        Range = get(ruleAnts(i),'range');
        vv = get(ruleAnts(i),'valueVector');
        lb = min(Range);
        ub = max(Range);
        axis([lb-.1 ub+.1 0 1]);
    end
    for i = 1:nOfCons
        subplot(rs,cs,cr+nOfAnts+i);
        plot(ruleCons(i),'b');
        Range = get(ruleCons(i),'range');
        vv = get(ruleCons(i),'valueVector');
        lb = min(Range);
        ub = max(Range);
        axis([lb-.1 ub+.1 0 1]);
    end
elseif fireMethod=='Mamdani'
    r = MamFire(r,inputVars);
    for i = 1:nOfAnts
        subplot(rs,cs,cr+i);
        hold on;
        plot(ruleAnts(i),'r');
        plot(inputVars(i),'b');
        area(ruleAnts(i) & inputVars(i),'y');
        Range = get(ruleAnts(i),'range');
        vv1 = get(ruleAnts(i),'valueVector');
        vv2 = get(inputVars(i),'valueVector');
        lb = min(Range(find(vv1>0|vv2>0)));
        if isempty(lb)
            lb = min(Range);
        end
        ub = max(Range(find(vv1>0|vv2>0)));
        if isempty(ub)
            ub = max(Range);
        end
        axis([lb-.1 ub+.1 0 1]);
    %     title('l method Output');
    end
    for i = 1:nOfCons
        subplot(rs,cs,cr+nOfAnts+i);
        hold on;
        plot(ruleCons(i),'b');
        tempOut = get(r,'outputs');
        Range = get(tempOut(i),'range');
        vv = get(tempOut(i),'valueVector');
        area(tempOut(i),'g');
        lb = min(Range(find(vv>0)));
        if isempty(lb)
            lb = min(Range);
        end
        ub = max(Range(find(vv>0)));
        if isempty(ub)
            ub = max(Range);
        end
        axis([lb-.1 ub+.1 0 1]);
    end
elseif fireMethod=='logical'
    r = logFire(r,inputVars);
    for i = 1:nOfAnts
        subplot(rs,cs,cr+i);
        hold on;
        plot(ruleAnts(i),'r');
        plot(~inputVars(i),'b');
        area(ruleAnts(i) & ~inputVars(i),'y');
        Range = get(ruleAnts(i),'range');
        vv1 = get(ruleAnts(i),'valueVector');
        vv2 = get(~inputVars(i),'valueVector');
        lb = min(Range(find(vv1>0|vv2>0)));
        if isempty(lb)
            lb = min(Range);
        end
        ub = max(Range(find(vv1>0|vv2>0)));
        if isempty(ub)
            ub = max(Range);
        end
        axis([lb-.1 ub+.1 0 1]);
    %     title('l method Output');
    end
    for i = 1:nOfCons
        subplot(rs,cs,cr+nOfAnts+i);
        hold on;
        plot(ruleCons(i),'b');
        tempOut = get(r,'outputs');
        Range = get(tempOut(i),'range');
        vv = get(tempOut(i),'valueVector');
        area(tempOut(i),'g');
        lb = min(Range(find(vv>0)));
        if isempty(lb)
            lb = min(Range);
        end
        ub = max(Range(find(vv>0)));
        if isempty(ub)
            ub = max(Range);
        end
        axis([lb-.1 ub+.1 0 1]);
    end
else
    error('Unknown rule firing method')
end
end