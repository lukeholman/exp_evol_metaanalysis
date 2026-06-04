###############################################################################################
############################### FEMALE LONGEVITY GENERATION 189 ###############################
###############################################################################################

#Set up environment
library(car)
library(coxme)
library(multcomp)
library(survival)

#Read in the data
FLA.data <- read.csv("FemaleLongevityAlone.csv", header = T, sep = ",", stringsAsFactors = TRUE)
FLG.data <- read.csv("FemaleLongevityGroup.csv", header = T, sep = ",", stringsAsFactors = TRUE)


##########################################  STATISTIC  #########################################


###################### FEMALE LONGEVITY ISOLATED #####################


#First create a surv object
surv.FLA <- Surv(FLA.data$age, FLA.data$dead)


#Use coxme to test if there is a different in longevity between the regimes
cox.FLA <- coxme(surv.FLA ~ regime + (1|regime/rep_population), data = FLA.data)
summary(cox.FLA)
Anova(cox.FLA)
#Not significant, P = 0.7956



###################### FEMALE LONGEVITY MIXED-SEX GROUPS #####################


#First create a surv object
surv.FLG <- Surv(FLG.data$age, FLG.data$dead)

#Use coxme to test if there is a different in longevity between the regimes
cox.FLG <- coxme(surv.FLG ~ regime + (1|regime/rep_population) + (1|vial), data = FLG.data)
summary(cox.FLG)
Anova(cox.FLG)
#Significant, P = 0.02958


#Do a Tukey test
RESULT.FLG <- glht(cox.FLG, linfct = mcp(regime = "Tukey"))
#Look at the results
summary(RESULT.FLG)
#CFM is significantly different from Cwt



#########################################  PLOT DATA  #########################################


###################### FEMALE LONGEVITY ISOLATED #####################

#coxme models can't be plotted so we change to survfit
FLA.plot <- survfit(surv.FLA ~ regime, data = FLA.data)

### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(FLA.plot, xlim = c(0, 90), xlab = "Days", ylim = c(0, 1), ylab = "Proportion of survival", xaxt = "n", lwd = 2.5,
     cex.axis = 1.2, cex.lab = 1.3, las = 1, col = c("gray79", "gray51", "black"))
axis(1, at = seq(0, 90,  by = 15), cex.axis = 1.2, las = 1)
legend("topright", lwd = 1, c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))



###################### FEMALE LONGEVITY MIXED-SEX GROUPS #####################

#coxme models can't be plotted so we change to survfit
FLG.plot <- survfit(surv.FLG ~ regime, data = FLG.data)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(FLG.plot, xlim = c(0, 50), xlab = "Days", ylim = c(0, 1), ylab = "Proportion of survival", lwd = 2.5,
     cex.axis = 1.2, cex.lab = 1.3, las = 1, col = c("gray79", "gray51", "black"))
legend("topright", lwd = 1, c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))

