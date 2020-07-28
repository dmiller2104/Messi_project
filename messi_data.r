## libraries

library(ggplot2)
library(dplyr)
library(tidyverse)
library(StatsBombR)
library(FC.rSTATS)
library(soccermatics)
library(ggsoccer)
library(SBpitch)
library(formattable)
library(RColorBrewer)
library(png)
library(ggrepel)
library(extrafont)
font_import()
loadfonts(device = "win")
# fonts() to check fonts available

## get logo ##
img <- grid::rasterGrob(png::readPNG("statsbomb_logo.png"), interpolate = TRUE)

ggplot() + annotation_custom(img, xmin = 0.5, xmax = 0.9, ymin = -0.5, ymax = 1)

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

## opposing data ##

goal_opposition_06_07 <- get.opposingteam(la_liga_06_07) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_06_07$season <- "06/07"

appearances_06_07 <- goal_opposition_06_07 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


##


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

## opposing data ##

goal_opposition_07_08 <- get.opposingteam(la_liga_07_08) %>% filter(team.name == "Barcelona") %>%
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_07_08$season <- "07/08"

appearances_07_08 <- goal_opposition_07_08 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


##

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

## opposing data ##

goal_opposition_08_09 <- get.opposingteam(la_liga_08_09) %>% filter(team.name == "Barcelona") %>%
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_08_09$season <- "08/09"

appearances_08_09 <- goal_opposition_08_09 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


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

## opposing data ##

goal_opposition_09_10 <- get.opposingteam(la_liga_09_10) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>%  
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_09_10$season <- "09/10"

appearances_09_10 <- goal_opposition_09_10 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


##

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

## opposing data ##

goal_opposition_10_11 <- get.opposingteam(la_liga_10_11) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_10_11$season <- "10/11"

appearances_10_11 <- goal_opposition_10_11 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


##

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

## opposing data ##

goal_opposition_11_12 <- get.opposingteam(la_liga_11_12) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>%
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_11_12$season <- "11/12"

appearances_11_12 <- goal_opposition_11_12 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))


##

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

## opposing data ##

goal_opposition_12_13 <- get.opposingteam(la_liga_12_13) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>%  
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_12_13$season <- "12/13"

appearances_12_13 <- goal_opposition_12_13 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_13_14 <- get.opposingteam(la_liga_13_14) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>%  
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_13_14$season <- "13/14"

appearances_13_14 <- goal_opposition_13_14 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_14_15 <- get.opposingteam(la_liga_14_15) %>% filter(team.name == "Barcelona") %>% 
                            filter(player.id == 5503) %>% 
                            select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                   shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                   OpposingTeam)
goal_opposition_14_15$season <- "14/15"

appearances_14_15 <- goal_opposition_14_15 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_15_16 <- get.opposingteam(la_liga_15_16) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_15_16$season <- "15/16"

appearances_15_16 <- goal_opposition_15_16 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_16_17 <- get.opposingteam(la_liga_16_17) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>%
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_16_17$season <- "16/17"

appearances_16_17 <- goal_opposition_16_17 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_17_18 <- get.opposingteam(la_liga_17_18) %>% filter(team.name == "Barcelona") %>%
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_17_18$season <- "17/18"

appearances_17_18 <- goal_opposition_17_18 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

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

## opposing data ##

goal_opposition_18_19 <- get.opposingteam(la_liga_18_19) %>% filter(team.name == "Barcelona") %>% 
                          filter(player.id == 5503) %>% 
                          select(match_id, team.name, minute, type.name, possession, shot.outcome.name,shot.end_location, shot.type.name, shot.body_part.name, location.x, location.y,
                                 shot.end_location.x, shot.end_location.y, shot.end_location.z, shot.statsbomb_xg,
                                 OpposingTeam)
goal_opposition_18_19$season <- "18/19"

appearances_18_19 <- goal_opposition_18_19 %>% group_by(OpposingTeam) %>% summarise(appearances = n_distinct(match_id))

##

## rowbind to get all season together

all_seasons <- rbind(barca_06_07, barca_07_08, barca_08_09, barca_09_10, barca_10_11,
      barca_11_12, barca_12_13, barca_13_14, barca_14_15, barca_15_16,
      barca_16_17, barca_17_18, barca_18_19)

all_seasons <- drop_na(all_seasons)
all_seasons$goal_contributions <- all_seasons$goals + all_seasons$assists

