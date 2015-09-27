# So in the given dataset we have data about 
# the response in the length of odontoblasts 
# (cells responsible for tooth growth) in 60 guinea pigs.
# Each animal received one of three dose levels of vitamin 
# C (0.5, 1, and 2 mg/day) by one of two delivery methods, 
# (orange juice or ascorbic acid (a form of vitamin C and coded as VC).
# For more information on the dataset visit: 
# https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/ToothGrowth.html


data(ToothGrowth)
require(ggplot2)
require(gridExtra)

data=ToothGrowth

data$dose=as.factor(data$dose)

suppbydose = interaction(data$supp,data$dose)

p1 = ggplot(data,aes(y=len, x=supp, fill=supp))+geom_boxplot()+ guides(fill=guide_legend(title="Supplement"))
p1 = p1 + labs(x = "Supplement",y = "Length")
p1 = p1 + ggtitle("Tooth growth with different supplements")

p2 = ggplot(data,aes(y=len, x=dose, fill=dose))+geom_boxplot()+ guides(fill=guide_legend(title="Dose"))
p2 = p2 + labs(x = "Dose",y = "Length")
p2 = p2 + ggtitle("Tooth growth with different doses")

p3 = ggplot(data,aes(y=len, x=suppbydose, fill=suppbydose))+geom_boxplot()+ guides(fill=guide_legend(title="Supplement by Dose"))
p3 = p3 + labs(x = "Supplement by Dose",y = "Length")
p3 = p3 + ggtitle("Tooth growth with different supplements and doses")

# Loads all 3 plot but load them individually if you want
# better quality
grid.arrange(p1, p2, p3, ncol = 2)

# Summary of the data
summary(data)

#      len        supp     dose   
# Min.   : 4.20   OJ:30   0.5:20  
# 1st Qu.:13.07   VC:30   1  :20  
# Median :19.25           2  :20  
# Mean   :18.81                   
# 3rd Qu.:25.27                   
# Max.   :33.90     

# I am going to use t testing to analyze the data

# In order to do that I will breakdown our initial data
# by supplement and by dose so as to make a more in-depth
# analysis.

# Supplement type OJ and Dose level 0.5
doj0.5=subset(data,dose==.5 & supp=="OJ")

# Supplement type OJ and Dose level 1
doj1=subset(data,dose==1 & supp=="OJ")

# Supplement type OJ and Dose level 2
doj2=subset(data,dose==2 & supp=="OJ")

# Supplement type VC and Dose level 0.5
dvc0.5=subset(data,dose==.5 & supp=="VC")

# Supplement type VC and Dose level 1
dvc1=subset(data,dose==1 & supp=="VC")

# Supplement type vC and Dose level 2
dvc2=subset(data,dose==2 & supp=="VC")


# ========================Testing==================================

# All tests were performed at confidence level 0.95

# Test 1: Is there any statistically significant difference
# in growth between the two supplements with dose level 0.5

t.test(doj0.5$len,dvc0.5$len, conf.level=0.95)


# Test 2: Is there any statistically significant difference
# in growth between the two supplements with dose level 1

t.test(doj1$len,dvc1$len, conf.level=0.95)


# Test 3: Is there any statistically significant difference
# in growth between the two supplements with dose level 2

t.test(doj2$len,dvc2$len, conf.level=0.95)


# Test 4: Is there any statistically significant difference
# in growth between dose levels 0.5 and 1 for the supplement OJ

t.test(doj0.5$len,doj1$len, conf.level=0.95)


# Test 5: Is there any statistically significant difference
# in growth between dose levels 1 and 2 for the supplement OJ

t.test(doj1$len,doj2$len, conf.level=0.95)


# Test 6: Is there any statistically significant difference
# in growth between dose levels 0.5 and 1 for the supplement VC

t.test(dvc0.5$len,dvc1$len, conf.level=0.95)


# Test 7: Is there any statistically significant difference
# in growth between dose levels 1 and 2 for the supplement VC

t.test(dvc1$len,dvc2$len, conf.level=0.95)














