library(plyr)

# Set to project directory
setwd(choose.dir())
# For personal use
setwd("~/Dropbox/projects/2015pppr")

temp <- read.table('datafile_unanon.csv', sep = ';', dec = ',', header = TRUE)

dat <- ddply(temp, .(Source), summarize, nr.results = length(Raw))
