################################################################################################
############################ SURVIVAL AFTER INFECTION GENERATION 48 ############################
################################################################################################


#Set up environment
library(car)
library(coxme)
library(multcomp)
library(survival)

#Read in the data
Sur7d.data <- read.csv("survival7days.csv", h = T, sep = ",", stringsAsFactors = T)
Sur22d.data <- read.csv("survival22days.csv", h = T, sep = ",", stringsAsFactors = T)


##########################################  STATISTIC  #########################################


###################### SURVIVAL AFTER 7 DAYS #####################


#First create a surv object to use in future models
surv.7d <- Surv(Sur7d.data$age, Sur7d.data$dead)


#Model survival as an effect of 
cox.7d <- coxme(surv.7d ~ regime * bacterium + block + (1|vial) + (1|regime/rep_population), data = Sur7d.data)
summary(cox.7d)
Anova(cox.7d)
#Regime is not significant, P = 0.7619 
#Bacterium is significant, P < 2e-16
#Block is not significant, P = 0.8863
#Interaction is not significant, P = 0.7110



###################### SURVIVAL AFTER 22 DAYS #####################


#First create a surv object to use in future models
surv.22d <- Surv(Sur22d.data$age, Sur22d.data$dead)


#Model survival as an effect of 
cox.22d <- coxme(surv.22d ~ regime * bacterium + block + (1|vial) + (1|regime/rep_population), data = Sur22d.data)
summary(cox.22d)
Anova(cox.22d)
#Regime is not significant, P = 0.5819
#Bacterium is significant, P < 2e-16
#Block is not significant, P = 0.9169
#Interaction is not significant, P = 0.1477


######## NAIVE FLIES ########

#Subset the data
Naive <- subset(Sur22d.data, bacterium == "aNaive")

#Create a surv object to use in future models
surv.Naive <- Surv(Naive$age, Naive$dead)


#Model survival as an effect of 
cox.Naive <- coxme(surv.Naive ~ regime + block + (1|vial) + (1|regime/rep_population), data = Naive)
summary(cox.Naive)
Anova(cox.Naive)
#Regime is not significant, P = 0.09464
#Block is not significant, P = 0.79807



#########################################  PLOT DATA  #########################################


###################### SURVIVAL AFTER 7 DAYS #####################

#coxme models can't be plotted so we change to survfit
Sur7d.plot <- survfit(surv.7d ~ regime + bacterium, data = Sur7d.data)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(Sur7d.plot, xlim = c(0, 180), xlab = "Hours", xaxt = "n", ylim = c(0, 1), ylab = "Proportion of survival", 
    cex.axis = 1.4, cex.lab = 1.8, las = 1,  lwd = 3, lty = c(1, 2, 3, 4), col = c("gray79", "gray51", "black"))
#Add axis
axis(1, at = seq(0, 180,  by = 30), cex.axis = 1.4, las = 1)
#Add legend
legend(129.6, 0.4, lty = c(1, 2, 3, 4), c("Naïve", "Wounded", "L. lactis", "P. entomophila"))
legend("right", pch = "-", c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))



###################### SURVIVAL AFTER 22 DAYS #####################


#coxme models can't be plotted so we change to survfit
Sur22d.plot <- survfit(surv.22d ~ regime + bacterium, data = Sur22d.data)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(Sur22d.plot, xlim = c(0, 550), xaxt = "n", xlab = "Hours", ylim = c(0, 1), ylab = "Proportion of survival", 
     cex.axis = 1.4, cex.lab = 1.8, las = 1,  lwd = 3, lty = c(1, 4), col = c("gray79", "gray51", "black"))
#Add axis
axis(1, at = seq(0, 550,  by = 110), cex.axis = 1.4, las = 1)
#Add legend
legend("right", pch = "-", c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))
legend(395.8, 0.4, lty = c(1, 4), c("Naïve", "P. entomophila"))



### NAIVE FLIES ###

#coxme models can't be plotted so we change to survfit
Naive.plot <- survfit(surv.Naive ~ regime, data = Naive)


### PLOT ###

par(mar = c(5, 5, 2, 2))
plot(Naive.plot, xlim = c(0, 550), xlab = "Hours", xaxt = "n", ylim = c(0.88, 1), ylab = "Proportion of survival", 
     cex.axis = 1.4, cex.lab = 1.8, las = 1,  lwd = 3, lty = 1, col = c("gray79", "gray51", "black"), mgp = c(3.6, 1, 0))
#Add axis
axis(1, at = seq(0, 550,  by = 110), cex.axis = 1.4, las = 1)
#Add legend
legend("bottomleft", lty = 1, lwd = 2, c("FLX", "CFM", "Cwt"), col = c("gray79", "gray51", "black"))

