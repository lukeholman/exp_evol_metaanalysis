# Data from: Mixed evidence for intralocus sexual conflict from male-limited selection in *Drosophila melanogaster*

## Title of Dataset

Wild-type estimates of fitness, sperm comp, mate choice, and heritable variation for fitness under male-limited experimental evolution.

#### Associated Publication

* **Title:** Mixed evidence for intralocus sexual conflict from male-limited selection in Drosophila melanogaster
* **Journal:** Journal of Heredity
* **Authors:**
  * Harshavardhan Thyagarajan,
  * Imran Sayyed,
  * Mindy G. Baroody,
  * Joshua A. Kowal,
  * Troy Day,
  * Adam K. Chippindale

#### Dataset Overview

This dataset contains experimental data on fitness, mate choice and sperm competition measurements for male-limited and control selection populations; and fitness measurements for hemiclones expressed male and female backgrounds. The data pertains to experimentally evolved *Drosophila melanogaster* populations. The data are provided as CSV files.

The six files correspond to different experimental assays:

1. `M_CRF_wt.cr.csv` — Male competitive reproductive fitness assay
2. `F_CRF_wt.cr.csv` — Female competitive reproductive fitness assay
3. `M_SC_wt.cr.csv` — Male sperm competition assay data
4. `M_MC_wt.cr.csv` — Male mating competition (mating latency and duration)
5. `M_HClines.csv` — Hemiclonal male competitive reproductive fitness assay
6. `F_HClines.csv` — Hemiclonal female fecundity assay

Common variables:

1. Selection
   ML — Male limited
   MC — Matched control (matched by replicate number, for example ML1 and MC1)
2. Treatment — In experiments where the ML haplotypes were expressed in a variety of treatments, these are labelled as follows. If a treatment variable is not provided, it means that all the animals under selection "ML" were studied under conditions resembling MLSD. Where `Treatment` is provided, the variable `Selection` is normally excluded as `Treatment` covers this information.
   MLSD — ML, single dose of entire haplotype
   MLSDa — ML, single dose of autosomes
   MLDD — ML, double dose
   MC — MC (analogous to MLDD)
3. Replicate — This describes the replicate pairs of selected and control populations. It is necessary to clarify here the method of setting up replicates. Commonly, a single source population is used to derive n statistical replicate populations under selection / control conditions. Here rather, we use 3 long separated populations (themselves originally derived as statistical replicates over 20 years prior) to initiate each selection / control pair.
4. Contest — An identifier for a distinct chamber in which an assay was conducted. In fitness assays, in each contest, we had 30 target animals compete 30 recessively marked competitors of the same sex for the maximum reproductive output, in the presence of 50 animals of the opposite sex.

#### File Details

1\. **`M_CRF_wt.cr.csv`**

* **Dimensions:** 851 rows × 7 columns

**2. `F_CRF_wt.cr.csv`**

* **Dimensions:** 423 rows × 7 columns
* **Columns:** (for both 1 & 2)
  * `Gen` — Generation number, categorical
  * `Treatment` — Described above, categorical
  * `Replicate` — Described above, categorical
  * `Contest` — Described above, categorical
  * `Vial` — Vial number, statistical replicate unit of competitive outcome from a single contest, categorical
  * `Red` — Number of red-eyed progeny, count
  * `Brown` — Number of brown-eyed progeny, count

**3. `M_SC_wt.cr.csv`**

* **Dimensions:** 619 rows × 6 columns
* **Columns:**
  * `Treatment` — Described above, categorical
  * `Replicate` — Described above, categorical
  * `Bundle` — Analogous to contest - a bundle represents flies that were housed together during testing,  categorical
  * `Vial` — Each vial represents data from a single female laying eggs. Nested within bundle as with vials within contest in CRF assays, categorical
  * `U` — Number of mutant (recessively marked) offspring, count
  * `WT` — Number of wild-type progeny, count

**4. `M_MC_wt.cr.csv`**

* **Dimensions:** 273 rows × 14 columns
* **NAs:** NA here refers to cells where the data is not available.
* **Columns:**
  * `Selection` — Described above, categorical
  * `Replicate` — Described above, categorical
  * `Vial.ID` — Identifier of independent contest between animals in this experiment, not nested here, categorical
  * `Obs.start.time` — Observed start time of assay, hh:mm
  * `Mating.start.time` — Time when mating began, hh:mm
  * `Mating.end.time` — Time when mating ended, hh:mm
  * `Mated.male` — Identity of mating male (wt - aka target / bw - recessive competitor), categorical
  * `Males` — Number of males present in vial, count
  * `Females` — Number of females present in vial, count
  * `Obs.start.time.Corr` — Converted observation start time (minutes since ref), numeric
  * `Mating.start.time.Corr` — Converted mating start time, numeric
  * `Mating.end.time.Corr` — Converted mating end time, numeric
  * `Latency` — Time from observation to mating start, minutes
  * `Duration` — Duration of mating, minutes

**5. `M_HClines.csv`**

* **Dimensions:** 367 rows × 5 columns
* **Columns:**
  * `Selection` — Described above, categorical
  * `Line` — Hemiclone line number, categorical
  * `Vial` — Vial number - analogous to contest here (no nesting within another variable), categorical
  * `Red.offspring` — Number of red-eyed progeny, count
  * `Peach.offspring` — Number of brown-eyed progeny, count

**6. `F_HClines.csv`**

* **Dimensions:** 367 rows × 5 columns
* **Columns:**
  * `Selection` — Described above, categorical
  * `Line` — Hemiclone line number, categorical
  * `Vial` — Vial number - analogous to contest here (no nesting within another variable), categorical
  * `Pupal.count` — Number of offspring of target females, counted at the pupal stage, count
  * `Dams.Count` — Number of females that were introduced into egg-laying vials (typically designed to be 4, but sometimes fewer), count

**License**

This dataset is released under the **CC0 1.0 Universal** license in accordance with Dryad’s policies.

**Citation**

Thyagarajan, H. et al. (2025). *Dataset: Mixed evidence for intralocus sexual conflict from male-limited selection in Drosophila melanogaster*. Dryad Digital Repository. DOI: 10.5061/dryad.ncjsxkt8p
