Simple Project
================
farhan
16/10/2022

``` r
library(tidyverse)
library(dplyr)
```

## Handling missing value

``` r
data_cust <- read.csv("data/customer_data.csv")
data_cust
```

    ##    Country Age Salary Purchased
    ## 1   France  44  72000        No
    ## 2    Spain  27  48000       Yes
    ## 3  Germany  30  54000        No
    ## 4    Spain  38  61000        No
    ## 5  Germany  40     NA       Yes
    ## 6   France  35  58000       Yes
    ## 7    Spain  NA  52000        No
    ## 8   France  48  79000       Yes
    ## 9  Germany  50  83000        No
    ## 10  France  37  67000       Yes

Cek Missing Value

``` r
data_cust %>% 
  is.na() %>% 
  colSums()
```

    ##   Country       Age    Salary Purchased 
    ##         0         1         1         0

Dari hasil pengecekan, didapat bahwa terdapat 1 NA pada variabel Age dan
Salary.

Cara menghandle NA ada beberapa cara:  
- Dibuang baris-baris yang mengandung NA kalau jumlahnya &lt; 5% data  
- Imputation (NA diisi oleh suatu nilai)  
ketika datanya numerik, diisi dengan mean/median, kalau kategorikal
diisi dengan modus - Membuang variabel yang banyak mengandung NA

### Membuang NA (Missing Value)

``` r
data_cust %>% 
  drop_na()
```

    ##   Country Age Salary Purchased
    ## 1  France  44  72000        No
    ## 2   Spain  27  48000       Yes
    ## 3 Germany  30  54000        No
    ## 4   Spain  38  61000        No
    ## 5  France  35  58000       Yes
    ## 6  France  48  79000       Yes
    ## 7 Germany  50  83000        No
    ## 8  France  37  67000       Yes

### Mengganti nilai NA dengan sebuah nilai

``` r
data_clean <- data_cust %>% 
  mutate(Age = replace_na(data = Age, replace = mean(Age, na.rm = TRUE)),
         Salary = replace_na(data = Salary, replace = mean(Salary, na.rm = TRUE)),
         Salary_class = replace_na(ifelse(test = Salary > mean(Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary")))
data_clean
```

    ##    Country      Age   Salary Purchased Salary_class
    ## 1   France 44.00000 72000.00        No  High salary
    ## 2    Spain 27.00000 48000.00       Yes   Low salary
    ## 3  Germany 30.00000 54000.00        No   Low salary
    ## 4    Spain 38.00000 61000.00        No   Low salary
    ## 5  Germany 40.00000 63777.78       Yes   Low salary
    ## 6   France 35.00000 58000.00       Yes   Low salary
    ## 7    Spain 38.77778 52000.00        No   Low salary
    ## 8   France 48.00000 79000.00       Yes  High salary
    ## 9  Germany 50.00000 83000.00        No  High salary
    ## 10  France 37.00000 67000.00       Yes  High salary

\#\#Percobaan 2

1.  Membuat sebuah variabel `salary_class` yang berisikan keterangan
    jika salary &gt; mean(salary) maka high salary, jika tidak maka low
    salary. Gunakanlah `data_cust`.

Cara 1: menggunakan fungsi mutate()

``` r
data_cust %>% 
  mutate(Salary_class = ifelse(test = Salary > mean(Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary"))
```

    ##    Country Age Salary Purchased Salary_class
    ## 1   France  44  72000        No  High salary
    ## 2    Spain  27  48000       Yes   Low salary
    ## 3  Germany  30  54000        No   Low salary
    ## 4    Spain  38  61000        No   Low salary
    ## 5  Germany  40     NA       Yes         <NA>
    ## 6   France  35  58000       Yes   Low salary
    ## 7    Spain  NA  52000        No   Low salary
    ## 8   France  48  79000       Yes  High salary
    ## 9  Germany  50  83000        No  High salary
    ## 10  France  37  67000       Yes  High salary

Cara 2: menggunakan syntax base R

``` r
data_cust$Salary_class <- as.factor(ifelse(test = data_cust$Salary > mean(data_cust$Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary"))
data_cust$Salary_class 
```

    ##  [1] High salary Low salary  Low salary  Low salary  <NA>        Low salary 
    ##  [7] Low salary  High salary High salary High salary
    ## Levels: High salary Low salary

2.  Gantilah tipe data pada Salary\_class menjadi factor.
    (`as.factor()`)

Cara 1: menggunakan fungsi mutate()

