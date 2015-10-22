################################################################################################################################################################################################################################

## GETTING AND CLEANING DATA 
## Lecture 1 in Swirl 

#####################################################################################################################################################################################################################

#GETTING AND CLEANING DATA LESSON 4 SWIRL

#| Let's build a chain of dplyr commands one step
#| at a time, starting with the script I just
#| opened for you.

# select() the following columns from cran. Keep in mind
# that when you're using the chaining operator, you don't
# need to specify the name of the data tbl in your call to
# select().
#
# 1. ip_id
# 2. country
# 3. package
# 4. size
#
# The call to print() at the end of the chain is optional,
# but necessary if you want your results printed to the
# console. Note that since there are no additional arguments
# to print(), you can leave off the parentheses after
# the function name. This is a convenient feature of the %>%
# operator.

cran %>%
  select(ip_id, country, package, size) %>%
	print

#Source: local data frame [225,468 x 4]

#   ip_id country      package    size
#1      1      US    htmltools   80589
#2      2      US      tseries  321767
#3      3      US        party  748063
#4      3      US        Hmisc  606104
#5      4      CA       digest   79825
#6      3      US randomForest   77681
#7      3      US         plyr  393754
#8      5      US      whisker   28216
#9      6      CN         Rcpp    5928
#10     7      US     hflights 2206029
#..   ...     ...          ...     ...

# Use mutate() to add a column called size_mb that contains
# the size of each download in megabytes (i.e. size / 2^20).
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb=size/2^20) %>%
  print

#   ip_id country      package    size     size_mb
#1      1      US    htmltools   80589 0.076855659
#2      2      US      tseries  321767 0.306860924
#3      3      US        party  748063 0.713408470
#4      3      US        Hmisc  606104 0.578025818
#5      4      CA       digest   79825 0.076127052
#6      3      US randomForest   77681 0.074082375
#7      3      US         plyr  393754 0.375513077
#8      5      US      whisker   28216 0.026908875
#9      6      CN         Rcpp    5928 0.005653381
#10     7      US     hflights 2206029 2.103833199
#..   ...     ...          ...     ...         ...

# Use filter() to select all rows for which size_mb is
# less than or equal to (<=) 0.5.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  print 

#   ip_id country      package   size     size_mb
#1      1      US    htmltools  80589 0.076855659
#2      2      US      tseries 321767 0.306860924
#3      4      CA       digest  79825 0.076127052
#4      3      US randomForest  77681 0.074082375
#5      3      US         plyr 393754 0.375513077
#6      5      US      whisker  28216 0.026908875
#7      6      CN         Rcpp   5928 0.005653381
#8     13      DE        ipred 186685 0.178036690
#9     14      US       mnormt  36204 0.034526825
#10    16      US    iterators 289972 0.276538849
#..   ...     ...          ...    ...         ...

# arrange() the result by size_mb, in descending order.
#
# If you want your results printed to the console, add
# print to the end of your chain.

cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb)) %>%
  print 

#   ip_id country               package   size
#1  11034      DE                  phia 524232
#2   9643      US                   tis 524152
#3   1542      IN               RcppSMC 524060
#4  12354      US                 lessR 523916
#5  12072      US            colorspace 523880
#6   2514      KR              depmixS4 523863
#7   1111      US              depmixS4 523858

#| In this lesson, you learned about grouping and
#| chaining using dplyr. You combined some of the
#| things you learned in the previous lesson with
#| these more advanced ideas to produce concise,
#| readable, and highly effective code. Welcome to
#| the wonderful world of dplyr!
#8   8865      CR              depmixS4 523858
#9   5908      CN RcmdrPlugin.KMggplot2 523852
#10 12354      US RcmdrPlugin.KMggplot2 523852
#..   ...     ...                   ...    ...
#Variables not shown: size_mb (dbl)
