
install.packages("tidyverse")

library(ggplot2)
library(dplyr)
library(tidyverse)
library(scales)

## Read in KidzBop Data
KidzBop <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)

##Create a histogram that describes how often each category is used as a reason to censor a word
number_of_times_category <- KidzBop %>% count(category)

ggplot(number_of_times_category) + 
  geom_col(aes(x = category, y = n, fill = category)) + 
  labs(title = "The Total Amount of Times each Category is Used \n as a Reason of Censorship from 2001-2019", x = "Category", y = "The Frequency of a Category") + 
  theme(plot.title = element_text(hjust = .5)) +
  scale_fill_brewer(palette = "Dark2") +
  scale_y_continuous(breaks = seq(0, 400, 50)) +
  theme_bw() + theme(panel.grid.major=element_line(colour="black")) + 
  theme(panel.grid.minor=element_line(colour="black"))
  