## top two goal contributors in each season

goal_contributors_06_07 <- all_seasons %>% filter(season == "06/07") %>% arrange(desc(goal_contributions))
goal_contributors_06_07[2,] <- goal_contributors_06_07[3,] ## eto is actually second
goal_contributors_06_07 <- goal_contributors_06_07[c(1,2),]

goal_contributors_07_08 <- all_seasons %>% filter(season == "07/08") %>% arrange(desc(goal_contributions))
goal_contributors_07_08 <- goal_contributors_07_08[c(1,2),]

goal_contributors_08_09 <- all_seasons %>% filter(season == "08/09") %>% arrange(desc(goal_contributions))
goal_contributors_08_09 <- goal_contributors_08_09[c(1,2),]

goal_contributors_09_10 <- all_seasons %>% filter(season == "09/10") %>% arrange(desc(goal_contributions))
goal_contributors_09_10 <- goal_contributors_09_10[c(1,2),]

goal_contributors_10_11 <- all_seasons %>% filter(season == "10/11") %>% arrange(desc(goal_contributions))
goal_contributors_10_11 <- goal_contributors_10_11[c(1,2),]

goal_contributors_11_12 <- all_seasons %>% filter(season == "11/12") %>% arrange(desc(goal_contributions))
goal_contributors_11_12 <- goal_contributors_11_12[c(1,2),]

goal_contributors_12_13 <- all_seasons %>% filter(season == "12/13") %>% arrange(desc(goal_contributions))
goal_contributors_12_13 <- goal_contributors_12_13[c(1,2),]

goal_contributors_13_14 <- all_seasons %>% filter(season == "13/14") %>% arrange(desc(goal_contributions))
goal_contributors_13_14 <- goal_contributors_13_14[c(1,2),]

goal_contributors_14_15 <- all_seasons %>% filter(season == "14/15") %>% arrange(desc(goal_contributions))
goal_contributors_14_15 <- goal_contributors_14_15[c(1,2),]

goal_contributors_15_16 <- all_seasons %>% filter(season == "15/16") %>% arrange(desc(goal_contributions))
goal_contributors_15_16 <- goal_contributors_15_16[c(1,2),]

goal_contributors_16_17 <- all_seasons %>% filter(season == "16/17") %>% arrange(desc(goal_contributions))
goal_contributors_16_17 <- goal_contributors_16_17[c(1,2),]

goal_contributors_17_18 <- all_seasons %>% filter(season == "17/18") %>% arrange(desc(goal_contributions))
goal_contributors_17_18 <- goal_contributors_17_18[c(1,2),]

goal_contributors_18_19 <- all_seasons %>% filter(season == "18/19") %>% arrange(desc(goal_contributions))
goal_contributors_18_19 <- goal_contributors_18_19[c(1,2),]

all_goal_contributors <- rbind(goal_contributors_06_07, goal_contributors_07_08, goal_contributors_08_09, goal_contributors_09_10, goal_contributors_10_11,
                               goal_contributors_11_12, goal_contributors_12_13, goal_contributors_13_14, goal_contributors_14_15, goal_contributors_15_16,
                               goal_contributors_16_17, goal_contributors_17_18, goal_contributors_18_19)

all_goal_contributors$messnotmessi <- ifelse(all_goal_contributors$player.id == 5503, 0, 1)
easy_names <- c("Ronaldinho","Lionel Messi","Lionel Messi","Thierry Henry","Lionel Messi","Samuel Eto'o","Lionel Messi","Zlatan Ibrahimovic",
                "Lionel Messi","David Villa","Lionel Messi","Cesc Fabregas","Lionel Messi","Cesc Fabregas","Lionel Messi","Alexis Sanchez","Lionel Messi",
                "Neymar","Luis Suarez", "Lionel Messi","Lionel Messi","Luis Suarez","Lionel Messi","Luis Suarez","Lionel Messi","Luis Suarez")

all_goal_contributors$easy_names <- easy_names

# messi vs barcelona

# as a residual plot

