#=======================================================#
#    India - NSS Plotter Take Files from other Folders  #
#=======================================================#

rm(list=ls())
setwd("/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots")

#install.packages("stringr")

library(dplyr)
library(stringr)
#library(ggpubr)
#library(ggplot2)
codes <- read.csv("/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/codes.csv")

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

# Import data of NSS 38th round 1983
DF_rural_38th <- readRDS("rural38.rds")
DF_urban_38th <- readRDS("urban38.rds")
cpi38<- 8.94578117602486

# Import data of NSS 43rd round 1987- 1988
DF_rural_43rd <- readRDS("rural43.rds")
DF_urban_43rd <- readRDS("urban43.rds")
cpi43<-12.1000985216576

# Import data of NSS 50th round 1993 - 1994
DF_rural_50th <- readRDS("rural50.rds")
DF_urban_50th <- readRDS("urban50.rds")
cpi50<-20.9018861197737


# Import data of NSS 55th round 1999-2000
DF_rural_55th <- readRDS("rural55.rds")
DF_urban_55th <- readRDS("urban55.rds")
cpi55<-35.1566269677431


# Import data of NSS 61st round 2004-05
#DF_rural_61st <- readRDS("rural61.rds")
#DF_urban_61st <- readRDS("urban61.rds")

# Import data of NSS 61st round 2005-06
DF_rural_61st <- readRDS("rural61.rds")
DF_urban_61st <- readRDS("urban61.rds")
cpi61<-44.4432831479056

DF_rural_38th$meanwage <-DF_rural_38th$meanwage/cpi38
DF_rural_43rd$meanwage <-DF_rural_43rd$meanwage/cpi43
DF_rural_50th$meanwage <-DF_rural_50th$meanwage/cpi50
DF_rural_55th$meanwage <-DF_rural_55th$meanwage/cpi55
DF_rural_61st$meanwage <-DF_rural_61st$meanwage/cpi61

DF_urban_38th$meanwage <-DF_urban_38th$meanwage/cpi38
DF_urban_43rd$meanwage <-DF_urban_43rd$meanwage/cpi43
DF_urban_50th$meanwage <-DF_urban_50th$meanwage/cpi50
DF_urban_55th$meanwage <-DF_urban_55th$meanwage/cpi55
DF_urban_61st$meanwage <-DF_urban_61st$meanwage/cpi61


