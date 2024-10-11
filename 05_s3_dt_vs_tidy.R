
# S3 classes --------------------------------------------------------------



2
print(2)
print
methods(print)
print(iris)
class(iris)
methods(, "data.frame")
iris[1, 2]
`[`(iris, 1, 2)

summary(1:10)
summary(iris)
some_model <- lm(Sepal.Length ~ Sepal.Width, data = iris)
summary(some_model)

plot(1:10, 1:10)
plot(iris)

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-", "-99", "", "NA"))

superman <- as.list(heroes[heroes$name == "Superman", ])
attr(superman, "class") <- "superhero"
superman

superman <- as.list(heroes[heroes$name == "Superman", ])
class(superman) <- "superhero"
superman
print.superhero <- function(x) {
  cat("____|", x$name, "|____",
      "\nPublisher:", x$Publisher,
      "\nRace:", x$Race,
      "\nGender:", x$Gender)
}
superman

library(glue)
heroes$info <- glue("{heroes$name} is {heroes$Gender} {heroes$Race};
                    {heroes$Weight}kg, {heroes$Height}cm;
                    {heroes$Eye.color} eyes, {heroes$Hair.color} hair, {heroes$Skin.color} skin",
                    .na = "unknown")

summary.superhero <- function(x) {
  cat(glue("{x$name} is {x$Gender} {x$Race};
            {x$Weight}kg, {x$Height}cm;
            {x$Eye.color} eyes, {x$Hair.color} hair, {x$Skin.color} skin",
           .na = "unknown"))
}
summary(superman)
tt <- t.test(rnorm(30), rnorm(30))
str(tt)
unclass(tt)

library(rdracor)
revizor <- get_net_cooccur_igraph("gogol-revizor", "rus")
plot(revizor)
class(revizor)
summary(revizor)
igraph::betweenness(revizor)
str(tt)
fac <- factor(1:10)
attributes(fac)
str(fac)
unclass(fac)


# data.table! --------------------------------------------------------------

?aggregate

library(data.table)
heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
      na = c("-", "-99", "", "NA"))
class(heroes_dt)
nrow(heroes_dt)
heroes_dt[Alignment == "good",
          .(weight_mean = mean(Height, na.rm = TRUE)),
          by = Gender][
            order(-weight_mean)]

# tidyverse! --------------------------------------------------------------

#install.packages("tidyverse")

library(tidyverse)
class(heroes_tbl)
heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
         na = c("-", "-99", "", "NA"))

heroes_tbl

heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(weight_mean = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(weight_mean))


# pipes -------------------------------------------------------------------

sum(sqrt(abs(sin(1:22))))
1:22 %>%
  sin() %>% 
  abs() %>% 
  sqrt() %>% 
  sum()

1:22 %>%
  log(x = 22:1, base = .)

1:22 |>
  sin() |>
  abs() |>
  sqrt() |>
  sum()

1:22 |>
  log(x = 22:1, base = _)


c("Корень из", 2, "равен", sqrt(2))

2 %>%
  c("Корень из", ., "равен", sqrt(.))

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)

10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                       na = c("-", "-99", "", "NA"))
heroes %>%
  map(class) %>%
  map(nchar)

heroes %>%
  select(2, 5)

?select
select(heroes, 2, 5)
heroes_selected_columns <- heroes %>%
  select(name, Race, Publisher, `Hair color`)
heroes_selected_columns

heroes %>%
  select(name:Publisher)
heroes %>%
  select(name:`Eye color`, Publisher:Weight)
heroes %>%
  select(!...1)

heroes %>%
  select(!(Gender:Height))

heroes %>%
  select(name:last_col())

heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))
heroes %>%
  select(starts_with("H") & ends_with("color"))
heroes %>%
  select(contains("eigh"))
heroes %>%
  select(where(is.numeric))
heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x) !any(is.na(x))))


heroes %>%
  select(where(function(x) mean(is.na(x)) < .5))

heroes %>%
  select(id = ...1, superhero = name)

heroes %>%
  rename(id = ...1, superhero = name)

make.names(c("123", "Hair color"))
heroes %>%
  rename_with(make.names)
heroes %>%
  rename_with(tolower)
heroes %>%
  rename_with(toupper)

heroes %>%
  relocate(Universe = Publisher, where(is.numeric), .after = name)

heroes %>%
  select(name)

iris[, "Species"]
B[2,, drop = FALSE]
#`[`(B, 2, , drop = FALSE)

heroes %>%
  select(name) %>%
  pull()
heroes %>%
  pull(name)
heroes %>%
  pull(Weight, name)
