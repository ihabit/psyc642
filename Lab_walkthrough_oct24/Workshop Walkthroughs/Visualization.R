# Set up ----

# Install Packages as Needed
#install.packages("haven")
#install.packages("dplyr")
#install.packages("GGally")

# Read in Data File
library(haven)
Lab_HW_12 <- read_sav("Workshop 5 - Plotting/Lab HW 12.sav")
View(Lab_HW_12)

## https://infoguides.gmu.edu/learn_r/graphics

# Needed to use %>%
library(dplyr)

# Create a object with factors
hw <- as_factor(Lab_HW_12)


# Building Layers in ggplot ----

library(ggplot2)

ggplot()

ggplot(data=hw)

ggplot(data=hw, mapping=aes(x=Organization))

hw %>% ggplot(aes(Organization))

# Univaritate Graphs ----

hw %>% ggplot(aes(Organization)) +
  geom_bar()

hw %>% ggplot(aes(Organization)) +
  geom_histogram()

hw %>% ggplot(aes(Organization)) +
  geom_histogram(binwidth=1)

# Bar Charts with Color ----

hw %>% ggplot(aes(Organization, fill=Education, color=Time)) +
  geom_bar()

hw %>% ggplot(aes(Organization, fill=Education, color=Time)) +
  geom_boxplot()


# Scatterplots ----

b <- hw %>% ggplot(aes(x=SleepDep, y=Organization))

b + geom_point()

b + geom_point() + geom_smooth()

b + geom_point(alpha=.2)

b + geom_jitter()

b + geom_jitter(color="red", shape=3)

b + geom_jitter(aes(color=Education), shape=3)



# On the Fly Data Type Changes ----

b + geom_jitter(
  aes( color = as.numeric(Education))
)

b + geom_jitter(
  aes( color = as.factor(Education))
)

# Aesthetic Function Placement ----

hw %>% ggplot(aes(SleepDep, Organization, 
                  color = Education)) +
  geom_point()

hw %>% ggplot() +
  geom_point(aes(SleepDep, Organization, 
                 color = Education))

hw %>% ggplot() +
  geom_point(aes(SleepDep, Organization, 
                 color = Education)) +
  geom_smooth()
  # ERROR, geom_smooth has no data!

hw %>% ggplot() +
  geom_point(aes(SleepDep, Organization, 
                 color = Education)) +
  geom_smooth(aes(SleepDep, Organization, 
                  color = Education))
  # Works, but repetative

hw %>% ggplot(aes(SleepDep, Organization, 
                  color = Education)) +
  geom_point() +
  geom_smooth()
  # BEST

# More Layers ----

p <- b + geom_jitter(aes(color=Education))

p + coord_equal()
p + coord_cartesian(xlim=c(0,400))

p + theme_classic()
p + theme_minimal()

p + facet_wrap(~Time)
p + facet_wrap(Education ~ Time)


# GGally ----

library(GGally)

ggpairs(hw)
ggpairs(Lab_HW_12)

ggcorr(hw)
ggcorr(Lab_HW_12, label=TRUE,label_round=2)

ggscatmat(hw)
ggscatmat(hw,color="Education")

