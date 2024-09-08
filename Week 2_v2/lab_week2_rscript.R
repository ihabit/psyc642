install.packages("psych")
install.packages("modeest")
library(tidyverse)
library(psych)
library(modeest)

# Load local CSV and assign to dataframe "df"

df <- read.csv("week2_data_set_rosenberg_SES.csv")

# 1. Generate descriptive statistics for Q5, including the
# mean, median, variance, and standard deviation

describe(df$q5, 
         na.rm = TRUE, 
         interp=FALSE,
         skew = TRUE, 
         ranges = TRUE,
         trim=.1,
         type=3,
         check=TRUE,
         fast=NULL,
         quant=NULL,
         IQR=FALSE,
         omit=FALSE,
         data=NULL)

# 2. Hand calculate the mean for Q4.
# m = ∑x / n

q4mean <- sum(4, 4, 2, 4, 3) / 5
print(q4mean)

# 3. What is the median for Q4? The mode?

describe(df)

q4mode2 <- (df$q4)

q4mode <- c(4, 4, 2, 4, 3)
mode <- mlv(q4mode, method = "mfv") # Most Frequent Value
print(mode)

# 4. Hand calculate the variance for Q4. Remember, you
# already have the mean!
# S2 = ∑(xi - xmean)2 / n-1

q4var <- sum(
  (4 - q4mean)^2,
  (4 - q4mean)^2,
  (2 - q4mean)^2,
  (4 - q4mean)^2,
  (3 - q4mean)^2
) / 4

print(q4var)

# 5. Calculate the standard deviation using the variance. 
# What is the SD of Q4?
# S = sqrt∑(Xi - Xmean)2 / n-1

q4sd <- sqrt(q4var)
round(q4sd, 2)

# 6. Create a histogram for Q4

df %>%
  ggplot(aes(x = q4)) +
  geom_histogram(binwidth = 0.5, 
                fill = "grey", 
                color = "black") +
  
  coord_flip() +
  
  geom_vline(aes(xintercept = q4mean), 
            color = "red", 
            linetype = "dashed", 
            linewidth = 1) +
  
  geom_vline(aes(xintercept = q4mean + q4sd), 
            color = "green", 
            linetype = "solid", 
            linewidth = 2) +
  
  geom_vline(aes(xintercept = q4mean - q4sd), 
            color = "green", 
            linetype = "solid", 
            linewidth = 2,) +
  
  annotate("text", 
          x = q4mean, 
          y = Inf, 
          label = paste("Mean:", round(q4mean, 2)),
          color = "#000000",
          fontface = "bold",
          vjust = 1.5, 
          hjust = 1.1, 
          size = 4) +
  
  annotate("text", 
           x = q4mean + q4sd, 
           y = Inf, 
           label = paste("Mean + SD:", round(q4mean + q4sd, 2)),
           color = "#000000",
           fontface = "bold",
           vjust = -0.5, 
           hjust = 1.1, 
           size = 4) +
  
  annotate("text", 
           x = q4mean - q4sd, 
           y = Inf, 
           label = paste("Mean - SD:", round(q4mean - q4sd, 2)),
           color = "#000000",
           fontface = "bold", 
           vjust = -0.5, 
           hjust = 1.1, 
           size = 4) +
  
  labs(title = "Q4: I feel that I’m a person of worth,\nat least on an equal plane with others.",
        x = "Q4 Score",
        y = "Frequency") +
  
  theme_bw()

# 7. Add the mean and the standard deviation to the plot.

# 8. Create a boxplot for Q1.

q1mean <- mean(df$q1)
q1median <- median(df$q1)
print (q1mean)

df %>%
  ggplot(aes(x = q1)) +
  geom_boxplot(fill = "grey", color = "black") +
  labs(title = "Q1: On the whole, I am satisfied with myself.",
       x = "Q1 Score") +
  theme_bw()

