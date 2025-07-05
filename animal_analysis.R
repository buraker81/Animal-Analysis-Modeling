# Import the dataset
animal_data <- read.csv("Animal Dataset Cleaned.csv")
original_data <- read.csv("Animal Dataset.csv")
View(animal_data)

# Identify the height outliers
height_outliers <- boxplot.stats(animal_data$Height..cm.)$out
outlier_animals_height <- animal_data[animal_data$Height..cm. %in% height_outliers, c("Animal", "Height..cm.")]
boxplot(animal_data$Height..cm., main = "Boxplot of Animal Heights", ylab = "Height (cm)")
mtext("Outliers are shown as points")
View(outlier_animals_height)

# Identify the height outliers
height_outliers <- boxplot.stats(animal_data$Height..cm.)$out

# Get the animals with height outliers
outlier_animals_height <- animal_data[animal_data$Height..cm. %in% height_outliers, c("Animal", "Height..cm.")]

# Display a boxplot with outliers
boxplot(animal_data$Height..cm., main = "Boxplot of Animal Heights", ylab = "Height (cm)")
mtext("Outliers are shown as points")

# View outliers
View(outlier_animals_height)

# Remove the height outliers from the data
animal_data_no_height_outliers <- animal_data[!animal_data$Height..cm. %in% height_outliers, ]

# Verify the result by displaying the new dataset without outliers
View(animal_data_no_height_outliers)

hist(animal_data_no_height_outliers$Height..cm.)

# Identify the weight outliers
weight_outliers <- boxplot.stats(animal_data$Weight..kg.)$out
outlier_animals_weight <- animal_data[animal_data$Weight..kg. %in% weight_outliers, c("Animal", "Weight..kg.")]
boxplot(animal_data$Weight..kg., main = "Boxplot of Animal Weights", ylab = "Weight (kg)")
mtext("Outliers are shown as points")
View(outlier_animals_weight)

# Remove outliers from the animal data
animal_data_no_outliers <- animal_data[!animal_data$Weight..kg. %in% weight_outliers, ]

# Verify the result by displaying the new dataset without outliers
View(animal_data_no_outliers)

# Optionally, you can create a boxplot again to check the data without outliers
boxplot(animal_data_no_outliers$Weight..kg., main = "Boxplot of Animal Weights (Without Outliers)", ylab = "Weight (kg)")
mtext("Outliers removed")


# Identify the weight and height outliers
weight_height_outliers <- animal_data[animal_data$Height..cm. %in% height_outliers & animal_data$Weight..kg. %in% weight_outliers, ]
plot(animal_data$Height..cm., animal_data$Weight..kg., main = "Weight vs Height",
     xlab = "Height (cm)", ylab = "Weight (kg)", col = "black", pch = 19)
points(weight_height_outliers$Height..cm., weight_height_outliers$Weight..kg., col = "red", pch = 19)
View(weight_height_outliers)

# Identify the lifespan outliers
lifespan_outliers <- boxplot.stats(animal_data$Lifespan..years.)$out
outlier_animals_lifespan <- animal_data[animal_data$Lifespan..years. %in% lifespan_outliers, c("Animal", "Lifespan..years.")]
boxplot(animal_data$Lifespan..years., main = "Boxplot of Animal Lifespan", ylab="Lifespan (years)")
mtext("Outliers are shown as points")
View(outlier_animals_lifespan)

# Identify the gestation period outliers
gperiod_outliers <- boxplot.stats(animal_data$Gestation.Period..days.)$out
outlier_animals_gpreiod <- animal_data[animal_data$Gestation.Period..days. %in% gperiod_outliers, c("Animal", "Gestation.Period..days.")]
boxplot(animal_data$Gestation.Period..days., main = "Boxplot of Animal Gestation Period", ylab="Gestation Period (days)")
mtext("Outliers are shown as points")
View(outlier_animals_gpreiod)

# Identify the average speed outliers
aspeed_outliers <- boxplot.stats(animal_data$Average.Speed..km.h.)$out
outlier_animals_aspeed <- animal_data[animal_data$Average.Speed..km.h. %in% aspeed_outliers, c("Animal", "Average.Speed..km.h.")]
boxplot(animal_data$Average.Speed..km.h., main = "Boxplot of Animal Average Speed", ylab="Average Speed (km/h)")
mtext("Outliers are shown as points")
View(outlier_animals_aspeed)

