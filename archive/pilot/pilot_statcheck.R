# Set to project folder
setwd(choose.dir())
# For personal use during the project
setwd("~/Dropbox/projects/2015pppr")

# Dependencies
if(!require(statcheck)){install.packages('statcheck')}
library(statcheck)

x <- checkHTMLdir(dir = 'archive/pilot')

write.table(x, 'archive/pilot/pilot_statcheck.csv', sep = ';', dec = '.', row.names = FALSE)
