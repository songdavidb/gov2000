# Pset1, Question 3.1

num_lst = list(1,2,3,5,10,15,20,50,100,1000)
lamb_lst=list()
for (num in num_lst)
{
  set.seed(02138)
  assign(paste('lamb', num, sep=''), rpois(10000, num))
  hist(get(paste('lamb', num, sep='')), 25)
}

