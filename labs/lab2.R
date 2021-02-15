# generate some fake data
x <- 1:10
y <- 1 + 0.2*x + rnorm(10)
#print out x and y in a matrix (doesn't alter x or y)
cbind(x,y)

# default plot
plot(x,y)

# plot documentation gives some information about 
# what can be customized
# we'll go through some of these but not all.
# it's important to learn to read the documentation
?plot

# plot is a function that behaves differently based
# on the type of arguments passed to it
# for example, if we put a linear model object in...
m1 <- lm( y ~ x )
plot(m1)

# R knows to call a different function plot.lm
?plot.lm
# there are many others
?plot.ts         # argument is a time series object
?plot.function   # argument is a function (like cos)
?plot.data.frame # data frame 
?plot.density    # density object
# you get the picture. 
# Calling plot( object ) calls plot."cls"(object) 
# where "cls" = class(object)

# back to simple things
# for things like plot(x,y), it calls plot.default
?plot.default

# let's customize our plot
# make axis labels with xlab and ylab
plot(x,y, xlab = "Effort", ylab = "Reward")


# title with main and subtitle with sub
plot(x,y, xlab = "Effort", ylab = "Reward", main = "Reward v. Effort")
plot(x,y, xlab = "Effort", ylab = "Reward", main = "Reward v. Effort", sub = "10 datapoints")

# change font family
plot(x,y,xlab = "Effort", ylab = "Reward", family = "sans")  #Default
plot(x,y,xlab = "Effort", ylab = "Reward", family = "serif")
plot(x,y,xlab = "Effort", ylab = "Reward", family = "mono")

# change plotting symbol with pch
plot(x,y,xlab = "Effort", ylab = "Reward", pch = "+")
# can also put in a number between 0 and 25, each giving diff symbol
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 12)
plot(0:25,abs(0:25-12.5),pch=0:25)


# exercise, find the filled circle plotting symbol and change
# the plot to usefilled circles


# to see all the parameters you can set:
?par


# change size with cex
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, cex = 1/2)
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, cex = 2)

# change axes with xlim and ylim
plot(x,y, xlab = "Effort", ylab = "Reward", pch = 16, xlim = c(-2,12), ylim = c(-3,6) )

# change color with col, named color, rgb value, or hex
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, col = "magenta")
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, col = rgb(1,1/2,0))
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, col = "#00CCFF")

# Exercise:
# Make a plot with blue points in three different ways
# hint: in rgb, blue is 100% blue
# hint: look up hex code for blue

# change plot type with type
plot(x,y,xlab = "Effort", ylab = "Reward", type = "p") # default
plot(x,y,xlab = "Effort", ylab = "Reward", type = "l") # lines
plot(x,y,xlab = "Effort", ylab = "Reward", type = "b") # both (non-overlap)
plot(x,y,xlab = "Effort", ylab = "Reward", type = "o") # both (overlap)
plot(x,y,xlab = "Effort", ylab = "Reward", type = "n") # nothing
# last one seems silly, but is useful for customized plots

# lwd and lty for line widths and types
plot(x,y,xlab = "Effort", ylab = "Reward", type = "l", lwd = 0.4) 
plot(x,y,xlab = "Effort", ylab = "Reward", type = "l", lwd = 3.8) 
plot(x,y,xlab = "Effort", ylab = "Reward", type = "l", lty = 2) 
plot(x,y,xlab = "Effort", ylab = "Reward", type = "l", lty = 3) 


# Exercise: make a plot with dot-dash line type


# use points and lines to add points or lines to a plot
# calling plot a second time overwrites the plots
y2 <- 3 - 0.2*x + rnorm(10)
plot(x,y)
plot(x,y2,col = "blue")   # overwrites

plot(x,y)
points(x,y2, col = "blue")  # add them

plot(x,y,type = "l", ylim = c(-2,5))
lines(x,y2,col = "blue")
# when adding points or lines, make sure that the added graphics
# fall inside the axes of the plot. Plot axes are not resized
# after being originally created with plot function

# add text with the text function
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16)
text(4,3,"Relationship not so clear")

# can add lots of text with vectors
plot(x,y,xlab = "Effort", ylab = "Reward", pch = 16, xlim = c(0,10), ylim = c(0,5))
text(x - 0.2, y + 0.2, round(y,2))  # converts round(y,2) to string

# can even use text as the plotting symbol (good use of type = "n")
plot(x,y,xlab = "Effort", ylab = "Reward", type = "n")
text(x, y, round(y,2))

# add legend to a plot
plot(x,y, type = "o", ylim = c(-2,5))
lines(x,y2, col = "blue")
points(x,y2, col = "blue")
legend("topright", legend = c("old","new"), col = c("black","blue"), pch = 1, lty = 1)

# can put legend outside
plot(x,y,type = "l")
lines(x,y2,col = "blue")
legend(8,20, legend = c("old","new"), col = c("black","blue"), lty = 1, xpd = T)


# bonus exercise for fun:

## for the figure to reproduce use the inbuilt dataset CO2

## Use Alt+Shift+K to see all possible keyboard shortcuts

## To easily update R go through the 3rd (for WIndows)
## and 5th (for MAC) answers in the following post - 
## https://stackoverflow.com/questions/13656699/update-r-using-rstudio
## Please come to OH or talk to the TA after lab if there's trouble