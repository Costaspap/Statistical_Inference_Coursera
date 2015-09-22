# Illustrate via simulation and associated explanatory 
# text the properties of the distribution of the mean of 40 exponentials.  
# You should:

# 1. Show the sample mean and compare it
# to the theoretical mean of the distribution.

# The theoretical mean of the exponential distribution
# with lambda = 0.2 (as requested) is equal to 1/lambda so 1/0.2 = 5

# In the following code i will do three thousand simulations of 40 exponentials
# and compare the sampling mean to the theoretical mean of the ditribution

set.seed(15)

simulation = replicate(3000,mean(rexp(40,1/5)))

means = mean(simulation)

means

#The sampling mean is approximately 5 (4.983771 in my case)

#===========================================================================

# 2. Show how variable the sample is (via variance)
# and compare it to the theoretical variance of the distribution.

# The theoretical variance of the exponential distribution with lambda = 0.2
# is equal to ((1/lambda)^2)/n = 0.625 and the theoretical standard deviation
# is equal to sqrt(theoretical variance) = sqrt(0.625) = 0.7905694

# In the following code i will compare the sample variance and standard deviation
# of three thousand simulations of 40 exponentials to the theoratical variance
# and standard deviation of the exponential distribution

variance = var(simulation)
stdev = sd(simulation)

variance
stdev

# The sampling variance and standard deviation
# are approximately equal to the theoretical variance and standard deviation
# (0.6149436 and 0.7841834 respectively in my case)


#===========================================================================

# 3. Show that the distribution is approximately normal.

# Here we are going to compare the distribution of 4000 random exponentials
# with the distribution of 4000 averages of 40 random exponentials

require(ggplot2)
require(gridExtra)

sim1 = rexp(4000,1/5)
sim2 = replicate(4000,mean(rexp(40,1/5)))

df1 = data.frame(X = sim1)
df2 = data.frame(X = sim2)

p1 = ggplot(df1, aes(x = X)) + geom_histogram(aes(y = ..density..), fill = "red") + geom_density(size = 1)
p2 = ggplot(df2, aes(x = X)) + geom_histogram(aes(y = ..density..), fill = "red") + geom_vline(xintercept = 5, size = 2) + geom_density(size=1)

grid.arrange(p1, p2, ncol = 2)












