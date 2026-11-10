
library(MASS)
library(caret)
library(ggplot2)

df <- read.csv(r"d:\data 477\three potentisl data sets\three potentisl data sets\healthcare-dataset-stroke-data.csv")
df$target <- as.factor(df$stroke)

set.seed(11072026)
#SPLIT: 70% training / 30% holdout
train_index<- createDataPatrition(df$target, p = 0.7, list = FALSE)
train <- [train_index,]
holdout <-[-train_index,]

#SPlIT HOLDOUT in half: 15% VAlIDATION/ 15% TEST
val_idx <- createDataParttion(holdout$target, p = 0.5, list = FALSE)
Validation <- holdout[val_idx,]
Test <-hooldout[-val_idx,]

#SIZES OF each DS
sizes<- data.frame(
    set = c("Training","Validation","Test"),
    rows = c(nrow(train), nrow(Validation),nrow(Test)),
    percent = round(100* c(nrow(train), nrow(Validation),nrow(Test))/nrow(df),1)




)
print(sizes)

#fit LDA MODEl
 fit_lda <- lda(target ~, data = train)



#VAlidation Acccuracy
val_pred <- predict(fit_lda, newdata = Validation)$class
cat("Validation accuracy:", mean(val_pred == validation$target), "\n")

#Test Accuracy
test_pred <- predict(fit_lda, newdata = Test)$class
cat("Test accuracy:", mean(test_pred == test$target), "\n")