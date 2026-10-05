




# Create folder structure -------------------------------------------------
getwd()
dir() # blank

dir.create("scripts")
dir.create("data")
dir.create("reports")
dir.create("doc")
dir.create("results")
dir.create("results/tables")
dir.create("results/images")
dir.create("results/processed")

dir() # created folder structure
getwd()
# GTEx data ---------------------------------------------------------------

library(tidyverse)


# Instructions:
# 1) Go to https://gtexportal.org/home/downloads/adult-gtex/metadata
# 2) Download GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt - do not rename file

list.files("data")
# "GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt" should be available in folder


# test different functions for reading data: 
gtex_v11_subjects <- read_csv("data/GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt")
glimpse(gtex_v11_subjects)

gtex_v11_subjects <- read_csv2("data/GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt")
glimpse(gtex_v11_subjects)

gtex_v11_subjects <- read_tsv("data/GTEx_Analysis_v11_Annotations_SubjectPhenotypesDS.txt")
glimpse(gtex_v11_subjects)

gtex_v11_subjects |> 
  slice(1:5)

# data exploration
gtex_v11_subjects |> 
  count(DTHHRDY)

nrow(gtex_v11_subjects)

gtex_v11_subjects <- gtex_v11_subjects |>
  na.omit()
nrow(gtex_v11_subjects)
# filtration of object

# variable representation by sex (encoded as numeric)
gtex_v11_subjects |> 
  count(SEX)

gtex_v11_subjects |> 
  mutate(sex_fm = if_else(SEX == 1, "m", "f"))


# variable representation by age (represented by character)
gtex_v11_subjects |> 
  count(AGE)

