kidz_bop_data <- read.csv("https://raw.githubusercontent.com/the-pudding/data/master/kidz-bop/KB_censored-lyrics.csv", stringsAsFactors = FALSE)

library("dplyr")

kidz_bop_table <- kidz_bop_data %>% group_by(year) %>% summarise(badwords_total = sum(isCensored), badwords_num = n_distinct(badword), max_category = max(category), each_mean = round(badwords_total / badwords_num, 2)) %>% arrange(desc(badwords_total))

colnames(kidz_bop_table) <- c("Year", "Total Number of Bad Words Used", "Unique Bad Words Used", "Most Prevalent Category", "Average Number of Times Each Bad Word Was Used")