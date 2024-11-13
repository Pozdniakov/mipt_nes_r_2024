library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", "", "NA"))


# tidy recap --------------------------------------------------------------

heroes %>%
  select(Height:Publisher)

heroes %>%
  filter(Height > 200)

heroes %>%
  filter(!Gender == "Female" & Publisher == "DC Comics")

heroes %>%
  drop_na(Gender)

heroes %>%
  arrange(desc(Weight))

heroes %>%
  mutate(Weight = if_else(Weight < 20, NA, Weight) ) %>% View()

heroes %>%
  mutate(Gender_corrected = if_else(is.na(Gender), "Non-binary", Gender),
         .after = Gender) %>% View()

#table(heroes$Race) %>% sort()
heroes %>%
  count(Race, sort = TRUE)

heroes %>%
  summarise(mean(Weight, na.rm = TRUE), .by = Gender)

heroes %>%
  group_by(`Eye color`) %>%
  filter(n() == 1)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight_gender = mean(Weight, na.rm = TRUE)) %>%
  ungroup()

band_members
band_instruments
#rbind(band_members, band_instruments)
bind_rows(list(members = band_members, instruments = band_instruments), .id = "origin")
bind_cols(list(members = band_members, instruments = band_instruments))

full_join(band_members, band_instruments)
left_join(band_members, band_instruments)


# wide and long data ------------------------------------------------------

new_diet <- tibble(
  student = c("Маша", "Рома", "Антонина"),
  before_r_course = c(70, 80, 86),
  after_r_course = c(63, 74, 71)
)
new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight") %>%
  pivot_wider(names_from = time,
              values_from = weight)

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

# across() – working with multiple columns --------------------------------


heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(height_mean = mean(Height),
            weight_mean = mean(Weight))

heroes %>%
  map(typeof)

heroes %>%
  #drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), mean, na.rm = TRUE) )

heroes %>%
  #drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(ends_with("eight"), function(x) mean(x, na.rm = TRUE)) )

mean(nchar(c("hey", "ho")))
heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), function(x) mean(x, na.rm = TRUE)),
    across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE)))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight),
                   list(minimum = min,
                        average = mean,
                        maximum = max)))

heroes %>%
  mutate(across(where(is.character), as.factor))

iris %>%
  as_tibble() %>%
  mutate(across(where(is.numeric), function(x) (x - mean(x))/sd(x) ))


iris %>%
  as_tibble() %>%
  mutate(across(where(is.numeric), function(x) round((x/max(x)) * 100)  )) %>% View()

na_n <- function(x) sum(is.na(x))
na_n(c(NA, 1, NA))
?n_distinct
heroes %>%
  group_by(Alignment, Gender) %>%
  summarise(across(ends_with("color"), n_distinct))

# nested columns ----------------------------------------------------------


is.vector(list())
is.atomic(list())

heroes_nested <- heroes %>%
  nest(!Gender)

bind_rows(heroes_nested$data)

heroes %>%
  group_by(Gender) %>%
  nest() %>%
  ungroup()

heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest(dim)

heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest_wider(dim, names_sep = "_")

films <- tribble(
  ~film, ~genres,
  "Batman 2022", "detective, drama, action, criminal",
  "The Godfather", "drama, criminal, action",
  "Блондинка в законе", "comedy, melodrama"
)

films %>%
  filter(str_detect(genres, "action") )

str_split(films$genres, pattern = ", ")

films %>%
  mutate(genres = str_split(genres, pattern = ", ")) %>%
  unnest(genres) %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres,
              values_from = value,
              values_fill = FALSE)

films %>%
  separate_rows(genres, sep = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres,
              values_from = value,
              values_fill = FALSE)

heroes %>%
  group_by(Gender) %>%
  mutate(across(c(Height, Weight), 
                function(x) if_else(x > mean(x, na.rm = TRUE),
                                    paste("выше среднего по", Gender),
                                    paste("ниже среднего по", Gender)) )) %>% View()
