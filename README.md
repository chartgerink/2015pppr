# Post-publication peer review

This project investigates a subselection of psychology papers and engages in a post-publication peer review (PPPR) in order to learn some lessons on the reporting of statistical results. 

Original, unanonymized data from running statcheck are not included due to ethics board restrictions. The anonymized results *are* included and unanonymized results of extracted results per paper are also included.

To-do:

- [x] Create dataset of statcheck results 
- [x] Count number of statcheck results per paper
- [ ] X step procedure per paper
- [ ] Random paper selection from statcheck data

## Step procedure
1. Extract a total of 10 papers with the use of the `statcheck` results. This includes 5 papers >= year 2010, AND that are flagged with the `ln(1-p)` method, AND have >= 10 statistical results; subsequently 5 papers with >= 10 results are sampled from the remaining set of >= 2010 papers that were *not* flagged by `ln(1-p)`.
2. Run statcheck on the HTML files of the paper
3. For each paper
    1. Read the introduction and note explicit hypotheses (if any).
    2. Read the methods and note sample size, design, measures (including min-max), analyses, possible subsamples in analysis, and composite measure composition (e.g., parcelling, PCA), power analysis + anything else noteworthy
    3. Read the results and see whether:
        1. Are there discrepancies between the results and the methods section? (i.e., omissions or adjustments to measures, analyses)
        2. Are the discrepancies justified in the results section?
        3. Are the reported means possible given the scales of the measures?
        4. Are the degrees of freedom in correspondence with the sample size and analysis?
        5. Check all statcheck results with error.
        6. How many p-values are given in text or alluded to in the tables? (this includes asterisks etc)?
    4. Read the discussion
        1. Does the discussion make any mention of statistical properties causing (non)significant results? See point 3.6 for number of results, for e.g., familywise error rate (1-(1-alpha)^k, with k tests)