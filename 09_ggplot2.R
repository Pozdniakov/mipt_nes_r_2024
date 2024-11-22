library(tidyverse)
rs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-05-07/rolling_stone.csv') %>%
  mutate(genre = if_else(genre == "Blues/Blues ROck",
                         "Blues/Blues Rock",
                         genre)) %>%
  mutate(peak_billboard_position = if_else(peak_billboard_position == 201, NA_real_, peak_billboard_position)) %>%
  mutate(artist_avg_year = artist_birth_year_sum / artist_member_count) %>%
  select(!artist_birth_year_sum)

ggplot() +
  geom_point(data = rs, aes(x = release_year,
                            y = spotify_popularity),
             alpha = .2, size = 4) +
  geom_smooth(data = rs, aes(x = release_year,
                             y = spotify_popularity))

ggplot(data = rs %>% drop_na(artist_gender), aes(x = release_year,
                      y = spotify_popularity)) +
  geom_point(aes(colour = spotify_popularity), alpha = .5,
             size = 4, shape = 20) +
  geom_smooth(method = "lm") +
  facet_wrap(~artist_gender, nrow = 3)

install.packages("wesanderson")
library(wesanderson)

pal_wes <- wes_palette(name = "Zissou1", n = 5)
class(pal_wes)
unclass(pal_wes)

rs %>% 
  drop_na(artist_gender, genre) %>%
  mutate(genre = genre %>%
           fct_reorder(artist_gender, .fun = function(x) mean(x == "Female", na.rm = TRUE)) %>%
           fct_lump(n = 8) %>%
           fct_rev()) %>% 
  ggplot() +
  geom_bar(aes(x = genre, fill = artist_gender), position = "fill") +
  coord_flip()

rs %>% 
  drop_na(artist_gender, genre) %>%
  mutate(genre = genre %>%
           fct_infreq() %>%
           fct_rev()) %>% 
  ggplot() +
  geom_bar(aes(x = genre, fill = artist_gender)) +
  coord_polar(theta = "y")

rs %>%
  drop_na(artist_gender) %>%
  count(artist_gender) %>%
  ggplot() +
  geom_col(aes(x = artist_gender, y = n))

rs %>%
  drop_na(artist_gender) %>%
  ggplot() +
  geom_boxplot(aes(x = artist_gender, y = spotify_popularity))

rs %>%
  drop_na(artist_gender) %>%
  ggplot() +
  geom_point(aes(x = artist_gender,
                 y = spotify_popularity),
             alpha = 0.2,
             size = 4,
             position = position_jitter(width = 0.15,
                                        height = 0))
  
rs %>%
  drop_na(artist_gender) %>%
  ggplot(aes(x = artist_gender, y = spotify_popularity)) +
  geom_point(alpha = 0.2,
             size = 4,
             position = position_jitter(width = 0.3,
                                        height = 0)) +
  geom_boxplot(outlier.colour = NA, width = .15, colour = "#7722AA",
               size = 1.2, alpha = .75) +
  theme_minimal()

rs %>%
  drop_na(artist_gender) %>%
  ggplot(aes(x = artist_gender, y = spotify_popularity)) +
  geom_violin(aes(fill = artist_gender)) +
  geom_boxplot(width = .15)

rs %>%
  drop_na(artist_gender) %>%
  ggplot() +
  geom_density(aes(x = spotify_popularity, fill = artist_gender), 
               adjust = .5,
               position = "identity",
               alpha = .5)

rs %>%
  drop_na() %>%
  ggplot() +
  geom_bar(aes(x = "", fill = artist_gender)) +
  coord_polar(theta = "y") +
  theme_void()

