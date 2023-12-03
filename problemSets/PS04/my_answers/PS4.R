#####################
# load libraries
# set wd
# clear global .envir
#####################

# remove objects
rm(list=ls())
# detach all libraries
detachAllPackages <- function() {
  basic.packages <- c("package:stats", "package:graphics", "package:grDevices", "package:utils", "package:datasets", "package:methods", "package:base")
  package.list <- search()[ifelse(unlist(gregexpr("package:", search()))==1, TRUE, FALSE)]
  package.list <- setdiff(package.list, basic.packages)
  if (length(package.list)>0)  for (package in package.list) detach(package,  character.only=TRUE)
}
detachAllPackages()

# load libraries
pkgTest <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[,  "Package"])]
  if (length(new.pkg)) 
    install.packages(new.pkg,  dependencies = TRUE)
  sapply(pkg,  require,  character.only = TRUE)
}

# here is where you load any necessary packages
# ex: stringr
# lapply(c("stringr"),  pkgTest)

# set wd for current folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# read in data
#inc.sub <- read.csv("https://raw.githubusercontent.com/ASDS-TCD/StatsI_Fall2023/main/datasets/incumbents_subset.csv")


### Question 1

#1.1

install.packages("car", dependencies = TRUE)
library(car)
data("Prestige")
help("Prestige")
Prestige$professional <- ifelse(Prestige$type == "prof", 1, 0)
head(Prestige)
tail(Prestige)
summary(Prestige)
#1.2

model <- lm(prestige ~ income + professional + income:professional, 
            data = Prestige)
summary(model)


### Question 2

#2.1

coeff_signs <- 0.042
se_signs <- 0.016
df <- 128
t_stat <- coeff_signs / se_signs
# similarly, p value may be derived through:
p_value <- 2 * pt(-abs(t_stat), df)
summary(p_value)

#2.2
coeff_signs <- 0.042
se_signs <- 0.013
df <- 128
t_stat <- coeff_signs / se_signs
# similarly, p value may be derived through:
p_value <- 2 * pt(-abs(t_stat), df)
summary(p_value)



