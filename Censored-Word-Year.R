library(dplyr)
library(tidyverse)
library(ggplot2)

kidz_data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv")

sum_censored_words <- kidz_data %>% group_by(year) %>% 
  summarise(count = sum(count))

# Graphs the amount of censored words by year in a line graph
ggplot(data = sum_censored_words) + 
  geom_line(mapping = aes(x = year, y = count)) +
  labs(title = "Censorship By Year", x = "Year", y = " Word Count" )


