## packages
if(!require(pacman)); install.packages("pacman")
library(pacman)
p_load(tidyverse)

##data import
large_sample <- read_excel("large_sample.xlsx")
names(large_sample)<-c("RealEstateName","January","February","March","April","May","June",
                       "July","August","September","October","November","December","SchoolHouse")
large_sample<-within(large_sample,{
  SchoolHouse<-as.factor(SchoolHouse)
})
## trial

test<-head(large_sample)

test<-lm(April~SchoolHouse,data = large_sample)
summary(test)
