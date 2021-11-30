#DELIVERABLE 1
#import dplyr package
library(dplyr)

#import and read mpg csv
mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

#Perform linear regression with all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table)

#Use summary function to determine p-value and r-squared value for linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table))


#DELIVERABLE 2
#import and read mpg csv
coil_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

#create total summary dataframe
total_summary <- coil_table %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#create lot summary dataframe
lot_summary <- coil_table %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#box plot to demonstrate variance
plt <- ggplot(coil_table,aes(x=Manufacturing_Lot,y=PSI))
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))


#DELIVERABLE 3
#use a t.test to determine if PSI across all lots is statistically different from population mean 1500 PSI
t.test(coil_table$PSI,mu=1500)

#use t.tests to determine if PSI across individual lots is statistically different from mean 1500 PSI
lot1 <- subset(coil_table, Manufacturing_Lot=="Lot1")
lot2 <- subset(coil_table, Manufacturing_Lot=="Lot2")
lot3 <- subset(coil_table, Manufacturing_Lot=="Lot3")
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)