``` r
data_cust%>%
mutate(Country = as.factor(Country),
       Purchased = as.factor(Purchased))
```

    ##    Country Age Salary Purchased Salary_class
    ## 1   France  44  72000        No  High salary
    ## 2    Spain  27  48000       Yes   Low salary
    ## 3  Germany  30  54000        No   Low salary
    ## 4    Spain  38  61000        No   Low salary
    ## 5  Germany  40     NA       Yes         <NA>
    ## 6   France  35  58000       Yes   Low salary
    ## 7    Spain  NA  52000        No   Low salary
    ## 8   France  48  79000       Yes  High salary
    ## 9  Germany  50  83000        No  High salary
    ## 10  France  37  67000       Yes  High salary

Cara 2: menggunakan syntax base R

``` r
data_cust$Country <- as.factor(data_cust$Country)
data_cust$Purchased <- as.factor(data_cust$Purchased)
```

3.  Tampilkan semua variabel dalam tabel kecuali variabel Age dan
    Salary.

``` r
data_cust %>% 
  select(-c(Age, Salary))
```

    ##    Country Purchased Salary_class
    ## 1   France        No  High salary
    ## 2    Spain       Yes   Low salary
    ## 3  Germany        No   Low salary
    ## 4    Spain        No   Low salary
    ## 5  Germany       Yes         <NA>
    ## 6   France       Yes   Low salary
    ## 7    Spain        No   Low salary
    ## 8   France       Yes  High salary
    ## 9  Germany        No  High salary
    ## 10  France       Yes  High salary

4.  Membuat sebuah variabel Pur yang berisikan jika nilai variabel
    Purchased = Yes, maka nilai variabel Pur = TRUE, jika nilai variabel
    Purchades = No, maka nilai variabel Pur = FALSE. if else

``` r
data_cust %>%
  mutate (Pur = ifelse(test = Purchased == "Yes", yes = TRUE, no = FALSE))
```

    ##    Country Age Salary Purchased Salary_class   Pur
    ## 1   France  44  72000        No  High salary FALSE
    ## 2    Spain  27  48000       Yes   Low salary  TRUE
    ## 3  Germany  30  54000        No   Low salary FALSE
    ## 4    Spain  38  61000        No   Low salary FALSE
    ## 5  Germany  40     NA       Yes         <NA>  TRUE
    ## 6   France  35  58000       Yes   Low salary  TRUE
    ## 7    Spain  NA  52000        No   Low salary FALSE
    ## 8   France  48  79000       Yes  High salary  TRUE
    ## 9  Germany  50  83000        No  High salary FALSE
    ## 10  France  37  67000       Yes  High salary  TRUE

5.  Berapa rata-rata salary tiap country dari data.

``` r
data_salary <- data_cust %>% 
group_by(Country) %>% 
summarise(mean_salary = mean(Salary, na.rm = T))
```

6.  Country apa yang memiliki rerata salary paling kecil? Urutkan data!

``` r
data_salary %>% 
  arrange(desc(mean_salary))
```

    ## # A tibble: 3 x 2
    ##   Country mean_salary
    ##   <fct>         <dbl>
    ## 1 France       69000 
    ## 2 Germany      68500 
    ## 3 Spain        53667.

7.  Ada berapa data yang memiliki salary di atas 70.000 dari data awal
    yaitu `data_clean`?

``` r
data_cust %>% 
  filter(Salary > 70000)
```

    ##   Country Age Salary Purchased Salary_class
    ## 1  France  44  72000        No  High salary
    ## 2  France  48  79000       Yes  High salary
    ## 3 Germany  50  83000        No  High salary

Untuk belajar lebih jauh mengenai data transformation bisa mengacu pada
link ini <https://r4ds.had.co.nz/transform.html>

\#\#\#\#\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
\#\# Percobaan 2 1. Buatlah sebuah variabel Address yang berisikan
apapun menggunakan data\_clean.

Cara 1: menggunakan fungsi mutate()

``` r
data_clean %>% 
  mutate(Address = c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                        "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang"))
```

    ##    Country      Age   Salary Purchased Salary_class Address
    ## 1   France 44.00000 72000.00        No  High salary   Bogor
    ## 2    Spain 27.00000 48000.00       Yes   Low salary Bandung
    ## 3  Germany 30.00000 54000.00        No   Low salary   Medan
    ## 4    Spain 38.00000 61000.00        No   Low salary Cianjur
    ## 5  Germany 40.00000 63777.78       Yes   Low salary   Depok
    ## 6   France 35.00000 58000.00       Yes   Low salary   Bogor
    ## 7    Spain 38.77778 52000.00        No   Low salary Jakarta
    ## 8   France 48.00000 79000.00       Yes  High salary Lampung
    ## 9  Germany 50.00000 83000.00        No  High salary  Bekasi
    ## 10  France 37.00000 67000.00       Yes  High salary  Serang

Cara 2: menggunakan syntax base R

