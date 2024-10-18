
## Read File
install.packages("haven")
library(haven)
Lab_2_HW <- read_sav("Lab 2 HW.sav")
View(Lab_2_HW)
library(tidyverse)

## Use the Round function
round(3.14159)
?round

## The same
round(3.14159, 2)
round(3.14159, digits = 2)
round(digits=2, 3.14159)
round(x=3.14159, digits = 2)

## Not what we want
round(2, 3.14159)

## Install Package (just once)
install.packages("summarytools")
install.packages("psych")
install.packages("dplyr")

## Load Package (every time)
library(summarytools)
library(dplyr)
library(psych)

## The same (for this function)
describe(Lab_2_HW$Friends)
descr(Lab_2_HW$Friends)

descr(Lab_2_HW,Friends)
Lab_2_HW %>% descr(Friends)

## Look at the function help
?descr

## The same
dfSummary(Lab_2_HW) %>% view()
view(dfSummary(Lab_2_HW))

# Convert labelled vector to numeric
Lab_2_HW$Friends <- as.numeric(as_factor(Lab_2_HW$Friends))

# Use describe function
describe(Lab_2_HW$Friends)

Lab_2_HW$Friends <- as.numeric(Lab_2_HW$Friends)

Lab_2_HW$Friends <- as.numeric(haven::as_factor(Lab_2_HW$Friends))

#This shit sucks.