# Identify the top speed outliers
topspeed_outliers <- boxplot.stats(animal_data$Top.Speed..km.h.)$out
outlier_animals_topspeed <- animal_data[animal_data$Top.Speed..km.h. %in% aspeed_outliers, c("Animal", "Top.Speed..km.h.")]
boxplot(animal_data$Top.Speed..km.h., main = "Boxplot of Animal Top Speed", ylab="Top Speed (km/h)")
mtext("Outliers are shown as points")
View(outlier_animals_topspeed)

# Identify the offspring per birth
osperbirth_outliers <- boxplot.stats(animal_data$Offspring.per.Birth)$out
outlier_animals_osperbirth <- animal_data[animal_data$Offspring.per.Birth %in% Offspring.per.Birth, c("Animal", "Offspring.per.Birth")]
boxplot(animal_data$Offspring.per.Birth, main = "Boxplot of Offspring Per Birth", ylab="Offspring per Birth")
mtext("Outliers are shown as points")
View(outlier_animals_osperbirth)


# Boxplots for all numeric variables
numeric_cols <- c('Height..cm.', 'Weight..kg.', 'Lifespan..years.', 
                  'Average.Speed..km.h.', 'Top.Speed..km.h.', 
                  'Gestation.Period..days.', 'Offspring.per.Birth')
par(mfrow = c(2,4))
for(col in numeric_cols) {
  boxplot(animal_data[[col]], 
          main = col,
          ylab = "Value",
          col = "lightblue")
}


# Height distribution
hist(animal_data$Height..cm., main = "Distribution of Animal Heights",xlab = "Height (cm)",ylab = "Frequency",col = "blue",border = "black",breaks = 30)

# Weight distribution
hist(animal_data$Weight..kg., main = "Distribution of Animal Weights",xlab = "Weight (kg)",ylab = "Frequency",col = "green",border = "black",breaks = 30)

# Lifespan distribution
hist(animal_data$Lifespan..years., main = "Distribution of Animal Lifespans",xlab = "Lifespan (years)",ylab = "Frequency",col = "lightgreen",border = "black",breaks = 30)

# Diet and weight
hist(animal_data$Weight..kg., animals_data$Diet,main = "Scatter Plot of Height vs Weight with Height Outliers",xlab = "Height (cm)",ylab = "Weight (kg)",pch = 16,col = "blue")

# Color distribution
color_distribution <- table(animals_data$Color)
barplot(color_distribution,
        main = "Distribution of Animals by Color",
        xlab = "Color",
        ylab = "Number of Animals",
        las = 2)

#Color counts
color_counts <- sort(table(animals_data$Color), decreasing = TRUE)
top_10_colors <- head(color_counts, 10)

# Predator distribution
predator_distribution <- table(animals_data$Predators)
barplot(predator_distribution,
        main = "Distribution of Animals by Predators",
        ylab = "Number of Animals",
        col = "lightgreen",
        las = 2)
View(predator_distribution)

library(caret)
library(randomForest)

# read data
model_data <- read.csv("Animal Dataset Cleaned.csv")
model_data <- model_data[sapply(model_data, is.numeric)]
model_data <- na.omit(model_data)

# Target var will be topspeed xd
target_variable <- "Top.Speed..km.h."

#train test split 
set.seed(123)
train_index <- createDataPartition(model_data[[target_variable]], p = 0.8, list = FALSE)
train_data <- model_data[train_index, ]
test_data <- model_data[-train_index, ]


# Train a Decision Tree model
tree_model <- rpart(Top.Speed..km.h. ~ ., data = train_data)

# Plot the decision tree
rpart.plot(tree_model, main = "Decision Tree for Predicting Top Speed")

# Make predictions on the test set
tree_predictions <- predict(tree_model, newdata = test_data)

# Evaluate Decision Tree model
tree_rmse <- rmse(test_data$Top.Speed..km.h., tree_predictions)
tree_mae <- mae(test_data$Top.Speed..km.h., tree_predictions)
tree_r2 <- R2(tree_predictions, test_data$Top.Speed..km.h.)

# Print Decision Tree performance
cat("Decision Tree Model Performance:\n")
cat("RMSE:", round(tree_rmse, 2), "\n")
cat("MAE:", round(tree_mae, 2), "\n")
cat("R-squared:", round(tree_r2, 2), "\n")
