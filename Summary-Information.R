library(dplyr)
library(tidyverse)

kidz_data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv")

summary_info <- list()

# This will find the year with the least amount of censored words
summary_info$min_censored_year <- kidz_data %>% group_by(year) %>% 
  summarise(count = sum(count)) %>%
  filter(count == min(count)) %>%
  pull(year)
# This will find the year with the most amount of censored words
summary_info$max_censored_year <- kidz_data %>% group_by(year) %>% 
  summarise(count = sum(count)) %>%
  filter(count == max(count)) %>%
  pull(year)

# This will find the song with the most amount of censored words
summary_info$song_most_censored <- kidz_data %>% group_by(songName) %>%
  summarise(count = sum(count)) %>%
  filter(count == max(count)) %>%
  pull(songName)

# This will find the most censored category of words
summary_info$most_censored_category <- kidz_data %>% group_by(category) %>%
  summarise(count = sum(count)) %>%
  filter(count == max(count)) %>%
  pull(category)

# This will find how Kidz Bop censored one of the lines in a song
summary_info$censored_lyric_switch <- kidz_data %>% filter(count == max(count)) %>%
  pull(kbLyric)


