###############################################################################################
################################ INFECTION ASSAY GENERATION 48 ################################
###############################################################################################


#Set up environment
library(car)
library(Hmisc)
library(lme4)
library(lmerTest)

#Read in the data
IA.data <- read.csv("infectionassay.csv", header = T, sep = ",", stringsAsFactors = TRUE)


##########################################  STATISTIC  #########################################


###################### PREPARING THE DATA #####################


#Before I do the model I log transform the data and add a +1 because of a 0 value
IA.data$lnCFU <- log(IA.data$CFU_fly + 1)

#After running the model and looking at the residuals, the 0 value is a clear outlier so I removed it
outlierIA <- IA.data$lnCFU[which((abs(IA.data$lnCFU - median(IA.data$lnCFU)) / mad(IA.data$lnCFU)) > 2)]
IA.data$lnCFU[IA.data$lnCFU %in% outlierIA[1]] <- NA



###################### RESISTANCE TO INFECTION WITH L. lactis #####################


### LINEAT MODEL ###

#Linear mixed model testing if regime has a significant effect on bacterial load
model.BL <- lmer(lnCFU ~ regime + block + (1|regime:rep_population), data = IA.data)
#ANOVA
Anova(model.BL, test = "F")
#Regime is not significant, P = 0.6970
#Block is not significant, P = 0.6419
ranova(model.BL)
#Nested value is not significant, P = 0.5056


#Homogeneity of variances
leveneTest(IA.data$lnCFU, IA.data$regime)
#Not significant, assumption of homogeneity of variances is met

#Test the model by looking at the residuals
resid.BL <- residuals(model.BL)
hist(resid.BL)
shapiro.test(resid.BL)
qqnorm(resid.BL)
qqline(resid.BL)
plot(resid.BL)
#The residuals are more or less normally distributed, meaning that the model is valid



###################### SURVIVAL TOLERANCE TO L. lactis #####################


### LINEAT MODEL ###

#Linear mixed model testing if survival tolerance is significantly effected by regime and bacterial load
model.ST <- lmer(surv_prop ~ lnCFU * regime + block + (1|regime:rep_population), data = IA.data)
#ANOVA
Anova(model.ST, test = "F")
#Load is not significant, P = 0.23641
#Regime is not significant, P = 0.94700
#Block is significant, P = 0.02428
#The interaction is not significant, P = 0.57478
ranova(model.ST)
#Nested value is not significant, P = 0.8015


#Homogeneity of variances
leveneTest(IA.data$surv_prop, IA.data$regime)
#Not significant, assumption of homogeneity of variances is met

#Test the model by looking at the residuals
resid.ST <- residuals(model.ST)
hist(resid.ST)
shapiro.test(resid.ST)
qqnorm(resid.ST)
qqline(resid.ST)
plot(resid.ST)
#The residuals are more or less normally distributed, meaning that the model is valid



#########################################  PLOT DATA  #########################################



###################### L. lactis LOAD #####################


#Create new dataframe for plotting
IAplot <- IA.data[c(1:10)]
#Remove NAs
IAplot <- IAplot[which(is.na(IA.data$lnCFU) == F),]

#Add fitted values
IAplot$fitted <- fitted(model.BL)

#Calculate mean
BL.M <- tapply(IAplot$fitted, IAplot$regime, mean)
#SE
BL.SE <- (summary(model.BL)$coefficients[c(1:3), 2])


### PLOT ###

par(mar = c(3, 5, 2, 2))
#First make the plot
plot(NULL, xlim = c(0.5, 3.5), xlab = "", xaxt = "n", ylim = c(4, 18), 
     ylab = "ln(L. lactis load)", cex.lab = 1.8, cex.axis = 1.4, las = 1)
#Add points
stripchart(IA.data$lnCFU ~ IA.data$regime, add = T, vertical = T, method = "jitter", 
           pch = c(16, 15, 17), cex = 2, col = c("#f3f3f3", "#e9e9e9", "#dcdcdc"), at = c(1, 2, 3))
#Add errorbar
xBL <- c(1, 2, 3)
errbar(xBL, BL.M, BL.M + BL.SE, BL.M - BL.SE, 
       cex = 3, lwd = 3, pch = c(16, 15, 17), col = c("gray79", "gray51", "black"),
       errbar.col = c("gray79", "gray51", "black"), add = T)
#Add axis
axis(1, at = c(1, 2, 3), cex.axis = 1.5, labels = c("FLX", "CFM", "Cwt"))



###################### SURVIVAL TOLERANCE #####################

#First subset the data
FLX <- subset(IAplot, regime == "aFLX")
CFM <- subset(IAplot, regime == "bCFM")
Cwt <- subset(IAplot, regime == "cCwt")


### PLOT ###

par(mar = c(5, 5, 2, 2))
#First make the plot for Cwt
plot(Cwt$surv_prop ~ Cwt$lnCFU, xlim = c(4, 18), xlab = "ln(L. lactis load)", ylim = c(0.4, 1), 
     ylab = "Propotion of Survival", cex.lab = 1.8, cex.axis = 1.4, las = 1, 
     pch = 17, col = "black", cex = 3)
abline(lm(FLX$surv_prop ~ FLX$lnCFU), col = "black", lwd = 3)
#Then add CFM
points(CFM$surv_prop ~ CFM$lnCFU, pch = 15, col = "gray51", cex = 3)
abline(lm(CFM$surv_prop ~ CFM$lnCFU), col = "gray51", lwd = 3)
#And FLX
points(FLX$surv_prop ~ FLX$lnCFU, pch = 16, col = "gray79", cex = 3)
abline(lm(FLX$surv_prop ~ FLX$lnCFU), col = "gray79", lwd = 3)

