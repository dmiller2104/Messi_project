## libraries

library(ggplot2)
library(dplyr)
library(tidyverse)
library(StatsBombR)
library(FC.rSTATS)
library(SBpitch)
library(formattable)
library(RColorBrewer)
library(ggrepel)
library(extrafont)
font_import()
loadfonts(device = "win")
# fonts() to check fonts available

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
minutes_06_07 <- get.minutesplayed(la_liga_06_07)
minutes_06_07 <- minutes_06_07 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_07_08 <- FreeMatches(la_liga_07_08)
la_liga_07_08 <- StatsBombFreeEvents(MatchesDF = la_liga_07_08, Parallel = T)
la_liga_07_08 <- allclean(la_liga_07_08)
minutes_07_08 <- get.minutesplayed(la_liga_07_08)
minutes_07_08 <- minutes_07_08 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_08_09 <- FreeMatches(la_liga_08_09)
la_liga_08_09 <- StatsBombFreeEvents(MatchesDF = la_liga_08_09, Parallel = T)
la_liga_08_09 <- allclean(la_liga_08_09)
minutes_08_09 <- get.minutesplayed(la_liga_08_09)
minutes_08_09 <- minutes_08_09 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_09_10 <- FreeMatches(la_liga_09_10)
la_liga_09_10 <- StatsBombFreeEvents(MatchesDF = la_liga_09_10, Parallel = T)
la_liga_09_10 <- allclean(la_liga_09_10)
minutes_09_10 <- get.minutesplayed(la_liga_09_10)
minutes_09_10 <- minutes_09_10 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_10_11 <- FreeMatches(la_liga_10_11)
la_liga_10_11 <- StatsBombFreeEvents(MatchesDF = la_liga_10_11, Parallel = T)
la_liga_10_11 <- allclean(la_liga_10_11)
minutes_10_11 <- get.minutesplayed(la_liga_10_11)
minutes_10_11 <- minutes_10_11 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_11_12 <- FreeMatches(la_liga_11_12)
la_liga_11_12 <- StatsBombFreeEvents(MatchesDF = la_liga_11_12, Parallel = T)
la_liga_11_12 <- allclean(la_liga_11_12)
minutes_11_12 <- get.minutesplayed(la_liga_11_12)
minutes_11_12 <- minutes_11_12 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_12_13 <- FreeMatches(la_liga_12_13)
la_liga_12_13 <- StatsBombFreeEvents(MatchesDF = la_liga_12_13, Parallel = T)
la_liga_12_13 <- allclean(la_liga_12_13)
minutes_12_13 <- get.minutesplayed(la_liga_12_13)
minutes_12_13 <- minutes_12_13 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_13_14 <- FreeMatches(la_liga_13_14)
la_liga_13_14 <- StatsBombFreeEvents(MatchesDF = la_liga_13_14, Parallel = T)
la_liga_13_14 <- allclean(la_liga_13_14)
minutes_13_14 <- get.minutesplayed(la_liga_13_14)
minutes_13_14 <- minutes_13_14 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_14_15 <- FreeMatches(la_liga_14_15)
la_liga_14_15 <- StatsBombFreeEvents(MatchesDF = la_liga_14_15, Parallel = T)
la_liga_14_15 <- allclean(la_liga_14_15)
minutes_14_15 <- get.minutesplayed(la_liga_14_15)
minutes_14_15 <- minutes_14_15 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_15_16 <- FreeMatches(la_liga_15_16)
la_liga_15_16 <- StatsBombFreeEvents(MatchesDF = la_liga_15_16, Parallel = T)
la_liga_15_16 <- allclean(la_liga_15_16)
minutes_15_16 <- get.minutesplayed(la_liga_15_16)
minutes_15_16 <- minutes_15_16 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_16_17 <- FreeMatches(la_liga_16_17)
la_liga_16_17 <- StatsBombFreeEvents(MatchesDF = la_liga_16_17, Parallel = T)
la_liga_16_17 <- allclean(la_liga_16_17)
minutes_16_17 <- get.minutesplayed(la_liga_16_17)
minutes_16_17 <- minutes_16_17 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_17_18 <- FreeMatches(la_liga_17_18)
la_liga_17_18 <- StatsBombFreeEvents(MatchesDF = la_liga_17_18, Parallel = T)
la_liga_17_18 <- allclean(la_liga_17_18)
minutes_17_18 <- get.minutesplayed(la_liga_17_18)
minutes_17_18 <- minutes_17_18 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

la_liga_18_19 <- FreeMatches(la_liga_18_19)
la_liga_18_19 <- StatsBombFreeEvents(MatchesDF = la_liga_18_19, Parallel = T)
la_liga_18_19 <- allclean(la_liga_18_19)
minutes_18_19 <- get.minutesplayed(la_liga_18_19)
minutes_18_19 <- minutes_18_19 %>% 
  group_by(player.id) %>% 
  summarise(minutes = sum(MinutesPlayed))

## barcelona specific data

