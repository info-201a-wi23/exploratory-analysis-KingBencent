library(ggplot2)
library(dplyr)
library(tidyverse)

## Reading in data
KidzBop <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_word-overview.csv")

## Sorting data
bad_words <- KidzBop %>% select(category, badword, inSongs, censored)

## Creating scatterplot of how often a word appears and how often it is censored.
## Side note: Trying to figure out how to make the word show when you hover over it, will implement when I figure out how.
ggplot(data = bad_words) +
  geom_point(mapping = aes(x = inSongs, y = censored, color = category)) +
  labs(title = "How Often A Word Has Been Censored", x = "Word Frequency", y = "Censor Frequency")
  