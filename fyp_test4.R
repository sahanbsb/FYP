#for itemId 182
S2010 <- subset(data,Date > as.Date("2012-12-31") & Date < as.Date("2014-01-01"))
#View(S2010)
#convert Data col from String to date
weather$Date <- as.Date(weather$Date,format="%d/%m/%Y")
View(S2010)

W2010 <- subset(weather,Date > as.Date("2012-12-31") & Date < as.Date("2014-01-01"))
View(W2010)

finalW <- data.frame(weather$Date,weather$Temp,weather$Rainfall)


#changeing col names
colnames(finalW)[1] <- "Date"
colnames(finalW)[2] <- "Temp"
colnames(finalW)[3] <- "Rainfall"
View(finalW)

final2010 <- subset(finalW,Date > as.Date("2012-12-31") & Date <= as.Date("2014-01-01"))
View(final2010)


#combine this with the prediction

combined2010 <- data.frame(final2010,forecast)
combined2010 <- data.frame(combined2010,S2010$Quantity)


