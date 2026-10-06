library(tidyverse)



# loading data ------------------------------------------------------------
gtex_v11_subjects <- read_tsv("data/GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt")
glimpse(gtex_v11_subjects)


# transforming data -------------------------------------------------------
gtex_v11_subjects <- gtex_v11_subjects |>
  na.omit()

gtex_v11_subjects <- gtex_v11_subjects |> 
  mutate(sex_fm = if_else(SEX == 1, "m", "f"))

# significance testing ----------------------------------------------------

# Null hypothesis (H0): Death classification and sex are independent — 
# the distribution of classifications is the same across sex.

# Alternative hypothesis (H1): Death classification and sex are associated — 
# the distribution of causes differs between sex.

## create a contingency table -------------------------------------------
gtex_v11_subjects |> 
  count(sex_fm, DTHHRDY)
# untransformed counts

gtex_v11_subjects |> 
  count(sex_fm, DTHHRDY) |> 
  pivot_wider(names_from = DTHHRDY, values_from = n)
# same values, different structure


contingency_table <- gtex_v11_subjects |> 
  count(sex_fm, DTHHRDY) |> 
  pivot_wider(names_from = DTHHRDY, values_from = n)


contingency_table

## chi squared test  -------------------------------------------------------

# removing column without counts for test
chisq.test(
  contingency_table |> 
    select(-sex_fm)
)


## exporting contingency table ---------------------------------------------
dir("results/tables")

write_delim(
  contingency_table,
  file = "results/tables/contingency_table_death_sex.csv",
  delim = ";"
)

dir("results/tables")