goal_contribs_plot <- ggplot(all_goal_contributors, aes(x = season, y = goal_contributions)) +
  geom_point(data = all_goal_contributors %>% filter(messnotmessi == 1),colour = "#DC143c",size = 2.6) + 
  geom_point(data = all_goal_contributors %>% filter(messnotmessi == 0),colour = "#0000CD",size = 2.6) + 
  geom_line(size = 1, linetype = "dashed", colour = "#996699") +
  xlab("Season") +
  ylab("Goal contributions") +
  labs(title = "The rise and continued reliability on Messi",
       subtitle = "In 11 out of 13 full seasons Messi has been Barca's chief provider in goal contributions (goals & assists).\nIn the 11/12 season had nearly 50 goal contributions more than the next player",
       caption = "Data source") +
  coord_cartesian(ylim = c(16,65), clip = "off") +
  annotation_custom(img, xmin = 9, xmax = 13.5, ymin = 0, ymax = 13) +
  geom_text_repel(aes(label = ifelse(easy_names != "Lionel Messi",paste(easy_names," (",goals,",",assists,")"),"")), size = 3, family = 'Segoe UI Light', colour = 'Black', vjust = 1, hjust = 0.5) +
  geom_text_repel(aes(label = ifelse(easy_names == "Lionel Messi",paste("(",goals,",",assists,")"),"")), size = 3, family = 'Segoe UI Light', colour = 'Black', vjust = -2, hjust = 0) +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        plot.title = element_text(face = "bold"),
        plot.caption = element_text(hjust = .74, vjust = 8.5),
        panel.background = element_blank(),
        axis.line.x = element_line(color = "black", size = 0.5),
        axis.line.y = element_line(color = "black", size = 0.5),
        legend.direction = "horizontal",
        legend.position = "bottom") 

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
  scale_size(range = c(.1,12)) +
  geom_text_repel(aes(label = season), size = 3.5) + 
  scale_colour_gradient(low = "blue", high = "red") + 
  labs(title = "Messi: A supernatural finisher and a club dependent", 
       subtitle = "In median terms, Messi has his outscored expected goals total per season by 32%, and has also\naccounted for 37% of his team's goals",
       caption = "Data source",
       size = "% of team goals",
       colour = "Goals") +
       xlab("Goals") +
       ylab("Expected goals")+
  coord_cartesian(ylim = c(0,50), clip = "off") +
  annotation_custom(img, xmin = 40, xmax = 52, ymin = -10, ymax = -36) +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        plot.caption = element_text(hjust = .82, vjust = 8.5),
        panel.background = element_blank(),
        axis.line.x = element_line(color = "black", size = 0.5),
        axis.line.y = element_line(color = "black", size = 0.5),
        legend.direction = "horizontal",
        legend.position = "bottom") 

## barplot showing goals per 90 over seasons

goals_per_90_plot <- ggplot(messi_seasons, aes(x = season, y = goals_per_90, fill = season)) + 
  geom_bar(stat = "identity", show.legend = FALSE) +
  scale_fill_manual(values = rep(c("#DC143C","#0000CD"), ceiling(length(messi_seasons$season)/2))[1:length(messi_seasons$season)]) +
  scale_x_discrete(limits = rev(messi_seasons$season)) +
  ylab("Goals per 90 minutes") +
  xlab("Season") +
  coord_cartesian(ylim = c(0,50), clip = "off") +
  scale_y_continuous(expand = c(0,0)) +
  coord_flip() +
  labs(title = "Back of the net, time and again",
      subtitle = "Messi has been averaging nearly a goal a game, and in some cases more (Seasons 09/10, 11/12, 14/15, 16/17, 18/19)",
       caption = "Data source: StatsBomb") +
  theme(text=element_text(size = 10.5, family = "Segoe UI Light"),
        panel.background = element_blank())

## stacked barchart goals by type 

a <- messi_seasons %>% pivot_longer(cols = left_footed_goals:penalty_goals)

