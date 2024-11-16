library(tidyverse)


# EDA ---------------------------------------------------------------------


rs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-05-07/rolling_stone.csv') %>%
  mutate(genre = if_else(genre == "Blues/Blues ROck",
                         "Blues/Blues Rock",
                         genre)) %>%
  mutate(peak_billboard_position = if_else(peak_billboard_position == 201, NA_real_, peak_billboard_position)) %>%
  mutate(artist_avg_year = artist_birth_year_sum / artist_member_count) %>%
  select(!artist_birth_year_sum)


rs %>%
  arrange(rank_2003)

rs %>%
  select(clean_name, genre, release_year)

rs %>%
  count(genre, sort = TRUE)

rs %>% 
  separate_rows(genre, sep = "/") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = "genre", values_from = "value", values_fill = FALSE) %>% View()

rs %>%
  count(type, sort = TRUE)

rs %>%
  filter(type == "Compilation") %>% View()

rs %>%
  filter(type == "Greatest Hits") %>% View()

#install.packages("skimr")
rs %>%
  skimr::skim()

hist(rs$release_year, breaks = 100)
hist(rs$weeks_on_billboard, breaks = 100)
rs %>%
  count(weeks_on_billboard)

iris %>%
  select(!Species) %>%
  plot()

rs %>%
  select(starts_with("rank_")) %>%
  plot()

rs %>%
  select(starts_with("rank_")) %>%
  cor(use = "pairwise.complete.obs")

cor.test(rs$rank_2012, rs$rank_2020)

rs %>%
  count(weeks_on_billboard) %>%
  ggplot(aes(x = weeks_on_billboard, y = n)) +
  geom_line() +
  geom_smooth() +
  coord_cartesian(ylim = c(0, 15))

hist(rs$peak_billboard_position)

rs %>%
  filter(peak_billboard_position > 200) %>% View()

skimr::skim(rs)

rs %>%
  mutate(peak_billboard_position = if_else(peak_billboard_position == 201, NA_real_, peak_billboard_position))

hist(rs$artist_member_count)

rs %>%
  mutate(artist_avg_year = artist_birth_year_sum / artist_member_count)

rs %>%
  group_by(artist_gender) %>%
  summarise(n = n(),
            mean_rank_2012 = mean(rank_2012, na.rm = TRUE),
            mean_rank_2020 = mean(rank_2020, na.rm = TRUE))

rs %>%
  filter(is.na(artist_gender)) %>% View()

rs %>%
  mutate(rank_diff = rank_2012 - rank_2003, .before = rank_2003) %>%
  arrange(rank_diff) %>% View()

rs %>%
  arrange(nchar(clean_name))

# Ответы на вопросы про тест ----------------------------------------------


named_atomic <- c(first = 1, second = 2, third = 3)

named_atomic["third"]

rs %>%
  pull(rank_2003, album)


# ggplot2 -----------------------------------------------------------------


ggplot() +
  geom_point(data = rs, aes(x = release_year,
                            y = spotify_popularity),
             alpha = .2, size = 4) +
  geom_smooth(data = rs, aes(x = release_year,
                             y = spotify_popularity))
