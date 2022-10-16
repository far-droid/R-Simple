data_cust %>% 
  mutate(Salary_class = ifelse(test = Salary > mean(Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary"))

data_cust$Salary_class <- as.factor(ifelse(test = data_cust$Salary > mean(data_cust$Salary, na.rm = T), 
                                           yes = "High salary", 
                                           no = "Low salary"))
data_cust$Salary_class 


#Gantilah tipe data pada Salary_class menjadi factor. (`as.factor()`)

data_cust%>%
  mutate(Country = as.factor(Country),
         Purchased = as.factor(Purchased))

data_cust$Country <- as.factor(data_cust$Country)
data_cust$Purchased <- as.factor(data_cust$Purchased)

data_cust %>% 
  select(-c(Age, Salary))

data_cust %>%
  mutate (Pur = ifelse(test = Purchased == "Yes", yes = TRUE, no = FALSE))


data_salary <- data_cust %>% 
  group_by(Country) %>% 
  summarise(mean_salary = mean(Salary, na.rm = T))

data_salary %>% 
  arrange(desc(mean_salary))


data_cust %>% 
  filter(Salary > 70000)



#Untuk belajar lebih jauh mengenai data transformation bisa mengacu pada link ini https://r4ds.had.co.nz/transform.html


