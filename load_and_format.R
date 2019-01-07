library(dplyr)
library(lubridate)

Mid_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.MidPoint.Campbell PakBus Logger.csv", header=FALSE)
South_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.SouthPoint.Campbell PakBus Logger.csv", header=FALSE)
weather_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.NorthPoint.Campbell PakBus Logger other.csv", header=FALSE)
North_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.NorthPoint.Campbell PakBus Logger.csv", header=FALSE)

Mid_2018<-Mid_2018 %>% 
  select(-c(V2, V9))
headers<-c("datetime", "depth", "ODO", "ODO_conc", "salinity", "spcond", "temperature")
colnames(Mid_2018)<-headers
Mid_2018<-Mid_2018[-c(1:3),]
Mid_2018$station<-"Mid"

South_2018<-South_2018 %>% 
  select(-c(V2, V9))
colnames(South_2018)<-headers
South_2018<-South_2018[-c(1:3),]
South_2018$station<-"South"

