library(tidyverse)
library(dplyr)
## Handling missing value

data_cust <- read.csv("data/customer_data.csv")
data_cust

#Cek Missing Value

data_cust %>% 
  is.na() %>% 
  colSums()


### Membuang NA (Missing Value)

data_cust <- data_cust %>% 
  drop_na()

### Mengganti nilai NA dengan sebuah nilai

data_clean <- data_cust %>% 
  mutate(Age = replace_na(data = Age, replace = mean(Age, na.rm = TRUE)),
         Salary = replace_na(data = Salary, replace = mean(Salary, na.rm = TRUE)),
         Salary_class = replace_na(ifelse(test = Salary > mean(Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary")))
