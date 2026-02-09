# Rapid evolution of sex role specialization in a hermaphrodite under sex-limited selection
---

The evolution of separate sexes from hermaphroditism is thought to have occurred independently many times, and may be linked to the evolution of sex chromosomes. Even though we have a good understanding of the theoretical steps in the evolution of sex chromosomes from a hermaphrodite ancestor, the initial stages are still hard to study in animals because many well-studied animal sex chromosome systems are old. We addressed this problem by experimentally selecting a hermaphrodite via sex-limited experimental evolution for several generations, simulating the early stages in the evolution of a sex chromosome. After 14 generations, a fitness assay revealed evidence of incipient sex role specialization in the female-selected lines, presumably reflecting the release from constraints usually imposed by selection on the other sex role. Importantly, however, this was not simply explained by morphology because testis and ovary sizes did not diverge among treatments. There was no evidence of a change in the male-selected lines. Our study shows that sex role specialization can occur rapidly as a result of sex-limited selection, which is consistent with genetic constraints between sex-roles, and in line with the first predicted steps towards the evolution of a new sex chromosome system. 
Contents: raw data file, two csv files for analysis, analysis file

## Description of the data and file structure

raw data.xlsx: raw data from fitness assay
Sheet 1: raw data
Treatment = experimental selection regime
Population = replicate line
Cross = data from 1st or 2nd cross of same set of individuals
Well = well-plate well ID
ID = ID number of target worm
G: green juv = number of GFP(+) offspring through eggs
G: white juv = number of GFP(-) offspring through eggs
WA: green juv = number of GFP(+) offspring through sperm from parter A
WA: white juv = number of GFP(-) offspring through sperm from parter A	
WB: green juv = number of GFP(+) offspring through sperm from parter B
WB: white juv = number of GFP(-) offspring through sperm from parter B
Sheet 2: standardization
Treatment = experimental selection regime
Population = replicate line
Female_Fitness = G: green juv + G: white juv
Total green Juv of W = WA: green juv + WB: green juv
Total juv of W = WA: green juv + WA: white juv + WB: green juv + WB: white juv
Male_Fitness = Total green Juv of W / Total juv of W
Female Mean = mean offspring production through eggs in Control selection regime
Female SD = standard deviation of offspring production through eggs in Control selection regime
Male Mean = mean siring success through sperm in Control selection regime
Male SD	= standard deviation of siring success through sperm in Control selection regime
Stand_Female_Fitness = standardized offspring production through eggs
Stand_Male_Fitness = stadardized proportion siring success
Control mean female fitness = mean Female_Fitess in the Control selection regime
SD female fitness = pooled standard deviation of Female_Fitness across all selection regimes
Control mean male fitness = mean Male_Fitness in the Control selection regime
SD male fitness = pooled standard deviation of Male_Fitness across all selection regimes

Mlig_fitness_data_C_standard.csv: file for analysis of fitness. Note that this file uses comma as the decimal separator and semicolon as the column separator.
Treatment = experimental selection regime
Population = replicate line
ID = target worm identifier
sex_role = sex-specific fitness measure (i.e. male or female fitness)
Stand_Fitness = standardized fitness value (i.e. Stand_Female_Fitness or Stand_Male_Fitness from raw data file)

Ovary_testis_area.csv: file for analysis of morphology
ID = individual identifier
line = replicate line
trt = experimental selection regime
ovary = total ovary area in mm2
body area = total body area in mm2
relative_ovary = ovary/body area (i.e. % of total body area)
testis = total testes area in mm2
relative_testis = testis/body area (i.e. % of total body area)
sex_allocation = testis/(testis+ovary) (i.e. % testis of total gonad area)

EVO-23-0013 analysis.Rmd: analysis file

## Sharing/Access information

No other sources

## Code/Software

Analysis file can be run in Rstudio. It is compatible with CC0 licensing.
Required packages:
lme4
lmerTest
car
emmeans