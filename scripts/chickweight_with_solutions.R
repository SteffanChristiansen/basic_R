


# Exploring ChickWeight ---------------------------------------------------
library(tidyverse)
?ChickWeight
data(ChickWeight)

ChickWeight
glimpse(ChickWeight)
colnames(ChickWeight)


ChickWeight |> 
  count(Diet)
# four diets as expected

ChickWeight |>
  count(Chick, sort = TRUE) |> 
  arrange(n)
# missing data for five chicks




# Tasks without Socratic tutor -----------------------------------------------
# Based on the ChickWeight data, conduct following tasks:
# Task 1A 
# plot weight against time as scatter plot
ChickWeight |> 
  ggplot(aes(x = Time, y = weight)) + 
  geom_point(alpha = 0.5)


# Task 1B 
# plot weight against time as scatter plot with following plot title: "ChickWeight" 
ChickWeight |> 
  ggplot(aes(x = Time, y = weight)) + 
  geom_point(alpha = 0.5) + 
  labs(title = "ChickWeight")




# Tasks with Socratic tutor -----------------------------------------------
## Prompt for Socratic tutor 
# You are my strict coding tutor. Do not write full solutions or final code for me. Instead, use the Socratic method, give me conceptual explanations, ask guiding questions, and provide small hints to help me solve problems on my own.


# Task 2A
# plot weight against time as scatter plot x and y title size equal to 20
ChickWeight |> 
  ggplot(aes(x = Time, y = weight)) + 
  geom_point(alpha = 0.5) +
  theme(axis.title = element_text(size  = 20))


# Task 2B
# plot weight against time as scatter plot (colored by diet)
ChickWeight |> 
  ggplot(aes(x = Time, y = weight, color = Diet)) + 
  geom_point(alpha = 0.5)

# Task 2C
# plot weight against time as scatter plot  (colored by diet and facetted by diet)
ChickWeight |> 
  ggplot(aes(x = Time, y = weight, color = Diet)) + 
  geom_point(alpha = 0.5) + 
  facet_wrap(~Diet, ncol = 4)

# Task 2D
# fit linear model for chickens on diet 1 and return estimates for intercept, 
# slope, and p-value
ChickWeight_diet1 <- ChickWeight |> 
  filter(Diet == 1)

fit_diet1 <- lm(weight ~ Time, data = ChickWeight_diet1)
summary(fit_diet1)

# Task 2E
# plot weight against time for diet 1 and draw the line of the best fit based 
# on linear model
ChickWeight_diet1 <- ChickWeight |> 
  filter(Diet == 1)

ChickWeight_diet1 |> 
  ggplot(aes(x = Time, y = weight, color = Diet)) + 
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm")

# Task 2F
# calculate mean per diet at time = 20
ChickWeight_time20 <- ChickWeight |> 
  filter(Time == 20)

ChickWeight_time20 |> 
  group_by(Diet) |> 
  reframe(
    mean_weight = mean(weight)
  )





















