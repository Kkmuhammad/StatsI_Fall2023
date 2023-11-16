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
inc.sub <- read.csv("https://raw.githubusercontent.com/ASDS-TCD/StatsI_Fall2023/main/datasets/incumbents_subset.csv")


### Question 1

#1.1

model1 <- lm(voteshare~difflog, data= inc.sub)
summary(model1)

#1.2
pdf("plot1.pdf", width=8)
plot(inc.sub$difflog,inc.sub$voteshare)
abline(model1)
dev.off()

#1.3
res1 <- residuals(model1)
res1 <- model1$residuals

### Question 2

#2.1

model2 <- lm(presvote~difflog, data= inc.sub)
summary(model2)

#2.2
pdf("plot2.pdf", width=8)
plot(inc.sub$difflog,inc.sub$presvote)
abline(model2)
dev.off()



#2.3
res2 <- residuals(model2)