goal_by_type <- ggplot(a[order(a$value, decreasing = T),],
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
  coord_cartesian(ylim = c(0,50), clip = "off") +
  annotation_custom(img, xmin = 8.5, xmax = 13.5, ymin = 0, ymax = -18) +
  labs(title = "Dont let him get on his left foot!",
       subtitle = "It comes as no surprise that most of Messi's goals come from his left foot, but we can also see an increasing\nnumber of free kicks making up his seasons tallies",
       caption = "Data source") +
  theme(text=element_text(size = 11, family = "Segoe UI Light"),
        plot.title = element_text(face = "bold"),
        plot.caption = element_text(vjust = 8.25, hjust = 0.71),
        panel.background = element_blank())


## favourite opposition - scored against

goal_opposition_data <- rbind(goal_opposition_06_07, goal_opposition_07_08, goal_opposition_08_09, goal_opposition_09_10, 
                              goal_opposition_10_11, goal_opposition_11_12, goal_opposition_12_13, goal_opposition_13_14,
                              goal_opposition_14_15, goal_opposition_15_16, goal_opposition_16_17, goal_opposition_17_18,
                              goal_opposition_18_19)

goal_opposition_data <- goal_opposition_data %>% filter(shot.outcome.name == "Goal")

teams <- rbind(appearances_06_07, appearances_07_08, appearances_08_09, appearances_09_10, appearances_10_11, appearances_11_12,
      appearances_12_13, appearances_12_13, appearances_13_14, appearances_14_15, appearances_15_16, appearances_16_17,
      appearances_17_18, appearances_18_19)

teams <- unique(teams$OpposingTeam)
teams <- data.frame(teams)
colnames(teams)[1] <- "OpposingTeam"
teams <- left_join(teams,appearances_06_07, by = "OpposingTeam")
teams <- left_join(teams,appearances_07_08, by = "OpposingTeam")
teams <- left_join(teams,appearances_08_09, by = "OpposingTeam")
teams <- left_join(teams,appearances_09_10, by = "OpposingTeam")
teams <- left_join(teams,appearances_10_11, by = "OpposingTeam")
teams <- left_join(teams,appearances_11_12, by = "OpposingTeam")
teams <- left_join(teams,appearances_12_13, by = "OpposingTeam")
teams <- left_join(teams,appearances_13_14, by = "OpposingTeam")
teams <- left_join(teams,appearances_14_15, by = "OpposingTeam")
teams <- left_join(teams,appearances_15_16, by = "OpposingTeam")
teams <- left_join(teams,appearances_16_17, by = "OpposingTeam")
teams <- left_join(teams,appearances_17_18, by = "OpposingTeam")
teams <- left_join(teams,appearances_18_19, by = "OpposingTeam")
messi_apperances <- rowSums(teams[,-1],na.rm = TRUE)
messi_apperances <- data.frame(messi_apperances)
teams <- unique(teams$OpposingTeam)
teams <- data.frame(teams)
colnames(teams)[1] <- "OpposingTeam"
teams$messi_apperances <- messi_apperances

goal_opposition_data <- drop_na(goal_opposition_data)
## increasing minute value by 1, to be in keeping with traditional football records
goal_opposition_data$minute <- goal_opposition_data$minute+1

goal_tally <- goal_opposition_data %>% group_by(OpposingTeam) %>% tally()
goal_tally <- rename(goal_tally, Goals = n)
goal_tally <- left_join(goal_tally, teams, by = "OpposingTeam")


## bubble plot of favourite opposition # minimum games 4

goals_against_teams <- ggplot(goal_tally %>% filter(messi_apperances >=4), aes(x = OpposingTeam, y = Goals, size = Goals, color = Goals)) + 
  geom_point(alpha = 0.85) +
  scale_size(range = c(.1,16), guide = "none") +
  scale_colour_gradient(low = "blue", high = "red") +
  xlab("Teams in alphabetical order") +
  ylab("Goals") +
  labs(title = "The man for all occassions (minmum of four appearances per team)",
       subtitle = "Messi's goals against teams doesn't fluctutae too much depending on quality. In particular, Messi's record\nagainst Sevilla is quite remarkable scoring, on average, just under two and a half goals a season against\nthem over 13 seaons",
       caption = "Data source") +
  geom_text_repel(aes(label = ifelse(Goals > 14 ,paste(OpposingTeam,"(",Goals,")"),'')), size = 4, family = 'Segoe UI Light', colour = 'Black', vjust = 1, hjust = 0) +
  coord_cartesian(ylim = c(0,30), clip = "off") +
  annotation_custom(img, xmin = 20, xmax = 32, ymin = 0, ymax = -8) +
  theme(text=element_text(size = 12, family = "Ebrima", colour = '#333366'),
       panel.background = element_blank(),
       plot.title = element_text(face = "bold"),
       plot.subtitle = element_text(family = "Segoe UI Light", colour = '#003366'),
       plot.caption = element_text(hjust = 0.78, vjust = 10, colour = '#333399'),
       axis.text.x = element_blank(),
       axis.ticks.x = element_blank(),
       axis.line.x = element_line(color = "black", size = 0.5),
       axis.line.y = element_line(color = "black", size = 0.5))

## not to be published #####################

## goals by the minute
goals_by_the_minute <- goal_opposition_data %>% filter(minute<90) %>% group_by(minute) %>% tally()
goals_by_the_minute <- rename(goals_by_the_minute, Goals = n)

post_90_goals <- goal_opposition_data %>% filter(minute>89) %>% tally()
post_90_goals <- data.frame(90,post_90_goals)
colnames(post_90_goals)[1] <- "minute"

temp_df <- data.frame(seq(min(goals_by_the_minute),90))
colnames(temp_df)[1] <- "minute"

goals_by_the_minute <- left_join(temp_df,goals_by_the_minute)
goals_by_the_minute[90,2] <- post_90_goals[2]
goals_cleaned <- ifelse(is.na(goals_by_the_minute$Goals),0,goals_by_the_minute$Goals)
goals_by_the_minute$Goals <- goals_cleaned

# plot
ggplot(goals_by_the_minute ,aes(x = minute, y = Goals, fill = Goals)) +
  geom_bar(stat = "identity") +
  scale_fill_gradient(low = "blue", high = "red") +
#  geom_vline(xintercept = 45, linetype = 'dashed', color = 'orange', size = 1.5) +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  labs(title = "Messi's goals by the minute",
       subtitle = "This is based on regulation time. Goals in the 90th, or after, are grouped together") +
  geom_text_repel(aes(label = ifelse(Goals == 0 ,minute,'')), family = 'Segoe UI Light', colour = 'Black', nudge_y = 10) +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        panel.background = element_blank(),
        #plot.title = element_text(face = "bold"),
        #plot.caption = element_text(hjust = 0.78, vjust = 9),
        axis.line.x = element_line(color = "black", size = 0.5),
        axis.line.y = element_line(color = "black", size = 0.5))

