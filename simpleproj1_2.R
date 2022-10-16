data_clean %>% 
  mutate(Address = c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                     "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang"))

data_clean$Address <- c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                        "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang")



data_clean %>% 
  mutate(Salary_class <- as.factor(ifelse(test = data_cust$Salary > mean(data_cust$Salary, na.rm = T), 
                                          yes = "High salary", 
                                          no = "Low salary")))

data_clean$Address <- as.factor(c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                                  "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang"))
#data_clean



data_clean %>% 
  select(-c(Age, Salary))

data_clean$Pur <-  ifelse(test = data_clean$Purchased == "Yes", yes = TRUE, no = FALSE)


data_salary_2 <- data_clean %>% 
  group_by(Country) %>% 
  summarise(mean_salary = mean(Salary, na.rm = T))



data_salary_2 %>% 
  arrange(desc(mean_salary))

data_clean %>% 
  filter(Salary>70000)
