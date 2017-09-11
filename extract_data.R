# select variable
pld <- read.csv('D:/youda2/project2/R_project/prosperLoanData.csv',sep = ',',na.strings="")
pld_v <- pld[,c(3,5,9,15)]


# select_observation
pld_v$ListingCreationDate <- as.Date(pld_v$ListingCreationDate)
v_project_data <- pld_v[which(pld_v$ListingCreationDate >= '2012-01-01'),]


# view_data
str(v_project_data)
summary(v_project_data)


# clean
v_project_data$BorrowerRate <- v_project_data$BorrowerRate*100

v_project_data$Term <- as.factor(v_project_data$Term)

v_project_data$Date <- cut(v_project_data$ListingCreationDate,breaks = 7)

v_project_data <- v_project_data[,-1]


# sample

data_sample <- v_project_data[sample(nrow(v_project_data), 15000),]

colnames(data_sample)[2]<-c("Avg_Rate")
colnames(data_sample)[3]<-c("Credit_Rating")


write.csv(data_sample, file = "D:/youda2/project4/prosperLoanData_sample.csv",
          row.names = FALSE)
