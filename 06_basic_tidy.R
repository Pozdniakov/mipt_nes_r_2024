library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("-", "-99", "", "NA"))
powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

# Basic tidyverse ---------------------------------------------------------


heroes %>%
  slice(1:3)

heroes %>%
  slice(1, 100, 200:205)

heroes %>%
  filter(Publisher == "DC Comics" & Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics", Gender == "Female")

heroes %>%
  filter(Publisher == "DC Comics") %>%
  filter(Gender == "Female")

heroes %>%
  slice_max(Weight, n = 10)
heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_min(Weight, n = 10)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  drop_na()

heroes %>%
  drop_na(ends_with("eight"))

heroes %>%
  drop_na(Weight, Height)

heroes %>%
  arrange(Height)

heroes %>%
  arrange(desc(Height))

heroes %>%
  arrange(Race, Weight)

heroes %>%
  distinct(Gender)
heroes %>%
  distinct(Gender, Race)

unique(heroes$Race)

install.packages("janitor")
heroes %>%
  janitor::get_dupes(name)

#heroes$new_column <- heroes$Weight ^ 2

heroes %>%
  mutate(imt = Weight/(Height/100)^2)

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .before = name)

heroes %>%
  transmute(name, Publisher, imt = Weight/(Height/100)^2)

#heroes$Hairy <- ifelse(heroes$`Hair color` == "No Hair", "Bold", "Hairy")

if_else(heroes$`Hair color` == "No Hair", "Bold", "Hairy")
heroes %>%
  mutate(hair = if_else(`Hair color` == "No Hair", "Bold", "Hairy")) %>%
  select(name, `Hair color`, hair)

heroes %>%
  transmute(name, `Hair color`, hair = if_else(`Hair color` == "No Hair", "Bold", "Hairy")) 

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = first(Weight),
            tenth = nth(Weight, 10),
            last = last(Weight))

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = Weight[1],
            tenth = Weight[10],
            last = Weight[length(Weight)])
heroes %>%
  reframe(weight_range = range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE),
            first = first(Weight),
            tenth = nth(Weight, 10),
            last = last(Weight))

heroes %>%
  summarise(mean(Weight, na.rm = TRUE), .by = Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender)

heroes %>%
  count(Gender, Alignment)

table(heroes$Gender, heroes$Alignment) %>% summary()

heroes %>%
  count(Race, sort = TRUE)

heroes %>%
  group_by(Race) %>%
  filter(n() > 10) %>% View()

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight = mean(Weight, na.rm = TRUE))

heroes %>%
  janitor::get_dupes(name)

heroes %>%
  group_by(name) %>%
  slice(1) %>%
  ungroup()


# Advanced tidyverse ------------------------------------------------------

dc <- heroes %>%
  filter(Publisher == "DC Comics") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE))
dc

marvel <- heroes %>%
  filter(Publisher == "Marvel Comics") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE))
marvel

other_publishers <- heroes %>%
  filter(!(Publisher %in% c("DC Comics","Marvel Comics"))) %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Weight, na.rm = TRUE))
other_publishers

#cbind(), rbind()

bind_cols(dc, marvel, other_publishers)
bind_rows(dc, marvel, other_publishers)
df_list <- list(DC = dc, Marvel = marvel, Others = other_publishers)
df_list
bind_rows(df_list, .id = "Publisher")

#merge() -- base R and data.table

band_members
band_instruments

left_join(band_members, band_instruments)

band_members %>%
  left_join(band_instruments)
band_members %>%
  right_join(band_instruments)
band_instruments %>%
  left_join(band_members)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

band_members %>%
  semi_join(band_instruments)

band_members %>%
  filter(name %in% unique(band_instruments$name))

band_members %>%
  anti_join(band_instruments)

band_members %>%
  filter(!name %in% unique(band_instruments$name))

band_instruments %>%
  anti_join(band_members)

names(band_instruments)
names(band_members)
intersect(names(band_instruments), names(band_members))

band_members %>% 
  left_join(band_instruments, by = "name")

band_instruments2
band_members %>%
  left_join(band_instruments, by = c("name" = "artist"))
