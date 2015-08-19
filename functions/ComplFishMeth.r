ComplFishMeth <- function(# Compute complement Fisher test for p-values.
	### This function computes paper level complement Fisher test statistics, testing whether the distribution of non-significant p-values above a certain threshold show an anomaly. A significant complement Fisher test indicates deviation from uniformity in the left skew sense.
	### Returns the complement Fisher test.
	### Computations are done for p*=log(1-p), where p is all non-significant p-values for each identifier.
	x,
	### Vector of p-values.
    id,
    ### Vector giving paper identifiers.
    threshold = .05
    ### Indicate what cut-off to use for selecting high p-values.
    ){
	Res <- NULL
	for(i in 1:length(unique(id)))
	{
			# Select all p-values for the i-th paper
			selP <- x[id==unique(id)[i]]

			nSigP <- (na.omit(selP[selP >= threshold]) - threshold)/(1 - threshold)
			if(!length(nSigP)==0){
				# Compute the complement Fisher test statistic
				FMeth <- -2 * sum(log(1 - nSigP))
				# Compute p-values analytically
				pFMeth <- pchisq(q=FMeth, df=2*length(nSigP), lower.tail=F)
				} else {
					FMeth <- NA
					pFMeth <- NA
				}
			Res <- rbind(Res, data.frame(
				Fish = FMeth,
				PFish = pFMeth,
				CountNSig = length(nSigP),
				PercentNonSig = length(nSigP)/length(selP)))
	}
	return(Res)
}