#merge the two dataframes of 38th and 43rd rounds
rural_merge_1 <- merge(DF_rural_38th, DF_rural_43rd, by.x ="Var1",by.y ="Var1")
urban_merge_1 <- merge(DF_urban_38th, DF_urban_43rd, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 50th and 43rd rounds
rural_merge_2 <- merge(DF_rural_43rd, DF_rural_50th, by.x ="Var1",by.y ="Var1")
urban_merge_2 <- merge(DF_urban_43rd, DF_urban_50th, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 55th and 50th rounds
rural_merge_3 <- merge(DF_rural_50th, DF_rural_55th, by.x ="Var1",by.y ="Var1")
urban_merge_3 <- merge(DF_urban_50th, DF_urban_55th, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 55th and 61st rounds
rural_merge_4 <- merge(DF_rural_55th, DF_rural_61st, by.x ="Var1",by.y ="Var1")
urban_merge_4 <- merge(DF_urban_55th, DF_urban_61st, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 38th and 50th rounds
rural_merge_5 <- merge(DF_rural_38th, DF_rural_50th, by.x ="Var1",by.y ="Var1")
urban_merge_5 <- merge(DF_urban_38th, DF_urban_50th, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 50th and 61st rounds
rural_merge_6 <- merge(DF_rural_50th, DF_rural_61st, by.x ="Var1",by.y ="Var1")
urban_merge_6 <- merge(DF_urban_50th, DF_urban_61st, by.x ="Var1",by.y ="Var1")

#merge the two dataframes of 38th and 61st rounds
rural_merge_7 <- merge(DF_rural_38th, DF_rural_61st, by.x ="Var1",by.y ="Var1")
urban_merge_7 <- merge(DF_urban_38th, DF_urban_61st, by.x ="Var1",by.y ="Var1")



urban_merge_1 <- merge(urban_merge_1, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_1 <- merge(rural_merge_1, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_2 <- merge(urban_merge_2, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_2 <- merge(rural_merge_2, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_3 <- merge(urban_merge_3, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_3 <- merge(rural_merge_3, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_4 <- merge(urban_merge_4, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_4 <- merge(rural_merge_4, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_5 <- merge(urban_merge_5, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_5 <- merge(rural_merge_5, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_6 <- merge(urban_merge_6, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_6 <- merge(rural_merge_6, codes, by.x ="Var1",by.y ="NCO.1968")

urban_merge_7 <- merge(urban_merge_7, codes, by.x ="Var1",by.y ="NCO.1968")
rural_merge_7 <- merge(rural_merge_7, codes, by.x ="Var1",by.y ="NCO.1968")



#percentage change in employment
rural_merge_1$percentchange <- ((rural_merge_1$Freq.y - rural_merge_1$Freq.x)
                                /rural_merge_1$Freq.x)*100
urban_merge_1$percentchange <- ((urban_merge_1$Freq.y - urban_merge_1$Freq.x)
                                /urban_merge_1$Freq.x)*100

#percentage change in employment
rural_merge_2$percentchange <- ((rural_merge_2$Freq.y - rural_merge_2$Freq.x)
                                /rural_merge_2$Freq.x)*100
urban_merge_2$percentchange <- ((urban_merge_2$Freq.y - urban_merge_2$Freq.x)
                                /urban_merge_2$Freq.x)*100


#percentage change in employment
rural_merge_3$percentchange <- ((rural_merge_3$Freq.y - rural_merge_3$Freq.x)
                                /rural_merge_3$Freq.x)*100
urban_merge_3$percentchange <- ((urban_merge_3$Freq.y - urban_merge_3$Freq.x)
                                /urban_merge_3$Freq.x)*100

#percentage change in employment
rural_merge_4$percentchange <- ((rural_merge_4$Freq.y - rural_merge_4$Freq.x)
                                /rural_merge_4$Freq.x)*100
urban_merge_4$percentchange <- ((urban_merge_4$Freq.y - urban_merge_4$Freq.x)
                                /urban_merge_4$Freq.x)*100

#percentage change in employment
rural_merge_5$percentchange <- ((rural_merge_5$Freq.y - rural_merge_5$Freq.x)
                                /rural_merge_5$Freq.x)*100
urban_merge_5$percentchange <- ((urban_merge_5$Freq.y - urban_merge_5$Freq.x)
                                /urban_merge_5$Freq.x)*100

#percentage change in employment
rural_merge_6$percentchange <- ((rural_merge_6$Freq.y - rural_merge_6$Freq.x)
                                /rural_merge_6$Freq.x)*100
urban_merge_6$percentchange <- ((urban_merge_6$Freq.y - urban_merge_6$Freq.x)
                                /urban_merge_6$Freq.x)*100

#percentage change in employment
rural_merge_7$percentchange <- ((rural_merge_7$Freq.y - rural_merge_7$Freq.x)
                                /rural_merge_7$Freq.x)*100

urban_merge_7$percentchange <- ((urban_merge_7$Freq.y - urban_merge_7$Freq.x)
                                /urban_merge_7$Freq.x)*100




#Change in Mean Wages - Percentage
rural_merge_1$meanwagechange <- ((rural_merge_1$meanwage.y - rural_merge_1$meanwage.x))/rural_merge_1$meanwage.x *100
urban_merge_1$meanwagechange <- ((urban_merge_1$meanwage.y - urban_merge_1$meanwage.x))/urban_merge_1$meanwage.x*100

#Change in Mean Wages
rural_merge_2$meanwagechange <- ((rural_merge_2$meanwage.y - rural_merge_2$meanwage.x))/rural_merge_2$meanwage.x*100
urban_merge_2$meanwagechange <- ((urban_merge_2$meanwage.y - urban_merge_2$meanwage.x))/urban_merge_2$meanwage.x*100

#Change in Mean Wages
rural_merge_3$meanwagechange <- ((rural_merge_3$meanwage.y - rural_merge_3$meanwage.x))/rural_merge_3$meanwage.x*100
urban_merge_3$meanwagechange <- ((urban_merge_3$meanwage.y - urban_merge_3$meanwage.x))/urban_merge_3$meanwage.x*100


#Change in Mean Wages
rural_merge_4$meanwagechange <- ((rural_merge_4$meanwage.y - rural_merge_4$meanwage.x))/rural_merge_4$meanwage.x*100
urban_merge_4$meanwagechange <- ((urban_merge_4$meanwage.y - urban_merge_4$meanwage.x))/urban_merge_4$meanwage.x*100


#Change in Mean Wages
rural_merge_5$meanwagechange <- ((rural_merge_5$meanwage.y - rural_merge_5$meanwage.x))/rural_merge_5$meanwage.x*100
urban_merge_5$meanwagechange <- ((urban_merge_5$meanwage.y - urban_merge_5$meanwage.x))/urban_merge_5$meanwage.x*100

#Change in Mean Wages
rural_merge_6$meanwagechange <- ((rural_merge_6$meanwage.y - rural_merge_6$meanwage.x))/rural_merge_6$meanwage.x*100
urban_merge_6$meanwagechange <- ((urban_merge_6$meanwage.y - urban_merge_6$meanwage.x))/urban_merge_6$meanwage.x*100


#Change in Mean Wages
rural_merge_7$meanwagechange <- ((rural_merge_7$meanwage.y - rural_merge_7$meanwage.x))/rural_merge_7$meanwage.x*100
urban_merge_7$meanwagechange <- ((urban_merge_7$meanwage.y - urban_merge_7$meanwage.x))/urban_merge_7$meanwage.x*100


rural_rank <- read.csv(file="Rankbywage_rural.csv")
rural_rank$meanwage<-rural_rank$meanwage/cpi38

#rural_rank<-rural_rank[!(rural_rank$meanwage<=1),]
rural_rank$rank <- 1:nrow(rural_rank)
perc.rank <- function(x) trunc(rank(x))/length(x)
rural_rank <- within(rural_rank, percentile <- perc.rank(rank))


rural_merge_plot_1 <- merge(rural_rank, rural_merge_1, by.x ="Var1",by.y ="Var1")
rural_merge_plot_1 <- rural_merge_plot_1[order(rural_merge_plot_1$rank),]

rural_merge_plot_2 <- merge(rural_rank, rural_merge_2, by.x ="Var1",by.y ="Var1")
rural_merge_plot_2 <- rural_merge_plot_2[order(rural_merge_plot_2$rank),]

rural_merge_plot_3 <- merge(rural_rank, rural_merge_3, by.x ="Var1",by.y ="Var1")
rural_merge_plot_3 <- rural_merge_plot_3[order(rural_merge_plot_3$rank),]

rural_merge_plot_4 <- merge(rural_rank, rural_merge_4, by.x ="Var1",by.y ="Var1")
rural_merge_plot_4 <- rural_merge_plot_4[order(rural_merge_plot_4$rank),]

rural_merge_plot_5 <- merge(rural_rank, rural_merge_5, by.x ="Var1",by.y ="Var1")
rural_merge_plot_5 <- rural_merge_plot_5[order(rural_merge_plot_5$rank),]

rural_merge_plot_6 <- merge(rural_rank, rural_merge_6, by.x ="Var1",by.y ="Var1")
rural_merge_plot_6 <- rural_merge_plot_6[order(rural_merge_plot_6$rank),]

rural_merge_plot_7 <- merge(rural_rank, rural_merge_7, by.x ="Var1",by.y ="Var1")
rural_merge_plot_7 <- rural_merge_plot_7[order(rural_merge_plot_7$rank),]


urban_rank <- read.csv(file="Rankbywage_urban.csv")
urban_rank$meanwage<-urban_rank$meanwage/cpi38

#urban_rank<-urban_rank[!(urban_rank$meanwage<=1),]
urban_rank$rank <- 1:nrow(urban_rank)
perc.rank <- function(x) trunc(rank(x))/length(x)
urban_rank <- within(urban_rank, percentile <- perc.rank(rank))



urban_merge_plot_1 <- merge(urban_rank, urban_merge_1, by.x ="Var1",by.y ="Var1")
urban_merge_plot_1 <- urban_merge_plot_1[order(urban_merge_plot_1$rank),]

urban_merge_plot_2 <- merge(urban_rank, urban_merge_2, by.x ="Var1",by.y ="Var1")
urban_merge_plot_2 <- urban_merge_plot_2[order(urban_merge_plot_2$rank),]

urban_merge_plot_3 <- merge(urban_rank, urban_merge_3, by.x ="Var1",by.y ="Var1")
urban_merge_plot_3 <- urban_merge_plot_3[order(urban_merge_plot_3$rank),]

urban_merge_plot_4 <- merge(urban_rank, urban_merge_4, by.x ="Var1",by.y ="Var1")
urban_merge_plot_4 <- urban_merge_plot_4[order(urban_merge_plot_4$rank),]

urban_merge_plot_5 <- merge(urban_rank, urban_merge_5, by.x ="Var1",by.y ="Var1")
urban_merge_plot_5 <- urban_merge_plot_5[order(urban_merge_plot_5$rank),]

urban_merge_plot_6 <- merge(urban_rank, urban_merge_6, by.x ="Var1",by.y ="Var1")
urban_merge_plot_6 <- urban_merge_plot_6[order(urban_merge_plot_6$rank),]


urban_merge_plot_7 <- merge(urban_rank, urban_merge_7, by.x ="Var1",by.y ="Var1")
urban_merge_plot_7 <- urban_merge_plot_7[order(urban_merge_plot_7$rank),]


#save final datasets
write.csv(urban_merge_plot_1, file = "urban_change_table_for_1983-1988.csv")
write.csv(rural_merge_plot_1, file = "rural_change_table_for_1983-1988.csv")

write.csv(urban_merge_plot_2, file = "urban_change_table_for_1988-1993.csv")
write.csv(rural_merge_plot_2, file = "rural_change_table_for_1988-1993.csv")

write.csv(urban_merge_plot_3, file = "urban_change_table_for_1993-1999.csv")
write.csv(rural_merge_plot_3, file = "rural_change_table_for_1993-1999.csv")

write.csv(urban_merge_plot_4, file = "urban_change_table_for_1999-2004.csv")
write.csv(rural_merge_plot_4, file = "rural_change_table_for_1999-2004.csv")

write.csv(urban_merge_plot_5, file = "urban_change_table_for_1983-1993.csv")
write.csv(rural_merge_plot_5, file = "rural_change_table_for_1983-1993.csv")

write.csv(urban_merge_plot_6, file = "urban_change_table_for_1993-2004.csv")
write.csv(rural_merge_plot_6, file = "rural_change_table_for_1993-2004.csv")

write.csv(urban_merge_plot_7, file = "urban_change_table_for_1983-2004.csv")
write.csv(rural_merge_plot_7, file = "rural_change_table_for_1983-2004.csv")

# urban_merge_plot_1<-urban_merge_plot_1[!(urban_merge_plot_1$percentchange>=10),]
# urban_merge_plot_2<-urban_merge_plot_2[!(urban_merge_plot_2$percentchange>=10),]
# urban_merge_plot_3<-urban_merge_plot_3[!(urban_merge_plot_3$percentchange>=10),]
# urban_merge_plot_4<-urban_merge_plot_4[!(urban_merge_plot_4$percentchange>=10),]
# urban_merge_plot_5<-urban_merge_plot_5[!(urban_merge_plot_5$percentchange>=10),]
# urban_merge_plot_6<-urban_merge_plot_6[!(urban_merge_plot_6$percentchange>=10),]
# urban_merge_plot_7<-urban_merge_plot_7[!(urban_merge_plot_7$percentchange>=10),]
# 
# 
# rural_merge_plot_1<-rural_merge_plot_1[!(rural_merge_plot_1$percentchange>=10),]
# rural_merge_plot_2<-rural_merge_plot_2[!(rural_merge_plot_2$percentchange>=10),]
# rural_merge_plot_3<-rural_merge_plot_3[!(rural_merge_plot_3$percentchange>=10),]
# rural_merge_plot_4<-rural_merge_plot_4[!(rural_merge_plot_4$percentchange>=10),]
# rural_merge_plot_5<-rural_merge_plot_5[!(rural_merge_plot_5$percentchange>=10),]
# rural_merge_plot_6<-rural_merge_plot_6[!(rural_merge_plot_6$percentchange>=10),]
# rural_merge_plot_6<-rural_merge_plot_6[!(rural_merge_plot_6$percentchange>=10),]
# rural_merge_plot_7<-rural_merge_plot_7[!(rural_merge_plot_7$percentchange>=10),]
# 
# 
# urban_merge_plot_1<-urban_merge_plot_1[!(urban_merge_plot_1$meanwagechange>=10),]
# urban_merge_plot_2<-urban_merge_plot_2[!(urban_merge_plot_2$meanwagechange>=10),]
# urban_merge_plot_3<-urban_merge_plot_3[!(urban_merge_plot_3$meanwagechange>=10),]
# urban_merge_plot_4<-urban_merge_plot_4[!(urban_merge_plot_4$meanwagechange>=10),]
# urban_merge_plot_5<-urban_merge_plot_5[!(urban_merge_plot_5$meanwagechange>=10),]
# urban_merge_plot_6<-urban_merge_plot_6[!(urban_merge_plot_6$meanwagechange>=10),]
# urban_merge_plot_7<-urban_merge_plot_7[!(urban_merge_plot_7$meanwagechange>=10),]
# 
# 
# rural_merge_plot_1<-rural_merge_plot_1[!(rural_merge_plot_1$meanwagechange>=10),]
rural_merge_plot_2<-rural_merge_plot_2[!(rural_merge_plot_2$meanwagechange>=1000),]
# rural_merge_plot_3<-rural_merge_plot_3[!(rural_merge_plot_3$meanwagechange>=10),]
# rural_merge_plot_4<-rural_merge_plot_4[!(rural_merge_plot_4$meanwagechange>=10),]
# rural_merge_plot_5<-rural_merge_plot_5[!(rural_merge_plot_5$meanwagechange>=10),]
# rural_merge_plot_6<-rural_merge_plot_6[!(rural_merge_plot_6$meanwagechange>=10),]
# rural_merge_plot_6<-rural_merge_plot_6[!(rural_merge_plot_6$meanwagechange>=10),]
# rural_merge_plot_7<-rural_merge_plot_7[!(rural_merge_plot_7$meanwagechange>=10),]



#######################
###PLOTTING############
#######################


####################            #########################
#################### RURAL PLOTS 
####################            ##########################

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/both-perc-merge-7.png",
    width=800, height=600)

plot( loess.smooth(rural_merge_plot_7$percentile, rural_merge_plot_7$percentchange, span = 0.20),
      main="Overall Percentage Difference Across Occupations - RURAL & URBAN ",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.5)) ,
      col="blue" )

legend("topleft", legend=c("RURAL Year 1983-Year 2004", "URBAN Year 1983-Year 2004"),
       col=c("blue","red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_7$percentile, urban_merge_plot_7$percentchange, span = 0.20), col="red", type='o')

dev.off()

#####################3
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/both-mean-wage-change-7.png",
    width=800, height=600)

plot( loess.smooth(rural_merge_plot_7$percentile, rural_merge_plot_7$meanwagechange, span = 0.20),
      main="Overall Mean Wage Difference Across Occupations - RURAL & URBAN ",
      type="o",
      ylab="Mean Wage Change (%)",
      xlab="Percentile",
      ylim=(100*c(-0,25)) ,
      col="blue" )

legend("topleft", legend=c("RURAL Year 1983-Year 2004", "URBAN Year 1983-Year 2004"),
       col=c("blue","red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_7$percentile, urban_merge_plot_7$meanwagechange, span = 0.20), col="red", type='o')

dev.off()

#####################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-1-2.png",
    width=800, height=600)

plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL ",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-0.4,1)) ,
      col="blue" )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$percentchange, span = 0.20), col="red", type='o')

dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-1.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-0.4,1)) ,      col="blue")
legend("topleft", legend=c("Year 1983-Year 1988"),
       col=c("blue"), lty = 1:2, cex=0.8)

#lines( loess.smooth(rural_merge_plot_6$percentile, rural_merge_plot_6$percentchange, span = 0.20), col="red")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-2-3.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.4)) ,      col="blue")

legend("topleft", legend=c("Year 1988-Year 1993", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$percentchange, span = 0.20), col="red", type="o")
dev.off()
###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-1-3.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")
lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$percentchange, span = 0.20), col="red", type="o")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

dev.off()
###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-3-4.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")

legend("topleft", legend=c("Year 1993-Year 1999", "Year 1999-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_5$percentile, rural_merge_plot_5$percentchange, span = 0.20), col="red",type="o")
dev.off()
###################

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-perc-merge-5-6.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_5$percentile, rural_merge_plot_5$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1993", "Year 1993-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_6$percentile, rural_merge_plot_6$percentchange, span = 0.20), col="red",type="o")
dev.off()
###################

###PLOTTING

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-1-2.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      xlab="Percentile",
      ylim=(100*c(-0.6,7)),
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$meanwagechange, span = 0.2), col="red",type="o")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-1.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(-1,0)),
      xlab="Percentile",
      
      col="blue")
legend("topleft", legend=c("Year 1983-Year 1988"),
       col=c("blue"), lty = 1:2, cex=0.8)

#lines( loess.smooth(rural_merge_plot_6$percentile, rural_merge_plot_6$meanwagechange, span = 0.20) col="red")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-2-3.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(-1,17)),
      xlab="Percentile",
      
      col="blue")

legend("topleft", legend=c("Year 1988-Year 1993", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-1-3.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(-1,17)),
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$meanwagechange, span = 0.20),type="o", col="red")
dev.off()

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-3-4.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,18)),
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1993-Year 1999", "Year 1999-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_5$percentile, rural_merge_plot_5$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/rural-mean-wage-diff-5-6.png",
    width=800, height=600)
