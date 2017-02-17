# load readxl package
library(readxl)

# get the list of sheets in the EXCEL file
sheets <- excel_sheets ("ehr.xlsx")

# read in data from 1st tab "PulseOx"
patients <- read_excel("ehr.xlsx",
                       sheet = "Patients")

# read in data from 1nd tab 
pulseox <- read_excel("ehr.xlsx",
                       sheet = "PulseOx")

# see variable names in the 2 datasets
names(patients)
names(pulseox)

# use the dplyr package - we'll do an "outer join"
# to merge these 2 datasets together by the EncounterID
library(dplyr)
all <- full_join(x=patients, y=pulseox, by="EncounterID")

# we now have "tidy" data, but what if we want
# the encounters to be in separate columns

library(tidyr)
sp1 <- spread(data=all, key="EncounterID", 
              value="%O2 HB, Arterial")





library(purrr)

mtcars %>%
  split(.$cyl) %>%
  map(~ lm(mpg ~ wt, data = .)) %>%
  map(summary) %>%
  map_dbl("r.squared")

