animals_data <- read.csv('Animal Dataset.csv')
View(animals_data)
str(animals_data)

#remove the upto and give the exact value
cols_contains_upto <- c('Height..cm.', 'Weight..kg.', 'Lifespan..years.')

for(col in cols_contains_upto){
  match <- grepl("^Up to", animals_data[[col]])
  split_values <- strsplit(animals_data[[col]][match], " ")
  animals_data[[col]][match] <- sapply(split_values, function(parts) parts[3])
}

#find the - values and take the mean of them

#lets consider height and there is only one entry which is entered in meter
col <- 'Height..cm.'
match <- grepl("-", animals_data[[col]])
split_values <- strsplit(animals_data[[col]][match], "-")
animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)

animals_data[33, col] <- 3350

# lets conisder weight as in kg and take the mean for no unit change
# there are some values which are represneted with comma
# so we are not taking the comma value (only two entries will be hardy entred with hand)

col <- 'Weight..kg.'
match <- grepl("-", animals_data[[col]]) & !grepl(",", animals_data[[col]]) 
split_values <- strsplit(animals_data[[col]][match], "-")
animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)

#handled the comma issue.
match <- grepl(",", animals_data[[col]]) 
animals_data[[col]][match]
which(match)
#fix
animals_data[8, col] <- 659
animals_data[28, col] <- 1100

#we have to conver the data to the numeric but there are other values.

#lets consider lifespan years
col<- 'Lifespan..years.'
match <- grepl("-", animals_data[[col]]) & !grepl("months|weeks|days", animals_data[[col]]) 
split_values <- strsplit(animals_data[[col]][match], "-")
animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)

#problem span
match <- grepl("months|weeks|days", animals_data[[col]]) 
which(match)
animals_data[[col]][match]
#fix
animals_data[32, col] <- 0.02
animals_data[35, col] <- 0.6
animals_data[77, col] <- 0.035


#lets consider avg speed and top speed values there are - values

cols <- c('Average.Speed..km.h.', 'Top.Speed..km.h.')
for(col in cols){
  match <- grepl("-", animals_data[[col]])
  split_values <- strsplit(animals_data[[col]][match], "-")
  animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)
}

#lets consider 'Offspring.per.Birth' to manage the up to keyword
col <- 'Offspring.per.Birth'
match <- grepl("^Up to", animals_data[[col]])
split_values <- strsplit(animals_data[[col]][match], " ")
animals_data[[col]][match] <- sapply(split_values, function(parts) parts[3])

#lets consider 'Gestation.Period..days.' to 
col <- 'Gestation.Period..days.'

#only the valid but - values
match <- grepl("-", animals_data[[col]]) & !grepl("[A-Za-z]", animals_data[[col]])
split_values <- strsplit(animals_data[[col]][match], "-")
animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)

#months but with - values
match_months <- grepl("months", animals_data[[col]], ignore.case = TRUE)
split_values <- strsplit(animals_data[[col]][match_months], " ")
animals_data[[col]][match_months] <- sapply(split_values, function(x){
  months_parts <- strsplit(x[[1]], "-")[[1]]
  if (length(months_parts) == 2) {
    days <- (as.numeric(months_parts[1]) * 30 + as.numeric(months_parts[2]) * 30) / 2
  } else if (length(months_parts) == 1) {
    days <- as.numeric(months_parts[1]) * 30
  } else {
    days <- NA
  }
  return(days)
})
#weeks but with - values
match_months <- grepl("weeks|week", animals_data[[col]], ignore.case = TRUE)
split_values <- strsplit(animals_data[[col]][match_months], " ")
animals_data[[col]][match_months] <- sapply(split_values, function(x){
  months_parts <- strsplit(x[[1]], "-")[[1]]
  if (length(months_parts) == 2) {
    days <- (as.numeric(months_parts[1]) * 7 + as.numeric(months_parts[2]) * 7) / 2
  } else if (length(months_parts) == 1) {
    days <- as.numeric(months_parts[1]) * 7
  } else {
    days <- NA
  }
  return(days)
})

#we also have million years value :d and with another explained value
animals_data[133, col] <- 10
animals_data[48, col] <- 120450000000000

#lets consider the 'Offspring.per.Birth' column
col <- 'Offspring.per.Birth'
# to handle normal - values
match <- grepl("-", animals_data[[col]]) & !grepl("[A-Za-z]", animals_data[[col]])
split_values <- strsplit(animals_data[[col]][match], "-")
animals_data[[col]][match] <- sapply(split_values, function(x) (as.numeric(x[1]) + as.numeric(x[2])) / 2)

match <- grepl("usually|approx.|rarely", animals_data[[col]], ignore.case = TRUE)
split_values <- strsplit(animals_data[[col]][match], " ")
animals_data[[col]][match] <- sapply(split_values, function(x){
  normal_parts <- strsplit(x[[1]], "-")[[1]]
  if (length(normal_parts) == 2) {
    part <- (as.numeric(normal_parts[1])  + as.numeric(normal_parts[2])) / 2
  } else if (length(normal_parts) == 1) {
    part <- as.numeric(normal_parts[1]) 
  } else {
    part <- NA
  }
  return(part)
})

# lets fill the varies and Not Applicable in all cols to NA
animals_data[animals_data == "Varies" | animals_data == "Not Applicable"] <- NA
# also fill the string values with a arbitrary number
animals_data[animals_data == "Thousands"] <- 5000
animals_data[animals_data == "Hundreds"] <- 500

match_comma <- grepl(",", animals_data[[col]])
which(match_comma)
animals_data[[col]][match_comma]

animals_data[40, col] <- 1000
animals_data[47, col] <- 1000
animals_data[74, col] <- 200000
animals_data[130, col] <- 10000

# Convert all numeric columns to numeric type
numeric_cols <- c('Height..cm.', 'Weight..kg.', 'Lifespan..years.', 
                 'Average.Speed..km.h.', 'Top.Speed..km.h.', 
                 'Gestation.Period..days.', 'Offspring.per.Birth')

for(col in numeric_cols) {
  animals_data[[col]] <- as.numeric(animals_data[[col]])
}

# Save the cleaned dataset to a new CSV file
write.csv(animals_data, "Animal Dataset Cleaned.csv", row.names = FALSE)

# Print summary of the cleaned data
print("Summary of cleaned data:")
str(animals_data)

animals_data_cleaned <- read.csv("Animal Dataset Cleaned.csv")
view(animals_data_cleaned)




