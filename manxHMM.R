#############################################################################
# Manx Shearwater Tracking Study 
# - note that some birds were tracked in 2 seasons 
#############################################################################
# packages 
library(sp)
library(rgdal)
library(adehabitatLT)
library(momentuHMM)
library(dplyr)
library(data.table)
#############################################################################
# load data
#############################################################################
rm(list=ls())
# setwd("C:\\Users\\adamdkane\\Desktop\\Science\\Manx Shearwater")
setwd("C:/Users/akane/Desktop/Science/Manuscripts/Manx Shearwater tracking study")
mydata<-read.csv("manxHI.csv",header = T,sep=",")
head(mydata)
#############################################################################
# drop unused columns 
#############################################################################
drops <- c("Altitude","Speed","Course","Type","Distance","Essential","ID","Year","count")
mydata<-mydata[ , !(names(mydata) %in% drops)]
head(mydata)
#############################################################################
# combine date and time into one column and covert time to class POSIXct
#############################################################################
mydata$dateTime<-as.POSIXct(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
#mydata$Time<-as.POSIXct(mydata$Time, format="%H:%M:%S")
head(mydata)
#############################################################################
# remove rows with no values for latitude or longitude 
#############################################################################
mydata<-mydata[complete.cases(mydata$Latitude),]
mydata<-mydata[complete.cases(mydata$Longitude),]
head(mydata)
#coordinates(mydata) = ~Longitude+Latitude
# plot(mydata$Longitude, mydata$Latitude)
#############################################################################
# count the number of relocations per bird 
#############################################################################
sapply(split(mydata$Latitude,mydata$Bird_ID),length)
length(levels(mydata$Bird_ID))
#############################################################################
# drop the birds that have fewer than 20 relocations 
#############################################################################
mydata <- mydata[!(as.numeric(mydata$Bird_ID) %in% which(table(mydata$Bird_ID)<20)),]
mydata <- droplevels(mydata)
length(levels(mydata$Bird_ID))
head(mydata)
#############################################################################
# measure the time difference between points for each bird ID using dplyr 
# - Group your data by ID
# - Compute time diffs between each timestamp in your group (the 1st time diff is NA)
# - Create a new ID that counts no of prior time gaps that are large (e.g. > 20 mins)
#############################################################################
mydata<- mydata %>%
  group_by(Bird_ID) %>%
  mutate(timeDiff = c(NA, difftime(tail(dateTime, -1), head(dateTime, -1), units="min"))) %>%
  mutate(newID = paste0(Bird_ID, cumsum(!is.na(timeDiff) & timeDiff > 20))) %>%
  ungroup()

mydata<-data.frame(mydata)
mydata$newID<-as.factor(mydata$newID)

head(mydata)
length(levels(factor(mydata$newID)))

#############################################################################
# drop the new bird IDs that have fewer than 20 relocations 
#############################################################################
sapply(split(mydata$Latitude,mydata$newID),length)
length(levels(mydata$newID))
mydata <- mydata[!(as.numeric(mydata$newID) %in% which(table(mydata$newID)<20)),]
mydata <- droplevels(mydata)
length(levels(mydata$newID))
head(mydata)
#############################################################################
# create a trajectory object using adehabitatLT
#############################################################################
tr<-as.ltraj(data.frame(X=mydata$Longitude,Y=mydata$Latitude),date=mydata$dateTime,id=mydata$newID,typeII=T) #create trajectory
tstep<-300 #time step we want for the interpolation, in seconds, 300 secs = 5 mins 
newtr<-redisltraj(tr, u=tstep, type = "time")

#############################################################################
# Prep for HMM
#############################################################################
mydata<-ld(newtr)
names(mydata)[names(mydata) == 'x'] <- 'lon'
names(mydata)[names(mydata) == 'y'] <- 'lat'
head(mydata)
tail(mydata)
#############################################################################
# project to UTM coordinates using package rgdal
#############################################################################
llcoord <- SpatialPoints(mydata[,1:2],
                         proj4string=CRS("+proj=longlat +datum=WGS84"))
utmcoord <- spTransform(llcoord,CRS("+proj=utm + ellps=WGS84")) # 29 = IRE or 30 = UK
# add UTM locations to data frame
mydata$x <- attr(utmcoord,"coords")[,1]
mydata$y <- attr(utmcoord,"coords")[,2]

mydata<-mydata[,c("id","x","y")]
names(mydata)[names(mydata) == 'id'] <- 'ID'
head(mydata)

plot(mydata$x , mydata$y)
mydata <- momentuHMM::prepData(mydata)
#############################################################################
# fit HMM
# - 2 state model 
#############################################################################
stateNames <- c("transiting", "foraging")
# distributions for observation processes
dist = list(step = "gamma", angle = "vm")
# initial parameters
Par0_m1 <- list(step=c(2000,1000,100,500,0.1,0.1),angle=c(10,1))
# fit model
m1 <- momentuHMM::fitHMM(data = mydata, nbStates = 2, dist = dist, Par0 = Par0_m1,
                         estAngleMean = list(angle=FALSE), stateNames = stateNames, retryFits = 1)
m1

#############################################################################
# fit HMM
# - 3 state model 
#############################################################################
stateNames <- c("transiting", "foraging", "resting")
# distributions for observation processes
dist = list(step = "gamma", angle = "vm")
# initial parameters
Par0_m2 <- list(step=c(2000,1000,100,100,500,50,0.1,0.1,0.1),angle=c(40,20,1))
# fit model
m2 <- momentuHMM::fitHMM(data = mydata, nbStates = 3, dist = dist, Par0 = Par0_m2,
                         estAngleMean = list(angle=FALSE), stateNames = stateNames, retryFits = 1)
m2
