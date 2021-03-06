# Exercise 1
# The file fuel.txt is one of several files that the function datafile() (from DAAG), when called
# with a suitable argument, has been designed to place in the working directory. On the R command
# line, type library(DAAG), then datafile("fuel"), thus:a
# > library(DAAG)
# > datafile(file="fuel") # NB datafile, not dataFile
# Alternatively, copy fuel.txt from the directory data on the DVD to the working directory.
# Use file.show() to examine the file.b Check carefully whether there is a header line. Use the
# R Commander menu to input the data into R, with the name fuel. Then, as an alternative, use
# read.table() directly. (If necessary use the code generated by the R Commander as a crib.) In
# each case, display the data frame and check that data have been input correctly.
# Note: If the file is elsewhere than in the working directory a fully specified file name, including the path, is
# necessary. For example, to input travelbooks.txt from the directory data on drive D:, type
# > t?ravelbooks <- read.table("D:/data/travelbooks.txt")

## source : http://maths-people.anu.edu.au/~johnm/datasets/text/
install.packages("DAAG")
library(DAAG)
# > getwd()
# [1] "C:/Users/Swagger/Documents"
datafile(file="fuel")

datafile(file="fuel")
file.show("fuel.txt")
fuel_data <- read.table("fuel.txt", header = TRUE)
fuel_data

# 2) he files molclock1.txt and molclock1.txt are in the data directory on the DVD.a
datafile("molclock1")
molclock  <-  read.table("molclock1.txt")
summary(molclock)

# 3) The following counts, for each species, the number of missing values for the column root of the data
# frame rainforest (DAAG):
#   > library(DAAG)
# > with(rainforest, table(complete.cases(root), species))
install.packages("debug")
library(DAAG)
library(dplyr)
class(rainforest)
rf <- rainforest
str(rf)
data("rainforest")
dim(rainforest)
is.data.frame(rf)
with(rainforest, table(complete.cases(wood), branch)) ## with clause, apply function / expr to dataframe

# Exercise 4
# For each column of the data frame Pima.tr2 (MASS), determine the number of missing values.
install.packages("MASS")
library(MASS)
dim(Pima.tr2)
head(Pima.tr2)  | str(Pima.tr2)
with(Pima.tr2, table(complete.cases(type), age))
sapply(Pima.tr2, function(x) sum(is.na(x))) ## easy way 
apply(is.na(Pima.tr2),2,sum)
colSums(is.na(Pima.tr2))

# Exercise 5
# The function dim() returns the dimensions (a vector that has the number of rows, then number of
# columns) of data frames and matrices. Use this function to find the number of rows in the data
# frames tinting, possum and possumsites (all in the DAAG package).

is.data.frame(tinting)
dim(tinting)
is.data.frame(possum)
dim(possum)
is.data.frame(possumsites)
dim(possumsites)

# Exercise 6
# Use the functions mean() and range() to find the mean and range of:
#   (a) the numbers 1, 2, . . . , 21
# (b) the sample of 50 random normal values, that can be generated from a normaL distribution
# with mean 0 and variance 1 using the assignment y <- rnorm(50).
# (c) the columns height and weight in the data frame women.
# [The datasets package that has this data frame is by default attached when R is started.]
#1)
class(1:21)
mean((1:21))
range(1:21)
#2)
y <- rnorm(50, mean = 0, sd = 1)
mean(y)
#3)
data(women)
str(women)
mean(women$height)
mean(women$weight)
range(women$height)
range(women$weight)
median(women$height)
sum(women$height)

summary(women$height)

-----------------
#   
# Use head() to check the names of the columns, and the first few rows of data, in the data frame
# rainforest (DAAG). Use table(rainforest$species) to check the names and numbers of each
# species that are present in the data. The following extracts the rows for the species Acmena smithii
# > library(DAAG)
# > Acmena <- subset(rainforest, species=="Acmena smithii")
# The following extracts the rows for the species Acacia mabellae and Acmena smithii
# > AcSpecies <- subset(rainforest, species %in% c("Acacia mabellae",
#                                                  + "Acmena smithii"))
# Now extract the rows for all species except C. fraseri.

head(rainforest)
table(rainforest$species)
# Acacia mabellae      C. fraseri  Acmena smithii   B. myrtifolia 
# 16              12              26              11 

ac = subset(rainforest, (species)=="Acacia mabellae")
ac = subset(rainforest, (species) %in% c("Acacia mabellae","Acmena smithii"))
ac = subset(rainforest, !((species) %in% c("Acacia mabellae","Acmena smithii")))
#subset(b, !(y %in% a$x)) -usage for not in

# Exercise 9
# Extract the following subsets from the data frame ais (DAAG):
#   (a) Extract the data for the rowers.
# (b) Extract the data for the rowers, the netballers and the tennis players.
# (c) Extract the data for the female basketabllers and rowers.
str(ais)
data(ais)

r1 = subset(ais, sport == "Row")
#1) 
r1  <- subset(ais, toupper(sport) == "ROW") ## case In-Sensetive search
#2)
r1 <-  subset(ais, toupper(sport) %in% c("ROW","TENNIS")) ## case In-Sensetive search
# 3)((toupper(sport) %in% c("ROW","B_BAll")) &&
r1 <-  subset(ais, (sex == "f" ) & (sport %in% c("Row","B_Ball")))
