heroes <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-", "-99", "", "NA"))

number <- -1
#number <- -2:2
if (number > 0) {
  "Positive number"
} else if (number < 0) {
  "Negative number"
} else  {
  "zero"
}

ifelse(number > 0, "positive number", "negative number or zero")
ifelse(number > 0,
       "positive number",
       ifelse(number < 0,
              "negative number",
              "zero"))
number <- -2:4
#install.packages("dplyr")
dplyr::case_when(
  is.na(number) ~ NA_character_, #if
  number > 0    ~ "positive", #else if
  number < 0    ~ "negative", #else if
  .default = "zero" #else
)

heroes$hair <- ifelse(heroes$Hair.color == "No Hair", "Bold", "Hairy")


heroes$tall <- dplyr::case_when(
  is.na(heroes$Height) ~ NA_character_,
  heroes$Height > 200 ~ "very tall",
  heroes$Height > 190 ~ "tall",
  heroes$Height < 150 ~ "short",
  .default = "middle"
)

pow <- function(x, p = 2, junk_parameter = power * 2) {
  power <- x ^ p
  junk_parameter
}

pow(10)

mass <- 80
height <- 1.85

imt <- function(m, h) m/h ^ 2

imt(80, 1.67)

n <- 1
m <- 1
a <- function() {
  n <- 10
  b <- function()
  {
    n <<- 100
    m <<- 100
    l <<- 100
  }
  print("before b():")
  print(paste("n =",n))
  print(paste("m =",m))
  b()
  print("after b():")
  print(paste("n =",n))
  print(paste("m =",m))
}
a()
n
m
seq_len(8)
1:8
seq_len(0)
1:0
factors <- function(x) which(x %% seq_len(x) == 0)
factors(2048)
factors(2024)
is_prime <- function(x) length(factors(x)) == 2
is_prime(7)

is_prime <- function(x) !any(x %% 2:(x/2) == 0) 
is_prime(2024)

mean(1:10)
list(mean, sum, `[`)

# *apply() functions ------------------------------------------------------


A <- matrix(1:12, 3)
A
rowSums(A)
rowMeans(A)
colSums(A)
colMeans(A)

apply(A, 1, sum)
apply(A, 1, mean)
apply(A, 1, median)
apply(A, 1, sd)
apply(A, 2, sum)

A[2, 2] <- NA
A
apply(A, 1, sum, na.rm = TRUE)
?apply

B <- matrix(c("Welcome", "to", "the", "matrix", "Neo", "!"),
       2)

B
nchar("hi")
nchar(c("Welcome", "to", "the", "matrix", "Neo", "!"))
sum(nchar(c("Welcome", "to", "the", "matrix", "Neo", "!")))
apply(B, 2, function(whatever) sum(nchar(whatever)))
apply(B, 2, \(y) sum(nchar(y)))

composite<-function(f,g) function(...) f(g(...))

f<-function(x) x+1;
g<-function(x) x*2;
f(5)
g(5)
composite(f,g)(7)
composite(g,f)(7)

some_list <- list(some = 1:10, list = letters)
some_list
length(some_list)
lapply(some_list, length)
sapply(some_list, length)
install.packages("purrr")
library(purrr)

map(some_list, length)
map(some_list, 2)
#lapply(some_list, 2)

lapply(1:10, sqrt)
map(1:10, sqrt)

sapply(1:10, sqrt)
sqrt(1:10)

is_prime(1:10)
vectorized_is_prime <- Vectorize(is_prime)
vectorized_is_prime(1:10)
sapply(1:10, is_prime)

#map == lapply
map_dbl(1:10, sqrt)
map_chr(1:10, sqrt)

hist(rlnorm(100))

many_means <- replicate(10000, mean(rlnorm(10000)))

hist(many_means)


# Factors -----------------------------------------------------------------

heroes_new <- read.csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na.strings = c("-", "-99", "", "NA"),
                   stringsAsFactors = TRUE)
heroes_new 
unclass(heroes_new$Alignment)

as.numeric(factor(c(4, 1, 2, 3, 0, 4, 1)))
as.numeric(as.character(factor(c(4, 1, 2, 3, 0, 4, 1))))
as.numeric(heroes_new$Alignment)
str(heroes_new$Alignment)
attributes(heroes_new$Alignment)
heroes_new$Alignment[heroes_new$Alignment != "bad"]
droplevels(heroes_new$Alignment[heroes_new$Alignment != "bad"])

library(forcats)
fct_infreq(heroes_new$Race)
fct_lump_min(fct_infreq(heroes_new$Race), 10)

fct_lump_n(fct_infreq(heroes_new$Race), 3)
