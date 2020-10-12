function sm = softmin(a,b,k)
num = a*exp(-k*a) + b*exp(-k*b);
denum = exp(-k*a) + exp(-k*b);
sm = num/denum;