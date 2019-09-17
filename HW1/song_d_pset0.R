library("tidyverse")
library(tikzDevice)

#How do I ensure this loads correctly in a different environment/machine?
load("C:/Users/davidsong/Documents/gov2000/pelection2016.RData")

pe16 <- mutate(pelection2016,
                    dem_vote = `Hillary Clinton` / totalvote,
                    rep_vote = `Donald J. Trump` / totalvote
                     )

# HW0.1
mu_dem <- mean(pe16$dem_vote)
mu_rep <- mean(pe16$rep_vote)


# HW0.2
pdf(file = "HW0hist1.pdf", width = 5, height = 5)
dem_hist <- ggplot(data = pe16) +
  geom_histogram(mapping = aes(x = dem_vote)) +
  labs(title = "Histogram of Democratic Vote Share by County",
       x = "Democratic Vote Share of a County", y = "Number of counties")
print(dem_hist)
dev.off()

pdf(file = "HW0hist2.pdf", width = 5, height = 5)
rep_hist <- ggplot(data = pe16) +
  geom_histogram(mapping = aes(x = rep_vote)) +
  labs(title = "Histogram of Republican Vote Share by County",
       x = "Republican Vote Share of a County", y = "Number of counties")
print(rep_hist)
dev.off()


# HW0.3
total_dem_vote <- sum(pe16$`Hillary Clinton`) / sum(pe16$totalvote)
total_rep_vote <- sum(pe16$`Donald J. Trump`) / sum(pe16$totalvote)

# HW0.4
#tikz(file = 'HW0plot1.tex')
pdf(file = "gov2000/HW0plot1.pdf", width = 5, height = 3)
dem_plot <- ggplot(data = pe16) + 
  geom_point(mapping = aes(x = totalvote, y = dem_vote)) +
  scale_x_log10() + labs(title="Democratic voter share based on total county votes", 
                                  x="Log10 of total votes cast in a county", y="Democratic voter share in a county")
print(dem_plot)
dev.off()

# HW0.5
pe16 <- pe16 %>%
  mutate(third_vote = select(., `Evan McMullin`:`Rocky Giordani`) %>% rowSums())

select(filter(pe16, pe16$third_vote == max(pe16$third_vote)), name)

#HW0.6
pe16 = pe16 %>%
  mutate(dem_margin = .$dem_vote - .$rep_vote)

pdf(file = "gov2000/HW0plot2.pdf", width = 6, height = 4)
dem_margin_plot <- ggplot(data = pe16) +
  geom_point(mapping = aes(x = third_vote/totalvote, y = dem_margin, size = totalvote))+
  labs(title="Democratic voter share margin vs. third party voter share",
       x="Third party voter share", y="Democratic voter share margin", size="Total votes")
print(dem_margin_plot)
dev.off()

