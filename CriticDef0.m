% Definition of the Critic (AEN)

% Local Variables
close all;
scoreRng = [-1:.01:2];

% Labels

% State Labels are already defined for the Actor

% State Score Labels

BAD = fuzzyVar();
BAD = set(BAD,'name','Score','type','p',...
    'parameters',[0 -1 .5],'range',scoreRng,'label','bad');
BAD = calcVVector(BAD,0);
OK = fuzzyVar();
OK = set(OK,'name','Score','type','p',...
    'parameters',[.5 .3 .2],'range',scoreRng,'label','ok');
BAD = calcVVector(BAD,0);
GOOD = fuzzyVar();
GOOD = set(GOOD,'name','Score','type','p',...
    'parameters',[.8 .3 -1],'range',scoreRng,'label','good');
GOOD = calcVVector(GOOD,0);

% Rules
R01 = rule();
R01 = set(R01,'name','Rule 01','antecedents',[PO1 PO2],'consequents',[BAD]);
R02 = rule();
R02 = set(R02,'name','Rule 02','antecedents',[PO1 NE2],'consequents',[OK]);
R03 = rule();
R03 = set(R03,'name','Rule 03','antecedents',[ZE1 ZE2],'consequents',[GOOD]);
R04 = rule();
R04 = set(R04,'name','Rule 04','antecedents',[NE1 PO2],'consequents',[OK]);
R05 = rule();
R05 = set(R05,'name','Rule 05','antecedents',[NE1 NE2],'consequents',[BAD]);
R06 = rule();
R06 = set(R06,'name','Rule 06','antecedents',[PO3 PO4],'consequents',[BAD]);
R07 = rule();
R07 = set(R07,'name','Rule 07','antecedents',[PO3 NE4],'consequents',[OK]);
R08 = rule();
R08 = set(R08,'name','Rule 08','antecedents',[ZE3 ZE4],'consequents',[GOOD]);
R09 = rule();
R09 = set(R09,'name','Rule 09','antecedents',[NE3 PO4],'consequents',[OK]);
R10 = rule();
R10 = set(R10,'name','Rule 10','antecedents',[NE3 NE4],'consequents',[BAD]);

% RuleBase
Critic = ruleBase();
Critic = set(Actor,'name','Actor','rules',...
    [R01 R02 R03 R04 R05 R06 R07 R08 R09 R10]);