barca_06_07 <- la_liga_06_07 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_06_07 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_06_07$season <- "06/07"
barca_06_07 <- left_join(barca_06_07, minutes_06_07)
barca_06_07 <- barca_06_07 %>% mutate(nineties = minutes/90)

barca_07_08 <- la_liga_07_08 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_07_08 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_07_08$season <- "07/08"
barca_07_08 <- left_join(barca_07_08, minutes_07_08)
barca_07_08 <- barca_07_08 %>% mutate(nineties = minutes/90)

barca_08_09 <- la_liga_08_09 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_08_09 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_08_09$season <- "08/09"
barca_08_09 <- left_join(barca_08_09, minutes_08_09)
barca_08_09 <- barca_08_09 %>% mutate(nineties = minutes/90)

barca_09_10 <- la_liga_09_10 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_09_10 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_09_10$season <- "09/10"
barca_09_10 <- left_join(barca_09_10, minutes_09_10)
barca_09_10 <- barca_09_10 %>% mutate(nineties = minutes/90)

barca_10_11 <- la_liga_10_11 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_10_11 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_10_11$season <- "10/11"
barca_10_11 <- left_join(barca_10_11, minutes_10_11)
barca_10_11 <- barca_10_11 %>% mutate(nineties = minutes/90)

barca_11_12 <- la_liga_11_12 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_11_12 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_11_12$season <- "11/12"
barca_11_12 <- left_join(barca_11_12, minutes_11_12)
barca_11_12 <- barca_11_12 %>% mutate(nineties = minutes/90)

barca_12_13 <- la_liga_12_13 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_12_13 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),            
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_12_13$season <- "12/13"
barca_12_13 <- left_join(barca_12_13, minutes_12_13)
barca_12_13 <- barca_12_13 %>% mutate(nineties = minutes/90)

barca_13_14 <- la_liga_13_14 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_13_14 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),  
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_13_14$season <- "13/14"
barca_13_14 <- left_join(barca_13_14, minutes_13_14)
barca_13_14 <- barca_13_14 %>% mutate(nineties = minutes/90)

barca_14_15 <- la_liga_14_15 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_14_15 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2), 
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_14_15$season <- "14/15"
barca_14_15 <- left_join(barca_14_15, minutes_14_15)
barca_14_15 <- barca_14_15 %>% mutate(nineties = minutes/90)

barca_15_16 <- la_liga_15_16 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_15_16 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_15_16$season <- "15/16"
barca_15_16 <- left_join(barca_15_16, minutes_15_16)
barca_15_16 <- barca_15_16 %>% mutate(nineties = minutes/90)

barca_16_17 <- la_liga_16_17 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_16_17 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_16_17$season <- "16/17"
barca_16_17 <- left_join(barca_16_17, minutes_16_17)
barca_16_17 <- barca_16_17 %>% mutate(nineties = minutes/90)

barca_17_18 <- la_liga_17_18 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_17_18 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_17_18$season <- "17/18"
barca_17_18 <- left_join(barca_17_18, minutes_17_18)
barca_17_18 <- barca_17_18 %>% mutate(nineties = minutes/90)

barca_18_19 <- la_liga_18_19 %>% filter(team.name == "Barcelona") %>% group_by(player.id, player.name) %>% 
  summarise(chances_created = sum(pass.shot_assist == 'TRUE', na.rm = TRUE), 
            assists = sum(pass.goal_assist == 'TRUE', na.rm = TRUE),
            XG = sum(shot.statsbomb_xg, na.rm = TRUE),
            goals = sum(shot.outcome.name == 'Goal', na.rm = TRUE),
            percent_of_team_goals = round((sum(shot.outcome.name == "Goal", na.rm = TRUE) / 
                                    sum(la_liga_18_19 %>% filter(team.name == "Barcelona") %>% 
                                    summarise(sum(shot.outcome.name == "Goal", na.rm = TRUE)))),2),
            shots_on_target = (sum(shot.outcome.name == 'Goal', na.rm = TRUE) + sum(shot.outcome.name == 'Saved', na.rm = TRUE) + sum(shot.outcome.name == 'Saved to post', na.rm = TRUE)),
            left_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Left Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            right_footed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Right Foot' & shot.type.name == 'Open Play', na.rm = TRUE),
            headed_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Head' & shot.type.name == 'Open Play', na.rm = TRUE),
            other_goals = sum(shot.outcome.name == 'Goal' & shot.body_part.name == 'Other' & shot.type.name == 'Open Play', na.rm = TRUE),
            free_kick_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Free Kick', na.rm = TRUE),
            penalty_goals = sum(shot.outcome.name == 'Goal' & shot.type.name == 'Penalty', na.rm = TRUE))
barca_18_19$season <- "18/19"
barca_18_19 <- left_join(barca_18_19, minutes_18_19)
barca_18_19 <- barca_18_19 %>% mutate(nineties = minutes/90)


## rowbind to get all season together

