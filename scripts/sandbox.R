# loading packages --------------------------------------------------------
library(tidyverse)

# Getting comfortable in RStudio ------------------------------------------
2 + 2
x <- 10
x * 2
print(x)

df <- data.frame(a = c(0,2,3), b = c(0,2,6))

plot(df$a, df$b)



# Objects and data types --------------------------------------------------
age <- 35
name <- "Anna"
passed <- TRUE
scores <- c(75, 82, 91)
df <- data.frame(name, age, passed)
class(age)
class(df)
str(df)


# Operators, variables and functions --------------------------------------
x <- 10
x + 5
x == 10
x > 5
mean(c(10, 20, 30))
round(3.14159, digits = 2)
?mean




# What is the tidyverse? --------------------------------------------------
install.packages("tidyverse")
library(tidyverse)

# Or load an individual package
library(readxl)




# Counting, slicing and summarising ---------------------------------------
?ToothGrowth
df <- ToothGrowth

df |> 
  count(supp)

df |> 
  count(supp, dose)

df |> 
  slice_max(len, n = 3)


df |> 
  group_by(supp, dose) |> 
  reframe(
    mean = mean(len),
    median = median(len),
    sd = sd(len)
  )