plot( loess.smooth(rural_merge_plot_5$percentile, rural_merge_plot_5$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - RURAL",
      type="o",
      ylim=(100*c(0,13)) ,
      ylab="Mean Wage Change (%)",
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1993", "Year 1993-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_6$percentile, rural_merge_plot_6$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################


####################            #########################
#################### URBAN PLOTS 
####################            ##########################

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-1-2.png",
    width=800, height=600)

plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN ",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-0.4,1)) ,
      col="blue" )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$percentchange, span = 0.20), col="red", type='o')

dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-1.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-0.4,1)) ,      col="blue")
legend("topleft", legend=c("Year 1983-Year 1988"),
       col=c("blue"), lty = 1:2, cex=0.8)

#lines( loess.smooth(urban_merge_plot_6$percentile, urban_merge_plot_6$percentchange, span = 0.20), col="red")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-2-3.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.4)) ,      col="blue")

legend("topleft", legend=c("Year 1988-Year 1993", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$percentchange, span = 0.20), col="red", type="o")
dev.off()
###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-1-3.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")
lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$percentchange, span = 0.20), col="red", type="o")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

dev.off()
###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-3-4.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")

legend("topleft", legend=c("Year 1993-Year 1999", "Year 1999-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_5$percentile, urban_merge_plot_5$percentchange, span = 0.20), col="red",type="o")
dev.off()
###################

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-perc-merge-5-6.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_5$percentile, urban_merge_plot_5$percentchange, span = 0.20),
      main="Percentage Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Change",
      xlab="Percentile",
      ylim=(100*c(-1,0.8)) ,
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1993", "Year 1993-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_6$percentile, urban_merge_plot_6$percentchange, span = 0.20), col="red",type="o")
dev.off()
###################