``` r
data_clean$Address <- c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                        "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang")
```

2.  Gantilah tipe data pada Salary\_class menjadi factor.

Cara 1: menggunakan fungsi mutate()

``` r
data_clean %>% 
  mutate(Salary_class <- as.factor(ifelse(test = data_cust$Salary > mean(data_cust$Salary, na.rm = T), 
                               yes = "High salary", 
                               no = "Low salary")))
```

    ##    Country      Age   Salary Purchased Salary_class Address ... <- NULL
    ## 1   France 44.00000 72000.00        No  High salary   Bogor High salary
    ## 2    Spain 27.00000 48000.00       Yes   Low salary Bandung  Low salary
    ## 3  Germany 30.00000 54000.00        No   Low salary   Medan  Low salary
    ## 4    Spain 38.00000 61000.00        No   Low salary Cianjur  Low salary
    ## 5  Germany 40.00000 63777.78       Yes   Low salary   Depok        <NA>
    ## 6   France 35.00000 58000.00       Yes   Low salary   Bogor  Low salary
    ## 7    Spain 38.77778 52000.00        No   Low salary Jakarta  Low salary
    ## 8   France 48.00000 79000.00       Yes  High salary Lampung High salary
    ## 9  Germany 50.00000 83000.00        No  High salary  Bekasi High salary
    ## 10  France 37.00000 67000.00       Yes  High salary  Serang High salary

Cara 2: menggunakan syntax base R

``` r
data_clean$Address <- as.factor(c("Bogor", "Bandung", "Medan", "Cianjur", "Depok",
                        "Bogor", "Jakarta", "Lampung", "Bekasi", "Serang"))
data_clean
```

    ##    Country      Age   Salary Purchased Salary_class Address
    ## 1   France 44.00000 72000.00        No  High salary   Bogor
    ## 2    Spain 27.00000 48000.00       Yes   Low salary Bandung
    ## 3  Germany 30.00000 54000.00        No   Low salary   Medan
    ## 4    Spain 38.00000 61000.00        No   Low salary Cianjur
    ## 5  Germany 40.00000 63777.78       Yes   Low salary   Depok
    ## 6   France 35.00000 58000.00       Yes   Low salary   Bogor
    ## 7    Spain 38.77778 52000.00        No   Low salary Jakarta
    ## 8   France 48.00000 79000.00       Yes  High salary Lampung
    ## 9  Germany 50.00000 83000.00        No  High salary  Bekasi
    ## 10  France 37.00000 67000.00       Yes  High salary  Serang

3.  Tampilkan semua variabel dalam tabel kecuali variabel Age dan
    Salary.

``` r
data_clean %>% 
    select(-c(Age, Salary))
```

    ##    Country Purchased Salary_class Address
    ## 1   France        No  High salary   Bogor
    ## 2    Spain       Yes   Low salary Bandung
    ## 3  Germany        No   Low salary   Medan
    ## 4    Spain        No   Low salary Cianjur
    ## 5  Germany       Yes   Low salary   Depok
    ## 6   France       Yes   Low salary   Bogor
    ## 7    Spain        No   Low salary Jakarta
    ## 8   France       Yes  High salary Lampung
    ## 9  Germany        No  High salary  Bekasi
    ## 10  France       Yes  High salary  Serang

4.  Buatlah sebuah variabel Pur yang berisikan jika nilai variabel
    Purchased = Yes, maka nilai variabel Pur = TRUE, jika nilai variabel
    Purchades = No, maka nilai variabel Pur = FALSE.

``` r
data_clean$Pur <-  ifelse(test = data_clean$Purchased == "Yes", yes = TRUE, no = FALSE)
```

5.  Berapa rata-rata salary tiap country dari data.

``` r
data_salary_2 <- data_clean %>% 
group_by(Country) %>% 
summarise(mean_salary = mean(Salary, na.rm = T))
```

6.  Country apa yang memiliki rerata salary paling besar?

``` r
data_salary_2 %>% 
arrange(desc(mean_salary))
```

    ## # A tibble: 3 x 2
    ##   Country mean_salary
    ##   <chr>         <dbl>
    ## 1 France       69000 
    ## 2 Germany      66926.
    ## 3 Spain        53667.

7.  Ada berapa data yang memiliki salary di atas 70.000 dari data awal
    yaitu `data_clean`?

``` r
data_clean %>% 
  filter(Salary>70000)
```

    ##   Country Age Salary Purchased Salary_class Address   Pur
    ## 1  France  44  72000        No  High salary   Bogor FALSE
    ## 2  France  48  79000       Yes  High salary Lampung  TRUE
    ## 3 Germany  50  83000        No  High salary  Bekasi FALSE
