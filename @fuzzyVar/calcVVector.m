function fv = calcVVector(fv,plotmf)
%CALCVVECTOR Calculates the values for the membership function of the
%  Fuzzy Variable.
Range = fv.range;
Params = fv.parameters;
if isempty(Range) | isempty(Params)
    error('Cannot compute the valueVector because either range or parameters feilds are empty.')
end
switch fv.type
    case {'triangular'} % Triangular MF
        fv.valueVector = evalmf(Range,Params,'trimf');
    case {'trapezoidal'} % Trapezoidal MF
        fv.valueVector = evalmf(Range,Params,'trapmf');
    case {'gaussian'} % Gaussian fv.valueVector
        fv.valueVector = evalmf(Range,Params,'gaussmf');
    case {'gaussian2'} % Two-sided Gaussian fv.valueVector
        fv.valueVector = evalmf(Range,Params,'gauss2mf');
    case {'bell'} % Bell-Shaped fv.valueVector
        fv.valueVector = evalmf(Range,Params,'gbellmf');
    case {'pi'} % Pi-Sahped fv.valueVector
        fv.valueVector = evalmf(Range,Params,'pimf');
    case {'z'} % Z-Sahped fv.valueVector
        fv.valueVector = evalmf(Range,Params,'zmf');
    case {'s'} % S-Sahped fv.valueVector
        fv.valueVector = evalmf(Range,Params,'smf');
    case {'p'}
        fv.valueVector = pmf(Range,Params);
    otherwise
        error('Unknown membership function.')
end
if nargin == 2
    if plotmf
        plot(fv.range,fv.valueVector)
    end
end