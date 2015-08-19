# Set to project directory
setwd(choose.dir())
# For personal use during project
setwd("~/Dropbox/projects/2015pppr")

library(plyr)

# Reading in the unanonymized results
unanon <- read.table('data/datafile_unanon.csv', sep = ';', dec = ',', header = TRUE)
# Getting out the number of results for each unique source
dat_unanon <- ddply(unanon, .(Source), summarize, nr.results = length(Raw))
# Writing out these results in ordered manner to prevent direct linking to anon file
# This way the nr.results does not need to be anonymized
write.table(dat_unanon[order(dat_unanon$nr.results),],
            'data/nr.results.unanon.csv', row.names = FALSE,
            sep = ';', dec = '.')