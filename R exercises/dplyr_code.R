#state.x77
library(dplyr);
library(ggplot2);
install.packages("downloader");

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- "msleep_ggplot2.csv"
if (!file.exists(filename)) download(url,filename)
msleep <- read.csv("msleep_ggplot2.csv")
head(msleep)

str(msleep)

sleepData <- select(msleep, name, sleep_total)
head(sleepData)

sleepData <- select(msleep, name, sleep_total)
head(sleepData)
head(select(msleep, -name))
head(select(msleep, name:order))
head(select(msleep, starts_with("sl")))
filter(msleep, sleep_total >= 16)
filter(msleep, sleep_total >= 16, bodywt >= 1)
filter(msleep, sleep_total >= 16 , bodywt >= 1)
filter(msleep, order %in% c("Perissodactyla", "Primates"))
head(select(msleep, name, sleep_total))
filter(msleep, sleep_total >=16)


### %>% pipe operator

msleep %>% 
  select(name, sleep_total) %>% 
  head


#arrange
msleep %>% arrange(order) %>% head(20)

example(head)

# Now, we will select three columns from msleep, arrange the rows by the taxonomic order and then arrange the rows by sleep_total. Finally show the head of the final data frame

msleep %>%
  select(name, order, sleep_total) %>%
  arrange(order, sleep_total) %>%
  head
  
# Same as above, except here we filter the rows for mammals that sleep for 16 or more hours instead of showing the head of the final data frame

msleep %>%
  select(name, order, sleep_total) %>%
  filter(sleep_total > 16) %>%
    arrange(order, sleep_total) 
# 
# The mutate() function will add new columns to the data frame. Create a new column called rem_proportion which is the ratio of rem sleep to total amount of sleep.

msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total) %>%
  head

msleep %>% 
  mutate(rem_proportion = sleep_rem / sleep_total, 
         bodywt_grams = bodywt * 1000) %>%
  head

# The summarise() function will create summary statistics for a given column in the data frame such as finding the mean. For example, to compute the average number of hours of sleep, apply the mean() function to the column sleep_total and call the summary value avg_sleep.

msleep %>% 
  summarise(avg_sleep = mean(sleep_total))

msleep %>% 
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total),
            max_sleep = max(sleep_total),
            total = n())

msleep %>% 
  group_by(order) %>%
  summarise(avg_sleep = mean(sleep_total), 
            min_sleep = min(sleep_total), 
            max_sleep = max(sleep_total),
            total = n(),
            dist_tot = n_distinct(sleep_total))