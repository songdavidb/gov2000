# working with the standard normal distribution 

# P(X<1)
pnorm(q = 1, mean = 0, sd = 1)

# P(X>1)
1 - pnorm(q = 1, mean = 0, sd = 1)

# P(1<X<2)
pnorm(q = 2, mean = 0, sd =1) - pnorm(q = 1, mean = 0, sd = 1)

# P(-1<X<1)
pnorm(q = 1, mean = 0, sd =1) - pnorm(q = -1, mean = 0, sd = 1)

# P(-2<X<2)
pnorm(q = 2, mean = 0, sd =1) - pnorm(q = -2, mean = 0, sd = 1)

# P(-3<X<3)
pnorm(q = 3, mean = 0, sd =1) - pnorm(q = -3, mean = 0, sd =1)

# P(|X|<?) = 0.95
qnorm(1 - 0.05/2)

# P(|X|<?) = 0.995
qnorm(1 - 0.005/2)