###PLOTTING

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-1-2.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,0.5)),
      xlab="Percentile",
      
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$meanwagechange, span = 0.20), col="red",type="o")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-1.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,0.5)),
      xlab="Percentile",
      
      col="blue")
legend("topleft", legend=c("Year 1983-Year 1988"),
       col=c("blue"), lty = 1:2, cex=0.8)

#lines( loess.smooth(urban_merge_plot_6$percentile, urban_merge_plot_6$meanwagechange, span = 0.20) col="red")
dev.off()
#####################3

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-2-3.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,13)),
      xlab="Percentile",
      
      col="blue")

legend("topleft", legend=c("Year 1988-Year 1993", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-1-3.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,13)),
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1993-Year 1999"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$meanwagechange, span = 0.20),type="o", col="red")
dev.off()

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-3-4.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,13)),
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1993-Year 1999", "Year 1999-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_5$percentile, urban_merge_plot_5$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################

###################
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/urban-mean-wage-diff-5-6.png",
    width=800, height=600)
plot( loess.smooth(urban_merge_plot_5$percentile, urban_merge_plot_5$meanwagechange, span = 0.20),
      main="Percentage Change in Mean Wages  Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      ylim=(100*c(0,8)),
      xlab="Percentile",
      col="blue")

legend("topleft", legend=c("Year 1983-Year 1993", "Year 1993-Year 2005"),
       col=c("blue", "red"), lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_6$percentile, urban_merge_plot_6$meanwagechange, span = 0.20),type="o", col="red")
