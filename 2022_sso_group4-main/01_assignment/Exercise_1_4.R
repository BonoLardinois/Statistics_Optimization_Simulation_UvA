setwd('/Users/katringrunert/Projects/Uni/sso/exercises/01_assignment')
austen = read.table("austen.txt",header=TRUE, row.names = 1)

# http://analyticswithr.com/chisquare.html#pearson%E2%80%99s_chi-squared_test_for_homogeneity

# Exercise 4.a
#  contingency table test for independence or homogeneity test
# The chi-square test of homogeneity tests to see whether different columns (or rows) 
# of data in a table come from the same population or not
# (i.e., whether the differences are consistent with being explained by sampling error alone).
# The use case definition above indicates that we should probably use the homogeneity test

sense_sand = chisq.test(rbind(austen$Sense, austen$Sand1))
emma_sand = chisq.test(rbind(austen$Emma, austen$Sand1))
sense_emma = chisq.test(rbind(austen$Sense, austen$Emma))

p_values = list(sense_emma, sense_sand, emma_sand)

sand1_sand2 = chisq.test(rbind(austen$Sand1, austen$Sand2))

# Exercise 4.b
# Exercise 4.c
# Exercise 4.d
