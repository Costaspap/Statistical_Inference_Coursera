data(ToothGrowth)
require(ggplot2)
require(gridExtra)

data=ToothGrowth

data$dose=as.factor(data$dose)

suppbydose = interaction(data$supp,data$dose)

p1 = ggplot(data,aes(y=len, x=supp, fill=supp))+geom_boxplot()+ guides(fill=guide_legend(title="Supplement"))
p1 = p1 + labs(x = "Supplement",y = "Length")

p2 = ggplot(data,aes(y=len, x=dose, fill=dose))+geom_boxplot()+ guides(fill=guide_legend(title="Dose"))
p2 = p2 + labs(x = "Dose",y = "Length")

p3 = ggplot(data,aes(y=len, x=suppbydose, fill=suppbydose))+geom_boxplot()+ guides(fill=guide_legend(title="Supplement by Dose"))
p3 = p3 + labs(x = "Supplement by Dose",y = "Length")

grid.arrange(p1, p2, p3, ncol = 2)



