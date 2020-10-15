## packages
if(!require(pacman))install.packages("pacman"); library(pacman)
p_load(tidyverse,readxl)

##data import
small_sample <- read_excel("small-sample.xlsx")
names(small_sample)<-c("RealEstateName","19-Oct","19-Nov","19-Dec","20-Jan","20-Feb","20-Mar",
                       "20-Apr","20-May","20-Jun","20-Jul","20-Aug","20-Sep","SchoolHouse")
small_sample<-within(small_sample,{
  SchoolHouse<-as.factor(SchoolHouse)
})

## trial

small_sample_AprilMinusMarch<-small_sample%>%
  mutate(AprilMinusMarch=`20-Apr`-`20-Mar`)#四月减三月，绝对量无关
test<-lm(AprilMinusMarch~SchoolHouse,data = small_sample_AprilMinusMarch)
summary(test)

small_sample_AprilMinusMarch<-small_sample%>%
  mutate(AprilMinusMarch=(`20-Apr`-`20-Mar`)/`20-Mar`)#四月减三月，增速都无关
test<-lm(AprilMinusMarch~SchoolHouse,data = small_sample_AprilMinusMarch)
summary(test)


small_sample_MayMinusMarch<-small_sample%>%
  mutate(MayMinusMarch=`20-May`-`20-Mar`)#五月减三月，绝对量无关
test<-lm(MayMinusMarch~SchoolHouse,data = small_sample_MayMinusMarch)
summary(test)

small_sample_MayMinusMarch<-small_sample%>%
  mutate(MayMinusMarch=(`20-May`-`20-Mar`)/`20-Mar`)#五月减三月，增速相关
test<-lm(MayMinusMarch~SchoolHouse,data = small_sample_MayMinusMarch)
summary(test)


small_sample_MayMinusApril<-small_sample%>%
  mutate(MayMinusApril=`20-May`-`20-Apr`)#五月减四月，绝对量无关
test<-lm(MayMinusApril~SchoolHouse,data = small_sample_MayMinusApril)
summary(test)

small_sample_MayMinusApril<-small_sample%>%
  mutate(MayMinusApril=(`20-May`-`20-Apr`)/`20-Apr`)#五月减四月，增速无关
test<-lm(MayMinusApril~SchoolHouse,data = small_sample_MayMinusApril)
summary(test)
  
