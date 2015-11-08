if (!exists("quizz")){
        if (!require("dplyr")) {
                install.packages("dplyr")
        }
        library(dplyr)
        quizz <- read.table(file= "household_power_consumption.txt", header = TRUE,sep = ";", na.strings = "?")
        quizz[,1] <- as.character(quizz[,1])
        quizz[,1] <- as.Date(quizz[,1],format = "%d/%m/%Y")
        q1 <- filter(quizz,Date=="2007-02-01")
        q2 <- filter(quizz,Date=="2007-02-02")
        quizz <- rbind(q1,q2)}
png("plot1.png",width = 480,height = 480)
hist(quizz$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()