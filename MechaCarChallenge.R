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
