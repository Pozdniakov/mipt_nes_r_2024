seq(2, 20, 2)
1:10 * 2
(2:20)[c(TRUE, FALSE)]
(1:20)[c(FALSE, TRUE)]
seq(1, 20)[seq(1, 10) * 2]
seq(1, 20)
1:20
1:10 * 2
seq(1, 20)[-1:-10 * 2 + 1]
(1:20)[(1:20) %% 2 == 0]
c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)

v = 2
i = 2

while (i <= 10) {
  v = c(v, 2 * i)
  i = i + 1
}
v
character(5)
integer(10)

eyes <- c("green", "blue", "blue", "brown", "green", "blue")
sum(eyes == "blue")
sum(eyes == "blue")/length(eyes)
mean(eyes == "blue")

all(eyes == "blue")
any(eyes == "blue")
any(!eyes == "blue")

which(eyes == "blue")
eyes[eyes == "blue" | eyes == "green"]
eyes[eyes == c("green", "blue")]

eyes[eyes %in% c("green", "blue")]
respondents <- c("Балашиха", "Одинцово", "Москва", "Тбилиси",
  "Долгопрудный", "Санкт-Петербург", "Москва", "Ялта", "Казань")

million <- c("Москва", "Санкт-Петербург", "Новосибирск", "Казань")

respondents[respondents %in% million]

missed <- NA
NA == 0
missed == 0
missed == ""
missed == "NA"
missed == NA
NA == NA
Joe <- NA
Mary <- NA
Joe == Mary
NA * 2
NA ^ 0
NA & FALSE
NA | TRUE
n
n[5] <- NA
mean(n)
n
n == NA
is.na(n)
mean(n[!is.na(n)])
n
NA * 0
-6 / 0
NA ^ 0
NA == -Inf
n[which(n == n)]
mean(n, na.rm = TRUE)


is_in = function(x, y) {
  res = any(x == y)
  return(res)
}

vec_is_in = Vectorize(is_in)

#x = c(1, 2, 4, 5)

#is_in(x, 2)

set = list()
set[[1]] = c(1, 2)

a = c(1, 2, 0, 0, 1, 2, 2)
a[vec_is_in(set, a)]

typeof(NA)
NA_character_
NA_integer_
NA_real_
NA_complex_
as.integer(c(TRUE, NA, FALSE))
typeof(as.character(c(TRUE, NA, FALSE))[2])

1 / 0 > 6666
-1 / 0
0 / 0
is.nan(c(1/0, 0/0))
is.na(c(NA, NaN))
is.nan(c(NA, NaN))
mean(c(NA, NA), na.rm = TRUE)
nn <- NULL
c(NULL, NULL)

is.vector(list())

matrix(1:20, nrow = 5, ncol = 4)
A <- matrix(1:20, nrow = 5)
A[2, 3]
A[1:2, 2:3]
A[A > 10]
A[, 2:3]
A[1:2, ]

A[1:2, 1:2] <- 100
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(10, 2)
A
A[1:10]
attr(A, "dim") <- NULL
attr(A, "dim") <- c(2, 2, 5)
A
matrix(as.character(A), c(4, 5))
A > 5

rep(1:5, 5)
rep(1:5, each = 5)
rep(1:5, rep(5, 5))
t(A)
matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
matrix(rep(1:9, 9) * rep(1:9, rep(9, 9)), nrow = 9)

outer(1:9, 1:9, `*`)
1:9 %o% 1:9

mult_tab <- matrix(rep(1:9, 9), c(9, 9))

h_mult_tab = matrix(rep(1:9, 9), c(9, 9), byrow = TRUE)

mult_tab = mult_tab * h_mult_tab
mult_tab
mult_tab <- matrix(rep(1:9, 9), c(9, 9))
mult_tab * t(mult_tab)
mult_tab %*% mult_tab

simple_list <- list(42, "hey", TRUE)
simple_list

`[`(n, 7)
complex_list <- list(letters, 1:10, simple_list, A, sum, `[`)
complex_list
str(complex_list)

named_list <- list(name = "Stas", age = 30, student = TRUE)
named_list["age"]

class(named_list$age)
class(named_list[2])
is.double(named_list[[2]])
named_list["age"]
named_list[["age"]]
named_list$age #= named_list[["age"]]
named_list$ag

complex_list
complex_list[[3]][[2]]

list1 <- list(numbers = 1:5, letters = letters, logic = TRUE)
list2 <- list(lupa = list1, pupa = list1)
list2[1][2]
n[20]

list2[1]
list2[[1]][[2]][3]

list2[[1]][2][1][1][1][[1]]
list2[[1]]["letters"]
list2[[1]][["letters"]]
list2[[1]]$letters
