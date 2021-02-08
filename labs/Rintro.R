
# This is an introductory R sesssion.

# This file is an R script containing R commands and comments

# any line with a "#" in front is a comment and is not run

# any other line can be "sent" to the console in RStudio
# by placing the cursor on the line and pushing
# Command + Enter (mac)
# or
# Ctrl + Enter (non-mac)

3+5

# It's a good idea to train yourself to use these keyboard
# shortcuts. You'll get used to them quickly and work much
# more efficiently. Think of it like learning a musical instrument.

# If you want to move the cursor to the console, you can enter
# Ctrl + 2
# allowing you to enter commands directory into the console

# To move back to the R script, enter
# Ctrl + 1 


# To see the current working directory
getwd()

# change the working directory one level up
setwd("..")
getwd()

# change to the lecture_code directory
setwd("lecture_code")
getwd()

# go back to the labs directory in one step
setwd("../labs/")
getwd()



# It's good practice to write code that assumes you are in the
# working directory where the R script is located


# assigning and printing variables
x <- 3.7
x
y <- 7.2 
y
x + y
z <- c(9.0, 1.5, 8.3)
z
z[2]
z[2] <- 3.2
z

# Try to use informative, but short, variable names
# You can also use whitespace to make the code more readable
animal <- c( "mouse",  "turtle",    "fox",  "bear", "crocodile", "whale" )
size   <- c(  "tiny",   "small", "medium", "large",     "large", "huge"  )

# R organizes datasets in data frames. Make your own with data.frame function
dataset <- data.frame( animal, size )
dataset

# You can access columns of the data frame in different ways
dataset$animal
dataset[,1]
dataset[,"animal"]
dataset[["animal"]]

# You can create new columns in the same ways
dataset$rating <- c(3, 8, 9, 5, 1, 6)
dataset
dataset[,"mammal"] <- c(TRUE,FALSE,TRUE,TRUE,FALSE,TRUE)
dataset
dataset[,5] <- c(0.1, 2.0, 15, 800, 900, 10000)
dataset

# access and assign column names
names(dataset)
names(dataset) <- c("animal","size","rating","mammal","weight")
dataset
names(dataset)[5] <- "weight_pounds"
dataset

########################################################################

# Exercise 1:
# create a new column called "weight_kilograms" that converts
# the weight in pounds into weight in kilograms
# Then print out the dataset to confirm you got it right.

# create a new column called "myrating", giving
# your rating of each animal



########################################################################



# suppose we want to make a new column, equal to the sum of the ratings
# the rating and the weight
dataset$sum_ratings <- dataset$rating + dataset$myrating
dataset

# for more complicated operations, we can also use the "apply" function.
# Applies the third argument to the first argument,
# separately to each row (row-dimension = 1, column = 2)

# create a ratings dataset
ratings <- dataset[, c("rating","myrating")]
ratings

dataset$sum_ratings2 <- apply( ratings, 1, sum)
dataset



# We have used several R functions. To access the help page
# for a function, simply enter ? followed by the function name
?c
?data.frame
?names
?apply


# Writing and reading datasets

# We can write to a csv file with the write.csv function
# This will create a file in the current working directory
write.csv(dataset, file = "animal_data.csv" )

# To see the file, open it with a text editor, or by entering
# "cat animal_data.csv" into the terminal from the directory
# that contains the csv file.

# We can read csv files with the read.csv function
new_dataset <- read.csv("animal_data.csv")

# csv is a common data file format that allows people
# to read the files into many different programs.

# R has its own data file format that allows you to save
# R objects directly. This is useful if you want to easily
# share data with someone who uses R

# Create an RData file with the save function
# By convention, use the .RData extension
# This will save the R object "dataset"
save(dataset, file = "animal_data.RData")

# To see how this works, first remove the dataset
# object from your workspace
dataset
rm("dataset")
dataset

# Then load in the file
load("animal_data.RData")

dataset

# Using the load function can make your code hard to decipher
# because it's not clear which object is loaded. You can use
# comments to make your code clear:

# This loads an R object called "dataset" contining animal data
load("animal_data.RData")

# "save" and "load" can be used on multiple objects simultaneously,
# but I recommend including only a single object when you use
# the save function. To make things even more readable, make
# the filename the same as the object name:
animal_data <- dataset
save(animal_data,file="animal_data.RData")
rm("animal_data")
load("animal_data.RData")
animal_data

# If you need to save multiple objects, collecting them into
# a single R list (we will cover lists later)


########################################################################

# Exercise 2:
# Read in the anonymized quiz data.
# create a new column called "mean" containing each student's average
# create a new column called "median" containing each student's median
# save the updated dataset both as a csv and an RData file

# to complete this exercise, you can use the apply function
# or if you know how, use a for loop

########################################################################
