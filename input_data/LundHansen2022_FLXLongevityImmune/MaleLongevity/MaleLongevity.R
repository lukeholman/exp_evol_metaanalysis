###############################################################################################
################################ MALE LONGEVITY GENERATION 189 ################################
###############################################################################################

#Set up environment
library(car)
library(coxme)
library(multcomp)
library(survival)

#Read in the data
MLA.data <- read.csv("MaleLongevityAlone.csv", header = T, sep = ",", stringsAsFactors = TRUE)
MLG.data <- read.csv("MaleLongevityGroup.csv", header = T, sep = ",", stringsAsFactors = TRUE)


##########################################  STATISTIC  #########################################


###################### MALE LONGEVITY ISOLATED #####################


#First create a surv object
surv.MLA <- Surv(MLA.data$age, MLA.data$dead)


#Use coxme to test if there is a different in longevity between the regimes
cox.MLA <- coxme(surv.MLA ~ regime + (1|regime/rep_population), data = MLA.data)
summary(cox.MLA)
Anova(cox.MLA)
#Significant, P = 0.01055


#Do a Tukey test
RESULT.MLA <- glht(cox.MLA, linfct = mcp(regime = "Tukey"))
#Look at the results
summary(RESULT.MLA)
#CFM is significant different from Cwt



###################### MALE LONGEVITY MIXED-SEX GROUPS #####################


#First create a surv object
surv.MLG <- Surv(MLG.data$age, MLG.data$dead)


#Use coxme to test if there is a different in longevity between the regimes
cox.MLG <- coxme(surv.MLG ~ regime + (1|regime/rep_population), data = MLG.data)
summary(cox.MLG)
Anova(cox.MLG)
#Not significant, P = 0.8704



#########################################  PLOT DATA  #########################################


###################### MALE LONGEVITY ISOLATED #####################

#coxme models can't be plotted so we change to survfit
MLA.plot <- survfit(surv.MLA ~ regime, data = MLA.data)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(MLA.plot, xlim = c(0, 80), xlab = "Days", ylim = c(0, 1), ylab = "Proportion of survival", lwd = 2.5,
     cex.axis = 1.2, cex.lab = 1.3, las = 1, col = c("gray79", "gray51", "black"))
legend("topright", lwd = 1, c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))



###################### MALE LONGEVITY MIXED-SEX GROUPS #####################

#coxme models can't be plotted so we change to survfit
MLG.plot <- survfit(surv.MLG ~ regime, data = MLG.data)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(MLG.plot, xlim = c(0, 50), xlab = "Days", ylim = c(0, 1), ylab = "Proportion of survival", lwd = 2.5,
     cex.axis = 1.2, cex.lab = 1.3, las = 1, col = c("gray79", "gray51", "black"))
legend("topright", lwd = 1, c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))