view(goal_opposition_data %>% filter(minute > 89))

##


## goal map  ######

create_Pitch(background_colour = "white", grass_colour = "white", goal_colour = "white", line_colour = "dark blue", goaltype = "box", BasicFeatures = FALSE) +
  geom_segment(data = goal_opposition_data %>% filter(season == "18/19"), aes(x = location.x, y = location.y,
                      xend = shot.end_location.x, yend = shot.end_location.y, colour = shot.statsbomb_xg), size = 1.2) +
  scale_colour_gradient(low = "#0066Cc", high = "#FF0033") +
  geom_point(data = goal_opposition_data %>% filter(season == "18/19"), aes(x = location.x, y = location.y, fill = shot.body_part.name), colour ="black", shape = 21, size = 3.5) +
  scale_fill_manual(values = c("white","#0000CD","green","#DC143C")) +
  labs(fill = "Goal method", colour ="Statsbomb XG") +
  coord_flip(xlim = c(75,125),ylim = c(-5,85))+
  scale_y_reverse() +
  guides(fill = guide_legend(order=2),
         colour = guide_colourbar(order=1))+
  labs(title = "Messi does not care for XG",
       subtitle = "Messi's 18/19 season goal map - a season",
       caption = "Data source") +
  annotation_custom(img, xmin = 60, xmax = 90, ymin = -50, ymax = -75) +
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        plot.title = element_text(hjust = 0.05, vjust = -2, size = 26, face = "bold", colour = "#333399"),
        plot.subtitle = element_text(hjust = 0.04, vjust = -6, size = 14, face = "bold", colour = "#990000"),
        plot.caption = element_text(hjust = 0.69, vjust = 15, size = 12),
        plot.margin = unit(c(0,0,1.5,0),"cm"),
        legend.direction = "horizontal",
        legend.position = c(0.35,0))


## heat map of goals

create_Pitch(background_colour = "#7Fc47f", grass_colour = "#7Fc47f", goal_colour = "white", line_colour = "white", goaltype = "box", BasicFeatures = FALSE) +
  stat_density_2d(data = goal_opposition_data, aes(x = location.x, y = location.y, fill = ..level..), geom = "polygon", alpha = 0.8) +
  scale_fill_gradient(low = "#FFFFCC", high = "#CC0033") +
  coord_flip(xlim = c(75,125),ylim = c(-5,85))+
  scale_y_reverse() + 
  theme(text=element_text(size = 12, family = "Segoe UI Light"),
        plot.title = element_text(hjust = 0.05, vjust = -2, size = 26, face = "bold", colour = "#333399"),
        plot.subtitle = element_text(hjust = 0.04, vjust = -6, size = 14, face = "bold", colour = "#990000"),
        plot.caption = element_text(hjust = 0.69, vjust = 15, size = 12),
        #plot.margin = unit(c(0,0,1.5,0),"cm"),
        legend.position = "none")
  