dev.off()
###################

#####################
#####################
####################
#####################3
cols <- brewer.pal(8, "Dark2")
pal <- colorRampPalette(cols)
colo<-pal(4)
png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/all-four-urban-mean-wage-change.png",
    width=800, height=600)

plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$meanwagechange, span = 0.20),
      main="Overall Mean Wage Difference Across Occupations - URBAN",
      type="o",
      ylab="Mean Wage Change (%)",
      xlab="Percentile",
      ylim=(100*c(-0.3,12)) ,
      col=colo[1] )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993", "Year 1993-Year 1999","Year 1999-Year 2005"),
       col=colo, lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$meanwagechange, span = 0.20), col=colo[2], type='o')
lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$meanwagechange, span = 0.20), col=colo[3], type='o')
lines( loess.smooth(urban_merge_plot_4$percentile, urban_merge_plot_4$meanwagechange, span = 0.20), col=colo[4], type='o')

dev.off()

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/all-four-rural-mean-wage-change.png",
    width=800, height=600)

plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$meanwagechange, span = 0.20),
      main="Overall Mean Wage Difference Across Occupations - RURAL",
      type="o",
      ylab="Mean Wage Change (%)",
      xlab="Percentile",
      ylim=(100*c(-0.4,18)) ,
      col=colo[1] )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993", "Year 1993-Year 1999","Year 1999-Year 2005"),
       col=colo, lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$meanwagechange, span = 0.20), col=colo[2], type='o')
lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$meanwagechange, span = 0.20), col=colo[3], type='o')
lines( loess.smooth(rural_merge_plot_4$percentile, rural_merge_plot_4$meanwagechange, span = 0.20), col=colo[4], type='o')

dev.off()


png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/all-four-urban-perc-merge-change.png",
    width=800, height=600)

plot( loess.smooth(urban_merge_plot_1$percentile, urban_merge_plot_1$percentchange, span = 0.20),
      main="Overall Percentage Difference Difference Across Occupations - URBAN",
      type="o",
      ylab="Percentage Difference Change (%)",
      xlab="Percentile",
      ylim=(100*c(-1,01)) ,
      col=colo[1] )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993", "Year 1993-Year 1999","Year 1999-Year 2005"),
       col=colo, lty = 1:2, cex=0.8)

lines( loess.smooth(urban_merge_plot_2$percentile, urban_merge_plot_2$percentchange, span = 0.20), col=colo[2], type='o')
lines( loess.smooth(urban_merge_plot_3$percentile, urban_merge_plot_3$percentchange, span = 0.20), col=colo[3], type='o')
lines( loess.smooth(urban_merge_plot_4$percentile, urban_merge_plot_4$percentchange, span = 0.20), col=colo[4], type='o')

dev.off()

png(file="/media/kushal/001A3CCE1A3CC308/kushal/research/nsso-employment/revised-nsso-apr11/plots_cpiadjusted_apr27/Plots/all-four-rural-perc-merge-change.png",
    width=800, height=600)

plot( loess.smooth(rural_merge_plot_1$percentile, rural_merge_plot_1$percentchange, span = 0.20),
      main="Overall Percentage Difference Difference Across Occupations - RURAL",
      type="o",
      ylab="Percentage Difference Change (%)",
      xlab="Percentile",
      ylim=(100*c(-1,01)) ,
      col=colo[1] )

legend("topleft", legend=c("Year 1983-Year 1988", "Year 1988-Year 1993", "Year 1993-Year 1999","Year 1999-Year 2005"),
       col=colo, lty = 1:2, cex=0.8)

lines( loess.smooth(rural_merge_plot_2$percentile, rural_merge_plot_2$percentchange, span = 0.20), col=colo[2], type='o')
lines( loess.smooth(rural_merge_plot_3$percentile, rural_merge_plot_3$percentchange, span = 0.20), col=colo[3], type='o')
lines( loess.smooth(rural_merge_plot_4$percentile, rural_merge_plot_4$percentchange, span = 0.20), col=colo[4], type='o')

dev.off()


####################################
###################################
#######################################
