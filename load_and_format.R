library(dplyr)
library(lubridate)

Mid_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.MidPoint.Campbell PakBus Logger.csv", header=FALSE, stringsAsFactors=FALSE)
South_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.SouthPoint.Campbell PakBus Logger.csv", header=FALSE, stringsAsFactors=FALSE)
North_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.NorthPoint.Campbell PakBus Logger other.csv", header=FALSE, stringsAsFactors=FALSE)
weather_2018 <- read.csv("P:/Reilly/Rstuff/2018_dom_wq/export-xyle510.Dominion Power.NorthPoint.Campbell PakBus Logger.csv", header=FALSE, stringsAsFactors=FALSE)

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

North_2018<-North_2018 %>% 
  select(-c(V2, V9))
colnames(North_2018)<-headers
North_2018<-North_2018[-c(1:3),]
North_2018$station<-"North"

wq_2018<-North_2018 %>% 
  full_join(., Mid_2018) %>% 
  full_join(., South_2018)

wheaders<-c("datetime", "airtemp", "bp", "hail", "rainfall", "rh", "wind_dir", "wind_spd", "wind_max", "wind_min")
weather_2018<-weather_2018[-c(1:3),]
colnames(weather_2018)<-wheaders
