% Definition of the Actor (ASN)
% ZE+3

% Local Variables
close all;
rng = [-21:.01:21];

% Labels

% Theta Labels
PO1 = fuzzyVar();
PO1 = set(PO1,'name','theta','type','p',...
    'parameters',[.3 .3 -1],'range',rng,'label','positive');
PO1 = calcVVector(PO1,0);
ZE1 = fuzzyVar();
ZE1 = set(ZE1,'name','theta','type','p',...
    'parameters',[0 .3 .3],'range',rng,'label','zero');
ZE1 = calcVVector(ZE1,0);
NE1 = fuzzyVar();
NE1 = set(NE1,'name','theta','type','p',...
    'parameters',[-.3 -1 .3],'range',rng,'label','negative');
NE1 = calcVVector(NE1,0);
VS1 = fuzzyVar();
VS1 = set(VS1,'name','theta','type','p',...
    'parameters',[0 .05 .05],'range',rng,'label','very small');
VS1 = calcVVector(VS1,0);

% ThetaDot Labels
PO2 = fuzzyVar();
PO2 = set(PO2,'name','thetaDot','type','p',...
    'parameters',[1 1 -1],'range',rng,'label','positive');
PO2 = calcVVector(PO2,0);
ZE2 = fuzzyVar();
ZE2 = set(ZE2,'name','thetaDot','type','p',...
    'parameters',[0 1 1],'range',rng,'label','zero');
ZE2 = calcVVector(ZE2,0);
NE2 = fuzzyVar();
NE2 = set(NE2,'name','thetaDot','type','p',...
    'parameters',[-1 -1 1],'range',rng,'label','negative');
NE2 = calcVVector(NE2,0);
VS2 = fuzzyVar();
VS2 = set(VS2,'name','thetaDot','type','p',...
    'parameters',[0 1 1],'range',rng,'label','very small');
VS2 = calcVVector(VS2,0);

% x Labels
PO3 = fuzzyVar();
PO3 = set(PO3,'name','x','type','p',...
    'parameters',[.5 .5 -1],'range',rng,'label','positive');
PO3 = calcVVector(PO3,0);
ZE3 = fuzzyVar();
ZE3 = set(ZE3,'name','x','type','p',...
    'parameters',[0 .5 .5],'range',rng,'label','zero');
ZE3 = calcVVector(ZE3,0);
NE3 = fuzzyVar();
NE3 = set(NE3,'name','x','type','p',...
    'parameters',[-.5 -1 .5],'range',rng,'label','negative');
NE3 = calcVVector(NE3,0);

% xDot Labels
PO4 = fuzzyVar();
PO4 = set(PO4,'name','xDot','type','p',...
    'parameters',[1 1 -1],'range',rng,'label','positive');
PO4 = calcVVector(PO4,0);
NE4 = fuzzyVar();
NE4 = set(NE4,'name','xDot','type','p',...
    'parameters',[-1 -1 1],'range',rng,'label','negative');
NE4 = calcVVector(NE4,0);
PS4 = fuzzyVar();
PS4 = set(PS4,'name','xDot','type','p',...
    'parameters',[0 .01 1],'range',rng,'label','positive small');
PS4 = calcVVector(PS4,0);
NS4 = fuzzyVar();
NS4 = set(NS4,'name','xDot','type','p',...
    'parameters',[0 1 .01],'range',rng,'label','negative small');
NS4 = calcVVector(NS4,0);
ZE4 = fuzzyVar();
ZE4 = set(ZE4,'name','xDot','type','p',...
    'parameters',[0 .05 .05],'range',rng,'label','zero');
ZE4 = calcVVector(ZE4,0);

% Force Labels
PL = fuzzyVar();
PL = set(PL,'name','force','type','p',...
    'parameters',[20 5 -1],'range',rng,'label','positive large');
PL = calcVVector(PL,0);
PM = fuzzyVar();
PM = set(PM,'name','force','type','p',...
    'parameters',[10 5 6],'range',rng,'label','positive medium');
PM = calcVVector(PM,0);
PS = fuzzyVar();
PS = set(PS,'name','force','type','p',...
    'parameters',[5 4 5],'range',rng,'label','positive small');
PS = calcVVector(PS,0);
PVS = fuzzyVar();
PVS = set(PVS,'name','force','type','p',...
    'parameters',[1 1 1],'range',rng,'label','positive very small');
PVS = calcVVector(PVS,0);
NL = fuzzyVar();
NL = set(NL,'name','force','type','p',...
    'parameters',[-20 -1 5],'range',rng,'label','negative large');
NL = calcVVector(NL,0);
NM = fuzzyVar();
NM = set(NM,'name','force','type','p',...
    'parameters',[-10 6 5],'range',rng,'label','negative medium');
NM = calcVVector(NM,0);
NS = fuzzyVar();
NS = set(NS,'name','force','type','p',...
    'parameters',[-5 5 4],'range',rng,'label','negative small');
NS = calcVVector(NS,0);
NVS = fuzzyVar();
NVS = set(NVS,'name','force','type','p',...
    'parameters',[-1 1 1],'range',rng,'label','negative very small');
NVS = calcVVector(NVS,0);
ZE = fuzzyVar();
ZE = set(ZE,'name','force','type','p',...
    'parameters',[3 1 1],'range',rng,'label','zero');
ZE = calcVVector(ZE,0);

% Rules
R01 = rule();
R01 = set(R01,'name','Rule 01','antecedents',[PO1 PO2],'consequents',[PL]);
R02 = rule();
R02 = set(R02,'name','Rule 02','antecedents',[PO1 ZE2],'consequents',[PM]);
R03 = rule();
R03 = set(R03,'name','Rule 03','antecedents',[PO1 NE2],'consequents',[ZE]);
R04 = rule();
R04 = set(R04,'name','Rule 04','antecedents',[ZE1 PO2],'consequents',[PS]);
R05 = rule();
R05 = set(R05,'name','Rule 05','antecedents',[ZE1 ZE2],'consequents',[ZE]);
R06 = rule();
R06 = set(R06,'name','Rule 06','antecedents',[ZE1 NE2],'consequents',[NS]);
R07 = rule();
R07 = set(R07,'name','Rule 07','antecedents',[NE1 PO2],'consequents',[ZE]);
R08 = rule();
R08 = set(R08,'name','Rule 08','antecedents',[NE1 ZE2],'consequents',[NM]);
R09 = rule();
R09 = set(R09,'name','Rule 09','antecedents',[NE1 NE2],'consequents',[NL]);
R10 = rule();
R10 = set(R10,'name','Rule 10','antecedents',[VS1 VS2 PO3 PO4],'consequents',[PS]);
R11 = rule();
R11 = set(R11,'name','Rule 11','antecedents',[VS1 VS2 PO3 PS4],'consequents',[PVS]);
R12 = rule();
R12 = set(R12,'name','Rule 12','antecedents',[VS1 VS2 NE3 NE4],'consequents',[NS]);
R13 = rule();
R13 = set(R13,'name','Rule 13','antecedents',[VS1 VS2 NE3 NS4],'consequents',[NVS]);

% RuleBase
Actor = ruleBase();
Actor = set(Actor,'name','Actor','rules',...
    [R01 R02 R03 R04 R05 R06 R07 R08 R09 R10 R11 R12 R13]);
