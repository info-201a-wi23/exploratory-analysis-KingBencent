library(dplyr)
library(tidyverse)
library(ggplot2)

kidz_data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv")

sum_censored_words <- kidz_data %>% group_by(year) %>% 
                      summarise(count = sum(count))

ggplot(data = sum_censored_words) + 
  geom_line(mapping = aes(x = year, y = count)) + ggtitle("Censorship By Year")


