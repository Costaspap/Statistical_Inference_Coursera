data(ToothGrowth)
library(ggplot2)

data=ToothGrowth

data$dose=as.factor(data$dose)

suppbydose = interaction(data$supp,data$dose)

pl = ggplot(data,aes(y=len, x=suppbydose))+geom_boxplot()