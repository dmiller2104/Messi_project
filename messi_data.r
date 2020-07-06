## libraries

library(ggplot2)
library(dplyr)
library(tidyverse)
library(StatsBombR)
library(FC.rSTATS)
library(SBpitch)

la_liga <- FreeCompetitions() %>% 
  filter(competition_id == 11)

champ_lg <- FreeCompetitions() %>% 
  filter(competition_id == 16)

matches_esp <- FreeMatches(la_liga)

matches_cl <- FreeMatches(champ_lg)

## convert to dataframes

matches_esp <- StatsBombFreeEvents(MatchesDF = matches_esp, Parallel = T)

matches_cl <- StatsBombFreeEvents(MatchesDF = matches_cl, Parallel = T)

## clean the data 

matches_esp <- allclean(matches_esp)

matches_cl <- allclean(matches_cl)

