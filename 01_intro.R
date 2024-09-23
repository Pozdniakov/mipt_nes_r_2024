2 + 2
3 - 1
6 * 5
7 / 3

7 %/% 2 #division with residuals
7 %% 2

2 + 2 * 2
(2 + 2) * 2

6 ^ 2
6 ** 2
16 ^ .5

sqrt(16)
log(x = 8, base = 2)
?log
log(8, 2)

sin(pi)
options(scipen = 999)
sin(pi)

a = 2
a <- 2

2 -> a #we don't do it here

b <-  a ^ a - a * a
a
b
e <-  42
rm(e)
# rm(list = ls())

a == b
a != b

a > b
a < b
a >= b
a <= b

5 + 3i

is.integer(5)
is.integer(5L)
as.double(5L)

sqrt(2)^2 == 2L
all.equal(sqrt(2)^2, 2)

s <- "Hi everyone"
s <- 'Hi everyone'

paste(s, "welcome", "to", "the", "course", sep = "_<3___")
paste(s, "welcome", "to", "the", "course", sep = "")
paste0(s, "welcome", "to", "the", "course")

`+`(2, 5)

comparison <- a > b
t1 <- TRUE
f1 <- FALSE

!t1
!f1

t1 & t1
t1 & f1
f1 & t1
f1 & f1

t1 | t1
t1 | f1
f1 | t1
f1 | f1

t1 && t1

с(4, 8)
c(4, 8, 15, 16, 23, 42)
c("hey", "ho", "let's", "go")
c(TRUE, FALSE)
1:20
5:-3
10:10:100 #doesn't work as intended
`:`(`:`(10, 10), 100) # how the previous line really works

seq(10, 100, by = 10)
seq(1, 13, length.out = 4)

length(1:20)
#lenght <- length #joke

rep(1, 20)
rep(1:3, 10)
rep(1:3, c(10, 2, 30))
rep(1:3, each = 5)

c(1:8, 5:10, 10)
?seq

sum(1:10)
mean(1:10)

a <- 2
print(a)
a

c(FALSE, 2)
2 + TRUE
c(1, 2, 3, 4, 5, "6")

c(TRUE, 3, "hi")
c(c(TRUE, 3), "hi")
is.character("hi")
as.character(as.numeric(c(TRUE, FALSE, FALSE)))
as.logical(-5:5)
as.numeric(c("1", "2", "три"))
as.logical(c("TRUE", "FALSE", "1"))

n <- 1:4
m <- 4:1
n
m
n + m
n - m
n * m
n / m
n ^ m
n * m - m ^ n
n %*% m

sqrt(1:10)
log(1:10, 10:1)

k <- c(10, 100)
n * k
n + k
n
k
n * 10

n * c(10, 100, 100)

1:20 * rep(0:1, 10)
1:20 * 0:1

(1:10) ^ 2
2 ^ (0:10)
sum(seq(1, 28, by = 3)/ 3 ^ (0:9) > .5)

n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[length(n)]
n[3] <-  20
n
n[4:7]
n[length(n):1]
rev(n)
n[4:6]
n[4:6] <- 0
n

n[-1]
n[c(-4, -5)]

n[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]

my_named_vector <- c(first = 1, second = 2, third = 3)
my_named_vector
names(my_named_vector)
attributes(my_named_vector)

names(my_named_vector) <- letters[1:3]
my_named_vector
my_named_vector[c("c", "a")]

#extract all values from n that are larger than average of n

n[n > mean(n)]

#n[c(-2, 3)] error
n[0]
n[100]
n[c(2, 0, 3)]
n[1:20]
n[-1]
n[-2]
#n[-1, -2]
n[c(-1, -2)]
