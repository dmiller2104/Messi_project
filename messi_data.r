## libraries

library(ggplot2)
library(dplyr)
library(tidyverse)
library(StatsBombR)
library(FC.rSTATS)
library(SBpitch)

## la liga datasets

la_liga_06_07 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2006/2007')

la_liga_07_08 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2007/2008')

la_liga_08_09 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2008/2009')

la_liga_09_10 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2009/2010')

la_liga_10_11 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2010/2011')

la_liga_11_12 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2011/2012')

la_liga_12_13 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2012/2013')

la_liga_13_14 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2013/2014')

la_liga_14_15 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2014/2015')

la_liga_15_16 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2015/2016')

la_liga_16_17 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2016/2017')

la_liga_17_18 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2017/2018')

la_liga_18_19 <- FreeCompetitions() %>% 
  filter(competition_id == 11 & season_name == '2018/2019')

# data preparation 

la_liga_06_07 <- FreeMatches(la_liga_06_07)
la_liga_06_07 <- StatsBombFreeEvents(MatchesDF = la_liga_06_07, Parallel = T)
la_liga_06_07 <- allclean(la_liga_06_07)

la_liga_07_08 <- FreeMatches(la_liga_07_08)
la_liga_07_08 <- StatsBombFreeEvents(MatchesDF = la_liga_07_08, Parallel = T)
la_liga_07_08 <- allclean(la_liga_07_08)

la_liga_08_09 <- FreeMatches(la_liga_08_09)
la_liga_08_09 <- StatsBombFreeEvents(MatchesDF = la_liga_08_09, Parallel = T)
la_liga_08_09 <- allclean(la_liga_08_09)

la_liga_09_10 <- FreeMatches(la_liga_09_10)
la_liga_09_10 <- StatsBombFreeEvents(MatchesDF = la_liga_09_10, Parallel = T)
la_liga_09_10 <- allclean(la_liga_09_10)

la_liga_10_11 <- FreeMatches(la_liga_10_11)
la_liga_10_11 <- StatsBombFreeEvents(MatchesDF = la_liga_10_11, Parallel = T)
la_liga_10_11 <- allclean(la_liga_10_11)

la_liga_11_12 <- FreeMatches(la_liga_11_12)
la_liga_11_12 <- StatsBombFreeEvents(MatchesDF = la_liga_11_12, Parallel = T)
la_liga_11_12 <- allclean(la_liga_11_12)

la_liga_12_13 <- FreeMatches(la_liga_12_13)
la_liga_12_13 <- StatsBombFreeEvents(MatchesDF = la_liga_12_13, Parallel = T)
la_liga_12_13 <- allclean(la_liga_12_13)

la_liga_13_14 <- FreeMatches(la_liga_13_14)
la_liga_13_14 <- StatsBombFreeEvents(MatchesDF = la_liga_13_14, Parallel = T)
la_liga_13_14 <- allclean(la_liga_13_14)

la_liga_14_15 <- FreeMatches(la_liga_14_15)
la_liga_14_15 <- StatsBombFreeEvents(MatchesDF = la_liga_14_15, Parallel = T)
la_liga_14_15 <- allclean(la_liga_14_15)

la_liga_15_16 <- FreeMatches(la_liga_15_16)
la_liga_15_16 <- StatsBombFreeEvents(MatchesDF = la_liga_15_16, Parallel = T)
la_liga_15_16 <- allclean(la_liga_15_16)

la_liga_16_17 <- FreeMatches(la_liga_16_17)
la_liga_16_17 <- StatsBombFreeEvents(MatchesDF = la_liga_16_17, Parallel = T)
la_liga_16_17 <- allclean(la_liga_16_17)

la_liga_17_18 <- FreeMatches(la_liga_17_18)
la_liga_17_18 <- StatsBombFreeEvents(MatchesDF = la_liga_17_18, Parallel = T)
la_liga_17_18 <- allclean(la_liga_17_18)

la_liga_18_19 <- FreeMatches(la_liga_18_19)
la_liga_18_19 <- StatsBombFreeEvents(MatchesDF = la_liga_18_19, Parallel = T)
la_liga_18_19 <- allclean(la_liga_18_19)

## barcelona specific data

barca_06_07 <- la_liga_06_07 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_06_07 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_06_07$season <- "06/07"

barca_07_08 <- la_liga_07_08 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_07_08 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_07_08$season <- "07/08"

barca_08_09 <- la_liga_08_09 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_08_09 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_08_09$season <- "08/09"

barca_09_10 <- la_liga_09_10 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_09_10 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_09_10$season <- "09/10"

barca_10_11 <- la_liga_10_11 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_10_11 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_10_11$season <- "10/11"

barca_11_12 <- la_liga_11_12 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_11_12 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_11_12$season <- "11/12"

barca_12_13 <- la_liga_12_13 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_12_13 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),            
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_12_13$season <- "12/13"

barca_13_14 <- la_liga_13_14 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_13_14 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),  
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_13_14$season <- "13/14"

barca_14_15 <- la_liga_14_15 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_14_15 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2), 
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_14_15$season <- "14/15"

barca_15_16 <- la_liga_15_16 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_15_16 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_15_16$season <- "15/16"

barca_16_17 <- la_liga_16_17 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_16_17 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_16_17$season <- "16/17"

barca_17_18 <- la_liga_17_18 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_17_18 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_17_18$season <- "17/18"

barca_18_19 <- la_liga_18_19 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_18_19 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)))
barca_18_19$season <- "18/19"

## rowbind to get all season together

all_seasons <- rbind(barca_06_07, barca_07_08, barca_08_09, barca_09_10, barca_10_11,
      barca_11_12, barca_12_13, barca_13_14, barca_14_15, barca_15_16,
      barca_16_17, barca_17_18, barca_18_19)

all_seasons <- drop_na(all_seasons)

#

