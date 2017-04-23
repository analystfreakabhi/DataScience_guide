
## reference link : https://www.datacamp.com/community/tutorials/machine-learning-in-r#gs.FNZrRMs


iris <- read.csv(url("https://raw.githubusercontent.com/uiuc-cse/data-fa14/gh-pages/data/iris.csv"), header = TRUE)

iris

###install.packages(ggvis)

##  getOption("repos") -- check which repo being used 

library(ggvis)

iris %>% ggvis(~sepal_length, ~sepal_width, fill = ~species) %>% layer_points()

head(iris)
iris %>% ggvis(~petal_length, ~petal_width, fill = ~species) %>% layer_points()

str(iris)
head(iris)

table(iris$species)

round(prop.table(table(iris$species)) * 100, digits = 1)

summary(iris)

summary(iris[c("petal_width", "sepal_width")])

library(class)

any(grepl("class", installed.packages()))


normalize <- function(x) {
  num <- x - min(x)
  denom <- max(x) - min(x)
  return (num/denom)
}


iris_norm <- as.data.frame(lapply(iris[1:4], normalize))

summary(iris_norm)

set.seed(1234)


ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.67, 0.33))


iris.training <- iris[ind==1, 1:4]
iris.test <- iris[ind==2, 1:4]

iris.trainLabels <- iris[ind==1, 5]
iris.testLabels <- iris[ind==2, 5]


iris_pred <- knn(train = iris.training, test = iris.test, cl = iris.trainLabels, k=3)


iris_pred

library(gmodels)


CrossTable(x = iris.testLabels, y = iris_pred, prop.chisq=FALSE)



