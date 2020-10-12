function fp = Explorer(f, delta)
mu = f;
sigma = exp(-delta);
fp = mu + sqrt(sigma)*randn;