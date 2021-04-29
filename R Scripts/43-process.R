#======================================#
#       India - NSS 43 round         #
#======================================#
rm(list=ls())

library(foreign)
library(dplyr)
library(stringr)

setwd("/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/NSS_43")

#Import data of NCO-1968
#codes <- read.csv("/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/india-nsso/codes-v2.csv")
codes <- read.csv("/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/codes.csv")
#replace rows 1-10 with two digit numbers
codes$NCO.1968 [1] <-'00'
codes$NCO.1968 [2] <-'01'
codes$NCO.1968 [3] <-'02'
codes$NCO.1968 [4] <-'03'
codes$NCO.1968 [5] <-'04'
codes$NCO.1968 [6] <-'05'
codes$NCO.1968 [7] <-'06'
codes$NCO.1968 [8] <-'07'
codes$NCO.1968 [9] <-'08'
codes$NCO.1968 [10] <-'09'
##########################
# Rural Data 
##########################
rural_data <- read.csv("rural-43.csv")

unique(rural_data$nco)

##considering first three digits of occupation code
rural_data$occupationcode<-str_sub(rural_data$nco, 1,2)

#group occupations based on occupation code
mydata_rural <- as.data.frame(table(rural_data$occupationcode))

#merge the two dataframes
rural_data_final <- merge(rural_data, mydata_rural, by.x ="occupationcode",by.y ="Var1")

#calculating employment share in each occupation
rural_data_final$percentshare <- (rural_data_final$Freq/nrow(rural_data)*100)

#dataframe with average employment share in rural areas in 1983
rural_df <- rural_data_final[,c(1,62)]
rural_df2 <- distinct(rural_df)
#df2$percentshare <- format(df2$percentshare, scientific = FALSE)
rural_df2$percentshare <- round(rural_df2$percentshare, digits = 3)

#merge dataframe with nco 1968 
rural_df2 <- merge(rural_df2, codes, by.x ="occupationcode",by.y ="NCO.1968")

#save table
write.csv(rural_df2, file = "Empltsharerural.csv")

#calculating mean wage for each occupation
#convert string to numeric
rural_data_final$wagecashnumeric <- as.numeric(rural_data_final$wagescash) 
summary(rural_data_final$wagecashnumeric)
mydata_rural$meanwage<- NA

for(i in 1:nrow(mydata_rural)){
  p<- mydata_rural$Var1[i]
  mydata_rural$meanwage[i]<-sum(rural_data_final$wagecashnumeric[rural_data_final$occupationcode==p],na.rm=TRUE)/sum(rural_data_final$pooledweight[rural_data_final$occupationcode==p],na.rm=TRUE)
}

#merge meanwage with occupation codes
mydata2_rural <- merge(mydata_rural, codes, by.x = "Var1", by.y = "NCO.1968")

#sort datasets by mean wage
mydata2_rural <- mydata2_rural[order(mydata2_rural$meanwage),]

mydata2_rural$percentshare <- (mydata2_rural$Freq/nrow(rural_data)*100)
mydata2_rural$percentshare <- round(mydata2_rural$percentshare, digits = 3)

#save mydata2
write.csv(mydata2_rural, file = "Percent_Share_and_Rankbywage_rural.csv")


saveRDS(mydata2_rural, file = "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/rural43.rds")

#save mydata2
write.csv(mydata2_rural, file = "Rankbywage_rural.csv")

#######################
#Urban Data
#########################
urban_data <- read.csv("urban-43.csv")

unique(urban_data$nco)

##considering first three digits of occupation code
urban_data$occupationcode<-str_sub(urban_data$nco, 1,2)

#group occupations based on occupation code
mydata_urban <- as.data.frame(table(urban_data$occupationcode))

#merge the two dataframes
urban_data_final <- merge(urban_data, mydata_urban, by.x ="occupationcode",by.y ="Var1")

#calculating employment share in each occupation
urban_data_final$percentshare <- (urban_data_final$Freq/nrow(urban_data)*100)

#dataframe with average employment share in urban areas in 1983
urban_df <- urban_data_final[,c(1,62)]
urban_df2 <- distinct(urban_df)
#df2$percentshare <- format(df2$percentshare, scientific = FALSE)
urban_df2$percentshare <- round(urban_df2$percentshare, digits = 3)

#merge dataframe with nco 1968 
urban_df2 <- merge(urban_df2, codes, by.x ="occupationcode",by.y ="NCO.1968")

#save table
write.csv(urban_df2, file = "Empltshareurban.csv")

#calculating mean wage for each occupation
#convert string to numeric
urban_data_final$wagecashnumeric <- as.numeric(urban_data_final$wagescash) 
summary(urban_data_final$wagecashnumeric)
mydata_urban$meanwage<- NA

for(i in 1:nrow(mydata_urban)){
  p<- mydata_urban$Var1[i]
  mydata_urban$meanwage[i]<-sum(urban_data_final$wagecashnumeric[urban_data_final$occupationcode==p],na.rm=TRUE)/sum(urban_data_final$pooledweight[urban_data_final$occupationcode==p],na.rm=TRUE)
}

#merge meanwage with occupation codes
mydata2_urban <- merge(mydata_urban, codes, by.x = "Var1", by.y = "NCO.1968")

#sort datasets by mean wage
mydata2_urban <- mydata2_urban[order(mydata2_urban$meanwage),]

mydata2_urban$percentshare <- (mydata2_urban$Freq/nrow(urban_data)*100)
mydata2_urban$percentshare <- round(mydata2_urban$percentshare, digits = 3)

#save mydata2
write.csv(mydata2_urban, file = "Percent_Share_and_Rankbywage_urban.csv")


saveRDS(mydata2_urban, file = "/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso/urban43.rds")

#save mydata2
write.csv(mydata2_urban, file = "Rankbywage_urban.csv")
