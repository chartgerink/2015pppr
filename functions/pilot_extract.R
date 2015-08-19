# Set to project directory
setwd(choose.dir())
# For personal use during project
setwd("~/Dropbox/projects/2015pppr")

# Read in nr.results per paper
dat <- read.table('data/nr.results.unanon.csv', sep = ';', dec = '.', header = TRUE)

# Set the threshold for number of results extracted
k.sel = 15
# How many papers to extract?
n.sel = 5

# Extract a set of n.sel papers that have >= k.sel results
sampleframe <- dat$Source[dat$nr.results >= k.sel]
set.seed(k.sel + n.sel + 5)
sampled <- sample(x = sampleframe, size = n.sel, replace = FALSE)

# And write out these selected papers into a text file
write.table(sampled, file = 'archive/pilot/sampled_papers.txt', quote = FALSE, 
            row.names = FALSE, col.names = FALSE)