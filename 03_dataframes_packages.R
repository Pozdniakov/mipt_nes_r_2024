
# Dataframes --------------------------------------------------------------


list_of_people <- list(name = c("Veronika", "Egor", "Oleg", "Tania", "Kristina"),
     age = 20:24,
     student = c(TRUE, FALSE, FALSE, TRUE, FALSE))

str(list_of_people)

df_of_people <- data.frame(name = c("Veronika", "Egor", 
                                      "Oleg", "Tania", "Kristina"),
                        age = 20:24,
                        student = c(TRUE, FALSE, FALSE, TRUE, FALSE))
str(df_of_people)
df_of_people

df_of_people$age
df_of_people$age[2:3]
df_of_people$loves_R <- TRUE
df_of_people
df_of_people[3:5, 1:2]
df_of_people[df_of_people$age > 21, c("name", "age")]
df_of_people[df_of_people$age > mean(df_of_people$age), "name"]
df_of_people$name[df_of_people$age > mean(df_of_people$age)]

mean(mtcars$cyl == 4)


# Packages ----------------------------------------------------------------

#install.packages("beepr")
library(beepr)
#library("beepr")
beep()
?beep
beep(9)

beepr::beep(5)
beep()

install.packages("devtools")
devtools::install_github("dracor-org/rdracor")

library(rdracor)
get_dracor_api_url()
emilia <- get_net_cooccur_igraph(play = "lessing-emilia-galotti", corpus = "ger")
plot(emilia)

read.csv("/Users/ivan/Library/Mobile Documents/com~apple~CloudDocs/Downloads/heroes_information.csv")
getwd()
read.csv("heroes_information.csv")
#setwd()

read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv")

read.csv("data/heroes_information.csv")

?read.csv
read.table(file = "https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
           header = TRUE,
           sep = ",", 
           quote = '"',
           dec = ".")

`<3всем привет` <- 2

make.names(c("hair colour", "234"))

heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-", "-99", "", "NA"))

mean(heroes$Height, na.rm = TRUE)
female_heroes <- heroes[heroes$Gender == "Female" & !is.na(heroes$Gender),]
write.csv(female_heroes, "data/female_heroes.csv", row.names = FALSE)

data.table::fread("data/heroes_information.csv")
vroom::vroom("data/heroes_information.csv")