all_seasons <- rbind(barca_06_07, barca_07_08, barca_08_09, barca_09_10, barca_10_11,
      barca_11_12, barca_12_13, barca_13_14, barca_14_15, barca_15_16,
      barca_16_17, barca_17_18, barca_18_19)

all_seasons <- drop_na(all_seasons)

# messi summary data only

messi_seasons <- all_seasons %>% filter(player.id == 5503)
messi_seasons <- messi_seasons %>% mutate(goals_per_90 = goals/nineties)
messi_seasons$XG <- round(messi_seasons$XG,2)

formattable(messi_seasons[,c(15,3,4,8,5,6,7)],
            list(`percent_of_team_goals` = percent,
                 `goals` = color_bar("#FA614B66"),
                 `assists` = color_bar("#FA614B66")))

## scatter plot

goal_xg_scatterplot <- ggplot(messi_seasons, aes(x = goals, y = XG)) + 
  geom_point(aes(col = goals, size = percent_of_team_goals)) + 
  geom_text_repel(aes(label = season), size = 3.5) + 
  scale_colour_gradient(low = "blue", high = "red") + 
  labs(title = "Messi: A supernatural finisher and a club dependent", 
       subtitle = "In median terms, Messi has his outscored expected goals total per season by 32%,\nand has also accounted for 37% of his team's goals",
       caption = "Data source: StatsBomb") +
       xlab("Goals") +
       ylab("Expected goals") +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        panel.background = element_blank(),
        axis.line.x = element_line(color = "black", size = 0.5),
        axis.line.y = element_line(color = "black", size = 0.5)) 

## barplot showing goals per 90 over seasons

goals_per_90_plot <- ggplot(messi_seasons, aes(x = season, y = goals_per_90, fill = season)) + 
  geom_bar(stat = "identity", show.legend = FALSE) +
  scale_fill_manual(values = rep(c("#DC143C","#0000CD"), ceiling(length(messi_seasons$season)/2))[1:length(messi_seasons$season)]) +
  scale_x_discrete(limits = rev(messi_seasons$season)) +
  ylab("Goals per 90 minutes") +
  xlab("Season") +
  scale_y_continuous(expand = c(0,0)) +
  coord_flip() +
  labs(title = "Back of the net, time and again",
      subtitle = "Messi has been averaging nearly a goal a game, and in some cases more (Seasons 09/10, 11/12, 14/15, 16/17, 18/19)",
       caption = "Data source: StatsBomb") +
  theme(text=element_text(size = 11, family = "Segoe UI Light"),
        panel.background = element_blank())

## stacked barchart goals by type 

a <- messi_seasons %>% pivot_longer(cols = left_footed_goals:penalty_goals)

ggplot(a[order(a$value, decreasing = T),],
       aes(x = season, y = value, fill = factor(
         name, levels = rev(c("left_footed_goals","right_footed_goals","headed_goals","other_goals","free_kick_goals","penalty_goals"))))) +
  geom_bar(stat = "identity")+
  geom_text(aes(label=ifelse(value>9 | name == 'free_kick_goals' & value > 1,value,'')), family = "Segoe UI Light", col = "White", position = position_stack(vjust = 0.45)) +
  scale_fill_manual(values = c("#0000CC","#3333FF","#0099FF","#FF9999","#FF3333","#CC0033"),
                      name = "Goal method",
                      breaks = c("left_footed_goals","right_footed_goals","headed_goals","other_goals","free_kick_goals","penalty_goals"),
                      labels = c("Left foot", "Right foot", "Header","Other","Free Kick", "Penalty")) +
  ylab("Goals") +
  xlab("Season") +
  labs(title = "Dont let him get on his left foot!",
       subtitle = "It comes as no surprise that most of Messi's goals come from his left foot, but we can also see an increasing\nnumber of free kicks making up his seasons tallies",
       caption = "Data source: StatsBomb") +
  theme(text=element_text(size = 11, family = "Segoe UI Light"),
        panel.background = element_blank())

## dot plot alternative

ggplot(a[order(a$value, decreasing = T),],
       aes(x = season, y = value, fill = factor(
         name, levels = rev(c("left_footed_goals","right_footed_goals","headed_goals","other_goals","free_kick_goals","penalty_goals"))))) +
  geom_dotplot(binaxis = "y")+
  scale_fill_manual(values = c("#0000CC","#3333FF","#0099FF","#FF9999","#FF3333","#CC0033"),
                    name = "Goal method",
                    breaks = c("left_footed_goals","right_footed_goals","headed_goals","other_goals","free_kick_goals","penalty_goals"),
                    labels = c("Left foot", "Right foot", "Header","Other","Free Kick", "Penalty")) +
  ylab("Goals") +
  xlab("Season") +
  labs(title = "Dont let him get on his left foot!",
       subtitle = "It comes as no surprise that most of Messi's goals come from his left foot, but we can also see an increasing\nnumber of free kicks making up his seasons tallies",
       caption = "Data source: StatsBomb") +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        panel.background = element_blank())


  