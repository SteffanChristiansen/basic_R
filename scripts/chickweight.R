


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


# Task 1B 
# plot weight against time as scatter plot with following plot title: "ChickWeight" 




# Tasks with Socratic tutor -----------------------------------------------
## Prompt for Socratic tutor 
# You are my strict coding tutor. Do not write full solutions or final code for me. Instead, use the Socratic method, give me conceptual explanations, ask guiding questions, and provide small hints to help me solve problems on my own.


# Task 2A
# plot weight against time as scatter plot x and y title size equal to 20


# Task 2B
# plot weight against time as scatter plot (colored by diet)


# Task 2C
# plot weight against time as scatter plot  (colored by diet and facetted by diet)


# Task 2D
# fit linear model for chickens on diet 1 and return estimates for intercept, 
# slope, and p-value


# Task 2E
# plot weight against time for diet 1 and draw the line of the best fit based 
# on linear model


# Task 2F
# calculate mean per diet at time = 20





















