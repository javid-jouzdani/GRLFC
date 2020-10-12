function plot(fv,prop)
range = get(fv,'range');
vv = get(fv,'valueVector');
if nargin == 1
    plot(range,vv);
elseif nargin == 2
    plot(range,vv,prop);
end