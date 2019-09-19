#Pset1
library(ggplot2)

#Question 2.1
w = 0.21
s = 0.14
y = 0.03

pmf = (w^3. + s^3. + y^3. + 3.*s*w^2. + 3.*y * w^2.+ 3.*w*s^2.+ 
         3.*w*y^2. + 3.*s*y^2. + 3.*y*s^2. + 6.*y*s*w)
pmf

#Question 3.1
set.seed(02138)
num_lst = list(1,2,3,4, 5,6, 7, 8, 9, 10,15,20,50,100,1000)
lamb_lst=list()
for (num in num_lst)
{
  assign(paste('lamb', num, sep=''), rpois(10000, num))
  x = get(paste('lamb', num, sep=''))
  
  hist(x, 25)
  mu = mean(x)
  v = var(x)
  cat('mean:', mu, '\nvariance:', v, '\n\n')

}

#print histograms for Latex
pdf(("gov2000/Q3_1_hist1.pdf"), height=4, width=6)
print(hist(lamb1, breaks=25, 
           main="Histogram of Lambda = 1", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

pdf(("gov2000/Q3_1_hist2.pdf"), height=4, width=6)
print(hist(lamb5, breaks=25, 
           main="Histogram of Lambda = 5", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

pdf(("gov2000/Q3_1_hist3.pdf"), height=4, width=6)
print(hist(lamb50,breaks=25, 
           main="Histogram of Lambda = 50", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

pdf(("gov2000/Q3_1_hist4.pdf"), height=4, width=6)
print(hist(lamb1000,breaks=25, 
           main="Histogram of Lambda = 1000", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

#Question 3.2
lamb_sum = lamb1 + lamb2
sum_mu = mean(lamb_sum)
sum_v = var(lamb_sum)

pdf(("gov2000/Q3_2_hist.pdf"), height=6, width=6)
print(hist(lamb_sum, ,breaks=25, 
           main="Histogram of Lambda = 1 + 2", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

#Question 3.3
lamb_sum2 = (lamb1 + lamb2 + lamb3 + lamb4 + lamb5 + lamb6 + lamb7 + lamb8 
             + lamb9 + lamb10)
sum_mu2 = mean(lamb_sum2)
sum_v2 = var(lamb_sum2)

pdf(("gov2000/Q3_3_hist1.pdf"), height=6, width=6)
print(hist(lamb_sum2,breaks=25, 
           main="Histogram of Sum of 10 lambdas", 
           xlab = "k occurences", 
           ylab = "Frequency of k occurences"))
dev.off()

set.seed(02138)
lamb55 = rpois(10000,55)
mu_test = mean(lamb55)
v_test = var(lamb55)

#Question 3.4
set.seed(02138)
lamb40 = rpois(10000,40)
mu_lamb40 = mean(lamb40)
v_lamb40 = var(lamb40)

sim = rnorm(10000, 40, sqrt(40))
mu_sim = mean(sim)
v_sim = var(sim)

pdf(("gov2000/Q3_4_hist1.pdf"), height=6, width=6)
print(
  hist(lamb40, breaks=25, col=rgb(1,0,0,.5), main="Histograms comparing the normal and Poisson distributions"),
)
print(hist(sim, breaks=25, col=rgb(0,0,1,.5), add=TRUE)
)
print(legend("topright", c("Poisson", "Normal"), col=c("red", "blue"), lwd=10))
      #relationship is that lamba = mu and lambda = variance (sd^2)
dev.off()


#Question 3.5
set.seed(02138)
binom1 = rbinom(10000, 10000, 0.01)
mu_binom = mean(binom1)
v_binom = var(binom1)

lamb_binom = rpois(10000,100)
mu_lamb_bi = mean(lamb_binom)
v_lamb_bi = var(lamb_binom)
# lambda = n * p 