## test shot maps

soccerShotmap(goal_opposition_data, lengthPitch = 120, widthPitch = 80, theme = "dark") 

p <- soccerPitch(120, 80, theme = "blank") +
  geom_bin2d(data = goal_opposition_data ,aes(x = location.x, y = location.y), bins = 12, binwidth = c(diff(x.range)[1], diff(y.range)[1])) +
  scale_fill_gradient(low = "#FFFFCC", high = "#CC0033") +
  scale_y_reverse() +
  guides(fill = F) 

soccerPitchFG(p, 120, 80) +
  coord_flip(xlim = c(75,125),
             ylim = c(-5, 85)) +
  labs(title = "No where is safe",
       subtitle = "Messi's goal heat map for 412 La Liga goals",
       caption = "Data source") +
  annotation_custom(img, xmin = 50, xmax = 100, ymin = -30, ymax = -79) +
  theme(text=element_text(size = 12, family = "Ebrima", colour = '#333366'),
        plot.title = element_text(hjust = 0.05, vjust = -2, size = 26, face = "bold", colour = "#333399"),
        plot.subtitle = element_text(hjust = 0.06, vjust = -6, size = 14, face = "bold", colour = "#990000"),
        plot.caption = element_text(hjust = 0.48, vjust = 18, size = 12),
        plot.margin = unit(c(0,0,1.5,0),"cm"),
        legend.direction = "horizontal")

p2 <- soccerPitch(120, 80, theme = "blank") +
  stat_density_2d(data = goal_opposition_data, aes(x = location.x, y = location.y, fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_gradient(low = "white", high = "red") +
  guides(fill = F)

soccerPitchFG(p2, 120, 80) +
  coord_flip(xlim = c(75,125),
             ylim = c(-5, 85))

## credit to the soccermatics team for the below. I was experiencing an issue with their heat map and fitting it to statsbomb data

Bin_x <- 12
Bin_y <- 12

df <- goal_opposition_data[goal_opposition_data$location.x > 0 & goal_opposition_data$location.x < 120 & 
           goal_opposition_data$location.y > 0 & goal_opposition_data$location.y < 80,]

x.range <- seq(0, 120, length.out = Bin_x +1)
y.range <- seq(0, 80, length.out = Bin_y +1)

## poisson distribution of lionel messi goals

recent_seasons <- messi_seasons %>% group_by(season) %>% 
  select(minutes, nineties, goals, goals_per_90) %>% filter(season == "16/17" | season == "17/18" | season == "18/19") %>% group_by(minutes)

recent_seasons$goal_odds <- recent_seasons$goals_per_90 / 90

predict1 <- list()
predict2 <- list()
predict3 <- list()

golaso <- 0
golaso2 <- 0
golaso3 <- 0
rand_n <- 0

for (n in 1:500){
  golaso <- 0
  golaso2 <- 0
  golaso3 <- 0
  for (i in 1:38){
    for (j in 1:90){
      rand_n <- runif(1, min = 0, max = 1)
      
      if (rand_n <= recent_seasons$goal_odds[1]){
        golaso <- golaso + 1
      }
      if (rand_n <= recent_seasons$goal_odds[2]){
        golaso2 <- golaso2 + 1
      }
      if (rand_n <= recent_seasons$goal_odds[3]){
        golaso3 <- golaso3 + 1
      }
    }
  }
  predict1[[n]] <- golaso
  predict2[[n]] <- golaso2
  predict3[[n]] <- golaso3
}

df_predict1 <- data.frame(matrix(unlist(predict1), nrow = length(predict1), byrow = T))
df_predict2 <- data.frame(matrix(unlist(predict2), nrow = length(predict2), byrow = T))
df_predict3 <- data.frame(matrix(unlist(predict3), nrow = length(predict3), byrow = T))

ggplot(df_predict1, aes(x=matrix.unlist.predict1...nrow...length.predict1...byrow...T.)) +
  geom_bar()

ggplot(df_predict2, aes(x=matrix.unlist.predict2...nrow...length.predict2...byrow...T.)) +
  geom_bar()

ggplot(df_predict3, aes(x=matrix.unlist.predict3...nrow...length.predict3...byrow...T.)) +
  geom_bar()
