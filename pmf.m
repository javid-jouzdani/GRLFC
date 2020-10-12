function y = pmf(x, params)
if nargin ~= 2
    error('Two arguments are required by the parametric MF.');
elseif length(params) < 3
    error('The parametric MF needs at least three parameters.');
end

c = params(1); ls = params(2); rs = params(3);

if (rs < 0) && (ls < 0)
    error('Left spread and right spread cannot be infinite simultanously.');
end

y = zeros(size(x));
a = c - ls;
b = c + rs;

if (rs >= 0) && (ls >= 0)
    y = trimf(x, [a c b]);
elseif rs < 0
    % Right shoulder (y = 1)
    index = find(c <= x);
    y(index) = ones(size(index));
    % Left shoulder (y = 0)
    index = find(x <= a);
    y(index) = zeros(size(index));
    % the slope
    if (a ~= c)
        index = find(a < x & x < c);
        y(index) = (x(index)-a)/(c-a);
    end
elseif ls < 0
    % Left shoulder (y = 1)
    index = find(c >= x);
    y(index) = ones(size(index));
    % Right shoulder (y = 0)
    index = find(x >= b);
    y(index) = zeros(size(index));
    % the slope
    if (b ~= c)
        index = find(c < x & x < b);
        y(index) = (b-x(index))/(b-c);
    end
end