# loading packages --------------------------------------------------------
library(tidyverse)

# Getting comfortable in RStudio ------------------------------------------
2 + 2
x <- 10
x * 2
print(x)

df <- data.frame(a = c(0,2,3), b = c(0,2,6))

plot(df$a, df$b)



# Recommended workflow ----------------------------------------------------

# Consistent naming
a <- 10
b <- 20

# Avoid
a <- 10
B <- 10



# Good naming
total_sales <- 12500
average_price <- mean(price)

# Avoid
total sales <- 12500
total_sales_final2 <- 12500





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
# install.packages("tidyverse")
library(tidyverse)

# Load an individual package
library(readxl)





# Counting, slicing and summarising ---------------------------------------
?ToothGrowth
df <- ToothGrowth
glimpse(df)

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


# Core dplyr verbs --------------------------------------------------------
df |> 
  select(dose)

df |> 
  filter(supp == "VC") |> 
  arrange(len)

df |> 
  mutate(len_mm = len/1000)


# Visualization with ggplot2 ----------------------------------------------
df |> 
  ggplot(aes(x = supp, y = len, color = factor(dose))) +
  geom_point()

df |> 
  ggplot(aes(x = supp, y = len, color = factor(dose))) +
  geom_point(position = position_dodge(width = 0.5)) +
  labs(x = "Supplement type",
       y = "Tooth length",
       color = "Dose (milligrams/day)") + 
  theme_minimal()

df |> 
  ggplot(aes(x = factor(dose), y = len, fill = supp)) +
  geom_boxplot() +
  labs(x = "Dose (milligrams/day)",
       y = "Tooth length",
       fill = "Supplement type") + 
  theme_minimal()












