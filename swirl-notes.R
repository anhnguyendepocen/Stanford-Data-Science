# Swirl lectures Johns Hopkins

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
#8   8865      CR              depmixS4 523858
#9   5908      CN RcmdrPlugin.KMggplot2 523852
#10 12354      US RcmdrPlugin.KMggplot2 523852
#..   ...     ...                   ...    ...
#Variables not shown: size_mb (dbl)

#| Keep up the great work!

  #|==================================================================================================| 100%

#| In this lesson, you learned about grouping and
#| chaining using dplyr. You combined some of the
#| things you learned in the previous lesson with
#| these more advanced ideas to produce concise,
#| readable, and highly effective code. Welcome to
#| the wonderful world of dplyr!
  


## Getting and cleaning data, lecture 3 tidying data 

install.packages("dplyr")
library(dplyr)

cran %>% 
    select(ip_id, country, package, size)
    print
    
#versus 
select(cran, ip_id, country, package, size)

#tidying data with tidyr package 

install.packages("tidyr")
install.packages("stringi")
library(stringi)
library(tidyr)

#In this lesson, you'll learn how to tidy your data with the tidyr package.

#Tidy data is standard format. 
#tidy data satisfies 3 conditions
    #each variable forms a column
    #each obs forms a row
    #each type of obs unit forms a table 

#use the gather() function from tidyr to have one column for each of the variables 

gather(students, sex, count, -grade) #gets all columns except grade
#combined the variables for A-Male and A-Female, etc ...
    
#now lets see multiple variables stored in one column 

res<-gather(students2, sex_class, count, -grade)
#print res to see it's change
res

#still there are two diff variables (sex and class) stored together in teh sex_class column. tidyr can provide convenient separate() function to separate one column in to multiple. 

?separate
separate(res,sex_class,into=c("sex","class")) #we didn't use the sep argument, which is sometimes necessary to tell R how to separate the column 
#it splits on non alphanumeric values. 


# Repeat your calls to gather() and separate(), but this time
# use the %>% operator to chain the commands together without
# storing an intermediate result.
#
# If this is your first time seeing the %>% operator, check
# out ?chain, which will bring up the relevant documentation.
# You can also look at the Examples section at the bottom
# of ?gather and ?separate.
#
# The main idea is that the result to the left of %>%
# takes the place of the first argument of the function to
# the right. Therefore, you OMIT THE FIRST ARGUMENT to each
# function.
#
students2 %>%
  gather(sex_class, count, -grade) %>%
  separate(sex_class, c("sex","class")) %>%
  print

  
#sometimes variables are stored as rows and columns
#    name    test class1 class2 class3 class4 class5
#1  Sally midterm      A   <NA>      B   <NA>   <NA>
#2  Sally   final      C   <NA>      C   <NA>   <NA>
#3   Jeff midterm   <NA>      D   <NA>      A   <NA>
#4   Jeff   final   <NA>      E   <NA>      C   <NA>
#5  Roger midterm   <NA>      C   <NA>   <NA>      B
#6  Roger   final   <NA>      A   <NA>   <NA>      A
#7  Karen midterm   <NA>   <NA>      C      A   <NA>
#8  Karen   final   <NA>   <NA>      C      A   <NA>
#9  Brian midterm      B   <NA>   <NA>   <NA>      A
#10 Brian   final      B   <NA>   <NA>   <NA>      C

#| In students3, we have midterm and final exam grades for five
#| students, each of whom were enrolled in exactly two of five
#| possible classes.

#| The first variable, name, is already a column and should
#| remain as it is. The headers of the last five columns,
#| class1 through class5, are all different values of what
#| should be a class variable. The values in the test column,
#| midterm and final, should each be its own variable
#| containing the respective grades for each student.

#| This will require multiple steps, which we will build up
#| gradually using %>%. Edit the R script, save it, then type
#| submit() when you are ready. Type reset() to reset the
#| script to its original state.

#script begin:
# Call gather() to gather the columns class1 through
# through class5 into a new variable called class.
# The 'key' should be class, and the 'value'
# should be grade.
#
# tidyr makes it easy to reference multiple adjacent
# columns with class1:class5, just like with sequences
# of numbers.
#
# Since each student is only enrolled in two of
# the five possible classes, there are lots of missing
# values (i.e. NAs). Use the argument na.rm = TRUE
# to omit these values from the final result.
#
# Remember that when you're using the %>% operator,
# the value to the left of it gets inserted as the
# first argument to the function on the right.
#
# Consult ?gather and/or ?chain if you get stuck.
#
students3 %>%
  gather(class,grade,class1:class5 ,na.rm = TRUE) %>%
  print
#recall gather(data, key, value, ..., na.rm = FALSE, convert = FALSE)


#next part will require spread()
?spread


#sometimes variables are stored as rows and columns
#    name    test class1 class2 class3 class4 class5
#1  Sally midterm      A   <NA>      B   <NA>   <NA>
#2  Sally   final      C   <NA>      C   <NA>   <NA>
#3   Jeff midterm   <NA>      D   <NA>      A   <NA>
#4   Jeff   final   <NA>      E   <NA>      C   <NA>
#5  Roger midterm   <NA>      C   <NA>   <NA>      B
#6  Roger   final   <NA>      A   <NA>   <NA>      A
#7  Karen midterm   <NA>   <NA>      C      A   <NA>
#8  Karen   final   <NA>   <NA>      C      A   <NA>
#9  Brian midterm      B   <NA>   <NA>   <NA>      A
#10 Brian   final      B   <NA>   <NA>   <NA>      C

#turns into...

#    name    test  class grade
#1  Sally midterm class1     A
#2  Sally   final class1     C
#3  Brian midterm class1     B
#4  Brian   final class1     B
#5   Jeff midterm class2     D
#6   Jeff   final class2     E
#7  Roger midterm class2     C
#8  Roger   final class2     A
#9  Sally midterm class3     B
#10 Sally   final class3     C
#11 Karen midterm class3     C
#12 Karen   final class3     C
#13  Jeff midterm class4     A
#14  Jeff   final class4     C
#15 Karen midterm class4     A
#16 Karen   final class4     A
#17 Roger midterm class5     B
#18 Roger   final class5     A
#19 Brian midterm class5     A
#20 Brian   final class5     C

#script start:
# This script builds on the previous one by appending
# a call to spread(), which will allow us to turn the
# values of the test column, midterm and final, into
# column headers (i.e. variables).
#
# You only need to specify two arguments to spread().
# Can you figure out what they are? (Hint: You don't
# have to specify the data argument since we're using
# the %>% operator.
#
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  print
#spread(data, key, value, fill = NA, convert = FALSE, drop = TRUE)

#produces ...

#    name  class final midterm
#1  Brian class1     B       B
#2  Brian class5     C       A
#3   Jeff class2     E       D
#4   Jeff class4     C       A
#5  Karen class3     C       C
#6  Karen class4     A       A
#7  Roger class2     A       C
#8  Roger class5     A       B
#9  Sally class1     C       A
#10 Sally class3     C       B

#we want the classes to be numeric (eg class 1 = 1) 
#this requires extract_numeric()

?extract_numeric
extract_numeric("class5") #returns 5

# We want the values in the class columns to be
# 1, 2, ..., 5 and not class1, class2, ..., class5.
#
# Use the mutate() function from dplyr along with
# extract_numeric(). Hint: You can "overwrite" a column
# with mutate() by assigning a new value to the existing
# column instead of creating a new column.
#
# Check out ?mutate and/or ?extract_numeric if you need
# a refresher.
#
#REMEMBER THIS IS WHAT WE ARE OPERATING ON 

#    name  class final midterm
#1  Brian class1     B       B
#2  Brian class5     C       A
#3   Jeff class2     E       D
#4   Jeff class4     C       A
#5  Karen class3     C       C
#6  Karen class4     A       A
#7  Roger class2     A       C
#8  Roger class5     A       B
#9  Sally class1     C       A
#10 Sally class3     C       B
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class=extract_numeric(class)) %>%
  print
#returns...
#    name class final midterm
#1  Brian     1     B       B
#2  Brian     5     C       A
#3   Jeff     2     E       D
#4   Jeff     4     C       A
#5  Karen     3     C       C
#6  Karen     4     A       A
#7  Roger     2     A       C
#8  Roger     5     A       B
#9  Sally     1     C       A
#10 Sally     3     C       B

#| The fourth messy data problem we'll look at occurs when
#| multiple observational units are stored in the same table.
#| students4 presents an example of this. Take a look at the
#| data now.

#    id  name sex class midterm final
#1  168 Brian   F     1       B     B
#2  168 Brian   F     5       A     C
#3  588 Sally   M     1       A     C
#4  588 Sally   M     3       B     C
#5  710  Jeff   M     2       D     E
#6  710  Jeff   M     4       A     C
#7  731 Roger   F     2       C     A
#8  731 Roger   F     5       B     A
#9  908 Karen   M     3       C     C
#10 908 Karen   M     4       A     A

#| students4 is almost the same as our tidy version of
#| students3. The only difference is that students4 provides a
#| unique id for each student, as well as his or her sex (M =
#| male; F = female).

#| At first glance, there doesn't seem to be much of a problem
#| with students4. All columns are variables and all rows are
#| observations. However, notice that each id, name, and sex is
#| repeated twice, which seems quite redundant. This is a hint
#| that our data contains multiple observational units in a
#| single table.

#| Our solution will be to break students4 into two separate
#| tables -- one containing basic student information (id,
#| name, and sex) and the other containing grades (id, class,
#| midterm, final).
#| 
#| Edit the R script, save it, then type submit() when you are
#| ready. Type reset() to reset the script to its original
#| state.

#begin script:

# Complete the chained command below so that we are
# selecting the id, name, and sex column from students4
# and storing the result in student_info.
#
student_info <- students4 %>%
  select(id,name,sex) %>%
  print
#returns...

#    id  name sex
#1  168 Brian   F
#2  168 Brian   F
#3  588 Sally   M
#4  588 Sally   M
#5  710  Jeff   M
#6  710  Jeff   M
#7  731 Roger   F
#8  731 Roger   F
#9  908 Karen   M
#10 908 Karen   M

#| Notice anything strange about student_info? It contains five
#| duplicate rows! See the script for directions on how to fix
#| this. Save the script and type submit() when you are ready,
#| or type reset() to reset the script to its original state.


  
#| Notice anything strange about student_info? It contains five
#| duplicate rows! See the script for directions on how to fix
#| this. Save the script and type submit() when you are ready,
#| or type reset() to reset the script to its original state.

student_info #note five duplicate rows, not unique observations

#    id  name sex
#1  168 Brian   F
#2  168 Brian   F
#3  588 Sally   M
#4  588 Sally   M
#5  710  Jeff   M
#6  710  Jeff   M
#7  731 Roger   F
#8  731 Roger   F
#9  908 Karen   M
#10 908 Karen   M

#start script:

# Add a call to unique() below, which will remove
# duplicate rows from student_info.
#
# Like with the call to the print() function below,
# you can omit the parentheses after the function name.
# This is a nice feature of %>% that applies when
# there are no additional arguments to specify.
#
student_info <- students4 %>%
  select(id, name, sex) %>%
  unique %>%
  print

#returns
#   id  name sex
#1 168 Brian   F
#3 588 Sally   M
#5 710  Jeff   M
#7 731 Roger   F
#9 908 Karen   M

#| Now, using the script I just opened for you, create a second
#| table called gradebook using the id, class, midterm, and
#| final columns (in that order).
#| 
#| Edit the R script, save it, then type submit() when you are
#| ready. Type reset() to reset the script to its original
#| state.

# select() the id, class, midterm, and final columns
# (in that order) and store the result in gradebook.
#
gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print

#returns
#    id class midterm final
#1  168     1       B     B
#2  168     5       A     C
#3  588     1       A     C
#4  588     3       B     C
#5  710     2       D     E
#6  710     4       A     C
#7  731     2       C     A
#8  731     5       B     A
#9  908     3       C     C
#10 908     4       A     A

#| It's important to note that we left the id column in both
#| tables. In the world of relational databases, 'id' is called
#| our 'primary key' since it allows us to connect each student
#| listed in student_info with their grades listed in
#| gradebook. Without a unique identifier, we might not know
#| how the tables are related. (In this case, we could have
#| also used the name variable, since each student happens to
#| have a unique name.)



#| The fifth and final messy data scenario that we'll address
#| is when a single observational unit is stored in multiple
#| tables. It's the opposite of the fourth problem.

#| To illustrate this, we've created two datasets, passed and
#| failed. Take a look at passed now.
#passed
#   name class final
#1 Brian     1     B
#2 Roger     2     A
#3 Roger     5     A
#4 Karen     4     A
#failed
#   name class final
#1 Brian     5     C
#2 Sally     1     C
#3 Sally     3     C
#4  Jeff     2     E
#5  Jeff     4     C
#6 Karen     3     C

#| The name of each dataset actually represents the value of a
#| new variable that we will call 'status'. Before joining the
#| two tables together, we'll add a new column to each
#| containing this information so that its not lost when we put
#| everything together.

#| Use dplyr's mutate() to add a new column to the passed
#| table. The column should be called status and the value,
#| "passed" (a character string), should be the same for all
#| students. 'Overwrite' the current version of passed with the
#| new one.

passed <- passed %>%
    mutate("status" = "passed")

failed <- failed %>%
    mutate("status" = "failed")

#| Now, pass as arguments the passed and failed tables (in
#| order) to the dplyr function bind_rows(), which will join
#| them together into a single unit. Check ?bind_rows if you
#| need help.
#| 
#| Note: bind_rows() is only available in dplyr 0.4.0 or later.
#| If you have an older version of dplyr, please quit the
#| lesson, update dplyr, then restart the lesson where you left
#| off. If you're not sure what version of dplyr you have, type
#| packageVersion('dplyr').


bind_rows(passed, failed)

#    name class final status
#1  Brian     1     B passed
#2  Roger     2     A passed
#3  Roger     5     A passed
#4  Karen     4     A passed
#5  Brian     5     C failed
#6  Sally     1     C failed
#7  Sally     3     C failed
#8   Jeff     2     E failed
#9   Jeff     4     C failed
#10 Karen     3     C failed

#| Of course, we could arrange the rows however we wish at this
#| point, but the important thing is that each row is an
#| observation, each column is a variable, and the table
#| contains a single observational unit. Thus, the data are
#| tidy.

#PUTTING IT TOGETHER

#| The SAT is a popular college-readiness exam in the United
#| States that consists of three sections: critical reading,
#| mathematics, and writing. Students can earn up to 800 points
#| on each section. This dataset presents the total number of
#| students, for each combination of exam section and sex,
#| within each of six score ranges. It comes from the 'Total
#| Group Report 2013', which can be found here:
#| 
#| http://research.collegeboard.org/programs/sat/data/cb-seniors-2013

sat 

#  score_range read_male read_fem read_total math_male math_fem
#1     700-800     40151    38898      79049     74461    46040
#2     600-690    121950   126084     248034    162564   133954
#3     500-590    227141   259553     486694    233141   257678
#4     400-490    242554   296793     539347    204670   288696
#5     300-390    113568   133473     247041     82468   131025
#6     200-290     30728    29154      59882     18788    26562
#Variables not shown: math_total (int), write_male (int),
#  write_fem (int), write_total (int)

#| As we've done before, we'll build up a series of chained
#| commands, using functions from both tidyr and dplyr. Edit
#| the R script, save it, then type submit() when you are
#| ready. Type reset() to reset the script to its original
#| state.

# Accomplish the following three goals:
#
# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Selection' section of ?select.
#
# 2. gather() all columns EXCEPT score_range, using
# key = part_sex and value = count.
#
# 3. separate() part_sex into two separate variables (columns),
# called "part" and "sex", respectively. You may need to check
# the 'Examples' section of ?separate to remember how the 'into'
# argument should be phrased.
#
sat %>% 
    select(-contains("total")) %>%
    gather(part_sex, count, -c(score_range)) %>%
    separate(part_sex,into = c("part","sex")) %>% 
    print

#separate(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
#  convert = FALSE, extra = "error", ...)

#   score_range part  sex  count
#1      700-800 read male  40151
#2      600-690 read male 121950
#3      500-590 read male 227141
#4      400-490 read male 242554
#5      300-390 read male 113568
#6      200-290 read male  30728
#7      700-800 read  fem  38898
#8      600-690 read  fem 126084
#9      500-590 read  fem 259553
#10     400-490 read  fem 296793
#..         ...  ...  ...    ...

#| Finish off the job by following the directions in the
#| script. Save the script and type submit() when you are
#| ready, or type reset() to reset the script to its original
#| state.



# Append two more function calls to accomplish the following:
#
# 1. Use group_by() (from dplyr) to group the data by part and
# sex, in that order.
#
# 2. Use mutate to add two new columns, whose values will be
# automatically computed group-by-group:
#
#   * total = sum(count)
#   * prop = count / total
#
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count / total 
  ) %>% print

#group_by(.data, ..., add = FALSE)

#returns  

#   score_range part  sex  count  total       prop
#1      700-800 read male  40151 776092 0.05173485
#2      600-690 read male 121950 776092 0.15713343
#3      500-590 read male 227141 776092 0.29267278
#4      400-490 read male 242554 776092 0.31253253
#5      300-390 read male 113568 776092 0.14633317
#6      200-290 read male  30728 776092 0.03959324
#7      700-800 read  fem  38898 883955 0.04400450
#8      600-690 read  fem 126084 883955 0.14263622
#9      500-590 read  fem 259553 883955 0.29362694
#10     400-490 read  fem 296793 883955 0.33575578
#..         ...  ...  ...    ...    ...        ...





#####################################################################################################################################################################################################################

#GETTING AND CLEANING DATA LESSON 4 SWIRL

install.packages("lubridate")
library(lubridate)

#| In this lesson, we'll explore the lubridate R
#| package, by Garrett Grolemund and Hadley
#| Wickham. According to the package authors,
#| "lubridate has a consistent, memorable syntax,
#| that makes working with dates fun instead of
#| frustrating." If you've ever worked with dates
#| in R, that statement probably has your
#| attention.

#| Unfortunately, due to different date and time
#| representations, this lesson is only guaranteed
#| to work with an "en_US.UTF-8" locale. To view
#| your locale, type Sys.getlocale("LC_TIME").

Sys.getlocale("LC_TIME")
#[1] "English_United States.1252"
#| If the output above is not "en_US.UTF-8", this
#| lesson is not guaranteed to work correctly

#| lubridate was automatically installed (if
#| necessary) and loaded upon starting this
#| lesson. To build the habit, we'll go ahead and
#| (re)load the package now. Type
#| library(lubridate) to do so.

library(lubridate)

this_day <- today()
#[1] "2015-04-16"

#| There are three components to this date. In
#| order, they are year, month, and day. We can
#| extract any of these components using the
#| year(), month(), or day() function,
#| respectively. Try any of those on this_day now.

year(this_day)
month(this_day)
day(this_day)

#| We can also get the day of the week from
#| this_day using the wday() function. It will be
#| represented as a number, such that 1 = Sunday,
#| 2 = Monday, 3 = Tuesday, etc. Give it a shot.

wday(this_day)
#[1] 5
#1=sun, 3=tues, 5=thurs, 7=sat 

#| Now try the same thing again, except this time
#| add a second argument, label = TRUE, to display
#| the *name* of the weekday (represented as an
#| ordered factor).

wday(this_day,label=TRUE)

#| In addition to handling dates, lubridate is
#| great for working with date and time
#| combinations, referred to as date-times. The
#| now() function returns the date-time
#| representing this exact moment in time. Give it
#| a try and store the result in a variable called
#| this_moment.

this_moment<-now()
this_moment 

#[1] "2015-04-16 13:51:47 CDT"

#| Just like with dates, we can extract the year,
#| month, day, or day of week. However, we can
#| also use hour(), minute(), and second() to
#| extract specific time information. Try any of
#| these three new functions now to extract one
#| piece of time information from this_moment.

hour(this_moment)
minute(this_moment)
second(this_moment)

#| To see how these functions work, try
#| ymd("1989-05-17"). You must surround the date
#| with quotes. Store the result in a variable
#| called my_date.

my_date<-ymd("1986-12-26")
my_date
#[1] "1986-12-26 UTC"

#| It looks almost the same, except for the
#| addition of a time zone, which we'll discuss
#| later in the lesson. Below the surface, there's
#| another important change that takes place when
#| lubridate parses a date. Type class(my_date) to
#| see what that is.

class(my_date)
#[1] "POSIXct" "POSIXt" 

#| So ymd() took a character string as input and
#| returned an object of class POSIXct. It's not
#| necessary that you understand what POSIXct is,
#| but just know that it is one way that R stores
#| date-time information internally.

#| "1989-05-17" is a fairly standard format, but
#| lubridate is 'smart' enough to figure out many
#| different date-time formats. Use ymd() to parse
#| "1989 May 17". Don't forget to put quotes
#| around the date!


ymd("1989 May 17")
#[1] "1989-05-17 UTC"

#| Despite being formatted differently, the last
#| two dates had the year first, then the month,
#| then the day. Hence, we used ymd() to parse
#| them. What do you think the appropriate
#| function is for parsing "March 12, 1975"? Give
#| it a try.

mdy("March 12, 1975")
#[1] "1975-03-12 UTC"

dmy(25081985)
#[1] "1985-08-25 UTC"

#| But be careful, it's not magic. Try
#| ymd("192012") to see what happens when we give
#| it something more ambiguous. Surround the
#| number with quotes again, just to be consistent
#| with the way most dates are represented (as
#| character strings).

#| You got a warning message because it was
#| unclear what date you wanted. When in doubt,
#| it's best to be more explicit. Repeat the same
#| command, but add two dashes OR two forward
#| slashes to "192012" so that it's clear we want
#| January 2, 1920.

ymd("1920-1-2")
#[1] "1920-01-02 UTC"

#| In addition to dates, we can parse date-times.
#| I've created a date-time object called dt1.
#| Take a look at it now.

dt1
#[1] "2014-08-23 17:23:02"

ymd_hms(dt1)
#[1] "2014-08-23 17:23:02 UTC"

#| What if we have a time, but no date? Use the
#| appropriate lubridate function to parse
#| "03:22:14" (hh:mm:ss).

hms("03:22:14")

#| lubridate is also capable of handling vectors
#| of dates, which is particularly helpful when
#| you need to parse an entire column of data.
#| I've created a vector of dates called dt2. View
#| its contents now.

dt2
#[1] "2014-05-14" "2014-09-22" "2014-07-11"

ymd(dt2)

#| The update() function allows us to update one
#| or more components of a date-time. For example,
#| let's say the current time is 08:34:55
#| (hh:mm:ss). Update this_moment to the new time
#| using the following command:
#| 
#| update(this_moment, hours = 8, minutes = 34,
#| seconds = 55).

this_moment
update(this_moment,hours=8,minutes=34,seconds=55)
[1] "2015-04-16 08:34:55 CDT"

#| It's important to recognize that the previous
#| command does not alter this_moment unless we
#| reassign the result to this_moment. To see
#| this, print the contents of this_moment.

this_moment
#[1] "2015-04-16 13:51:47 CDT"

#| Unless you're a superhero, some time has passed
#| since you first created this_moment. Use
#| update() to make it match the current time,
#| specifying at least hours and minutes. Assign
#| the result to this_moment, so that this_moment
#| will contain the new time.

this_moment<-update(this_moment,hours=2,minutes=17)
this_moment 
#[1] "2015-04-16 02:17:47 CDT"

#| Now, pretend you are in New York City and you
#| are planning to visit a friend in Hong Kong.
#| You seem to have misplaced your itinerary, but
#| you know that your flight departs New York at
#| 17:34 (5:34pm) the day after tomorrow. You also
#| know that your flight is scheduled to arrive in
#| Hong Kong exactly 15 hours and 50 minutes after
#| departure.

#| Let's reconstruct your itinerary from what you
#| can remember, starting with the full date and
#| time of your departure. We will approach this
#| by finding the current date in New York, adding
#| 2 full days, then setting the time to 17:34.

#| To find the current date in New York, we'll use
#| the now() function again. This time, however,
#| we'll specify the time zone that we want:
#| "America/New_York". Store the result in a
#| variable called nyc. Check out ?now if you need
#| help.

nyc<-now("America/New_York")

#| For a complete list of valid time zones for use
#| with lubridate, check out the following
#| Wikipedia page:
#| 
#| http://en.wikipedia.org/wiki/List_of_tz_database_time_zones

nyc
#[1] "2015-04-16 15:20:22 EDT"

#| Your flight is the day after tomorrow (in New
#| York time), so we want to add two days to nyc.
#| One nice aspect of lubridate is that it allows
#| you to use arithmetic operators on dates and
#| times. In this case, we'd like to add two days
#| to nyc, so we can use the following expression:
#| nyc + days(2). Give it a try, storing the
#| result in a variable called depart.

depart<-nyc+days(2)
depart
#[1] "2015-04-18 15:20:22 EDT"

#| So now depart contains the date of the day
#| after tomorrow. Use update() to add the correct
#| hours (17) and minutes (34) to depart. Reassign
#| the result to depart.

depart<-update(depart,hours=17,minutes=34)
depart
#[1] "2015-04-18 17:34:22 EDT"

#| Your friend wants to know what time she should
#| pick you up from the airport in Hong Kong. Now
#| that we have the exact date and time of your
#| departure from New York, we can figure out the
#| exact time of your arrival in Hong Kong.

arrive<-depart+hours(15)+minutes(50)

#| The arrive variable contains the time that it
#| will be in New York when you arrive in Hong
#| Kong. What we really want to know is what time
#| is will be in Hong Kong when you arrive, so
#| that your friend knows when to meet you.

#| The with_tz() function returns a date-time as
#| it would appear in another time zone. Use
#| ?with_tz to check out the documentation.

?with_tz
#with_tz(time, tzone = "")

#| Use with_tz() to convert arrive to the
#| "Asia/Hong_Kong" time zone. Reassign the result
#| to arrive, so that it will get the new value.

arrive<-with_tz(arrive,"Asia/Hong_Kong")

arrive 
#[1] "2015-04-19 21:24:22 HKT"

#| Fast forward to your arrival in Hong Kong. You
#| and your friend have just met at the airport
#| and you realize that the last time you were
#| together was in Singapore on June 17, 2008.
#| Naturally, you'd like to know exactly how long
#| it has been.

#| Use the appropriate lubridate function to parse
#| "June 17, 2008", just like you did near the
#| beginning of this lesson. This time, however,
#| you should specify an extra argument, tz =
#| "Singapore". Store the result in a variable
#| called last_time.

last_time<-mdy("June 17, 2008",tz="Singapore")
last_time
#[1] "2008-06-17 SGT"

?new_interval
#new_interval(start, end, tzone = attr(start, "tzone"))

#| Create a new_interval() that spans from
#| last_time to arrive. Store it in a new variable
#| called how_long

how_long<-new_interval(last_time,arrive)

#| Now use as.period(how_long) to see how long
#| it's been.

as.period(how_long)
#[1] "6y 10m 2d 21H 24M 22.2164700031281S"

#| This is where things get a little tricky.
#| Because of things like leap years, leap
#| seconds, and daylight savings time, the length
#| of any given minute, day, month, week, or year
#| is relative to when it occurs. In contrast, the
#| length of a second is always the same,
#| regardless of when it occurs.

#| To address these complexities, the authors of
#| lubridate introduce four classes of time
#| related objects: instants, intervals,
#| durations, and periods. These topics are beyond
#| the scope of this lesson, but you can find a
#| complete discussion in the 2011 Journal of
#| Statistical Software paper titled 'Dates and
#| Times Made Easy with lubridate'.

#| This concludes our introduction to working with
#| dates and times in lubridate. I created a
#| little timer that started running in the
#| background when you began this lesson. Type
#| stopwatch() to see how long you've been
#| working!

stopwatch() #shows how long i've been working 
#[1] "51M 42.3517091274261S"








####

## Exploratory Data Analysis Swirl Lecture 1 
# Principles of Analytic Graphs 

library(ggplot2)

install.packages("jpeg")
library(jpeg)

#| In this lesson, we'll discuss some basic
#| principles of presenting data effectively.
#| These will illustrate some fundamental concepts
#| of displaying results in order to make them
#| more meaningful and convincing. These
#| principles are cribbed from Edward Tufte's
#| great 2006 book, Beautiful Evidence. You can
#| read more about them at the www.edwardtufte.com
#| website.

#| As a warm-up, which of the following would NOT
#| be a good use of analytic graphing?

#1: To decide which horse to bet on at the track
#2: To show causality, mechanism, explanation
#3: To show comparisons
#4: To show multivariate data

#1 

#| You're ready to start. Graphs give us a visual
#| form of data, and the first principle of
#| analytic graphs is to show some comparison.
#| You'll hear more about this when you study
#| statistical inference (another great course
#| BTW), but evidence for a hypothesis is always
#| relative to another competing or alternative
#| hypothesis.

#| When presented with a claim that something is
#| good, you should always ask "Compared to What?"
#| This is why in commercials you often hear the
#| phrase "other leading brands". An implicit
#| comparison, right?

#| Consider this boxplot which shows the
#| relationship between the use of an air cleaner
#| and the number of symptom-free days of
#| asthmatic children. (The top and bottom lines
#| of the box indicate the 25% and 75% quartiles
#| of the data, and the horizontal line in the box
#| shows the 50%.) Since the box is above 0, the
#| number of symptom-free days for children with
#| asthma is bigger using the air cleaner. This is
#| good, right?

#| While it's somewhat informative, it's also
#| somewhat cryptic, since the y-axis is claiming
#| to show a change in number of symptom-free
#| days. Wouldn't it be better to show a
#| comparison?

#| Like this? Here's a graphic which shows two
#| boxplots, the one on the left showing the
#| results for a control group that doesn't use an
#| air cleaner alongside the previously shown
#| boxplot.

#| By showing the two boxplots side by side, you
#| can clearly see that using the air cleaner
#| increases the number of symptom-free days for
#| most asthmatic children. The plot on the right
#| (using the air cleaner) is generally higher
#| than the one on the left (the control group).

#| What does this graph NOT show you?

#1: Half the children in the control group had no improvement
#2: Using the air cleaner makes asthmatic children sicker
#3: Children in the control group had at most 3 symptom-free days
#4: 75% of the children using the air cleaner had at most 3 symptom-free days

#2 

#| So the first principle was to show a
#| comparison. The second principle is to show
#| causality or a mechanism of how your theory of
#| the data works. This explanation or systematic
#| structure shows your causal framework for
#| thinking about the question you're trying to
#| answer.

#| Consider this plot which shows the dual boxplot
#| we just showed, but next to it we have a
#| corresponding plot of changes in measures of
#| particulate matter.

#| This picture tries to explain how the air
#| cleaner increases the number of symptom-free
#| days for asthmatic children. What mechanism
#| does the graph imply?

#That the air cleaner reduces pollution

#| By showing the two sets of boxplots side by
#| side you're explaining your theory of why the
#| air cleaner increases the number of
#| symptom-free days. Onward!

#| So the first principle was to show some
#| comparison, the second was to show a mechanism,
#| so what will the third principle say to show?

# 1 COMPARISON, 2 MECHANISM 3 ... IS?
# MULTIVARIATE DATA!

#| What is multivariate data you might ask? In
#| technical (scientific) literature this term
#| means more than 2 variables. Two-variable plots
#| are what you saw in high school algebra.
#| Remember those x,y plots when you were learning
#| about slopes and intercepts and equations of
#| lines? They're valuable, but usually questions
#| are more complicated and require more
#| variables.

#| Sometimes, if you restrict yourself to two
#| variables you'll be misled and draw an
#| incorrect conclusion.

#| Consider this plot which shows the relationship
#| between air pollution (x-axis) and mortality
#| rates among the elderly (y-axis). The blue
#| regression line shows a surprising result.
#| (You'll learn about regression lines when you
#| take the fabulous Regression Models course.)

#| Fewer deaths with more pollution? That's a
#| surprise! Something's gotta be wrong, right? In
#| fact, this is an example of Simpson's paradox,
#| or the Yule–Simpson effect. Wikipedia
#| (http://en.wikipedia.org/wiki/Simpson%27s_paradox)
#| tells us that this "is a paradox in probability
#| and statistics, in which a trend that appears
#| in different groups of data disappears when
#| these groups are combined."

#| Suppose we divided this mortality/pollution
#| data into the four seasons. Would we see
#| different trends?

#| Yes, we do! Plotting the same data for the 4
#| seasons individually we see a different result

#NOTE ALL ARE POSITIVE REGRESSION LINES NOW NOT NEGATIVE 

# AS POLLUTION INCREASES MORE PPL DIE IN ALL SEASONS 

#| The fourth principle of analytic graphing
#| involves integrating evidence. This means not
#| limiting yourself to one form of expression.
#| You can use words, numbers, images as well as
#| diagrams. Graphics should make use of many
#| modes of data presentation. Remember, "Don't
#| let the tool drive the analysis!"

#| To show you what we mean, here's an example of
#| a figure taken from a paper published in the
#| Journal of the AMA. It shows the relationship
#| between pollution and hospitalization of people
#| with heart disease. As you can see, it's a lot
#| different from our previous plots. The solid
#| circles in the center portion indicate point
#| estimates of percentage changes in
#| hospitalization rates for different levels of
#| pollution. The lines through the circles
#| indicate confidence intervals associated with
#| these estimates. (You'll learn more about
#| confidence intervals in another great course,
#| this one on statistical inference.)

#| Note that on the right side of the figure is
#| another column of numbers, one for each of the
#| point estimates given. This column shows
#| posterior probabilities that relative risk is
#| greater than 0. This, in effect, is a measure
#| of the strength of the evidence showing the
#| correlation between pollution and
#| hospitalization.  The point here is that all of
#| this information is located in one picture so
#| that the reader can see the strength of not
#| only the correlations but the evidence as well.

#| The fifth principle of graphing involves
#| describing and documenting the evidence with
#| sources and appropriate labels and scales.
#| Credibility is important so the data graphics
#| should tell a complete story. Also, using R,
#| you want to preserve any code you use to
#| generate your data and graphics so that the
#| research can be replicated if necessary. This
#| allows for easy verification or finding bugs in
#| your analysis.

#| The sixth and final principle of analytic
#| graphing is maybe the most important. Content
#| is King! If you don't have something
#| interesting to report, your graphs won't save
#| you. Analytical presentations ultimately stand
#| or fall depending on the quality, relevance,
#| and integrity of their content.



#################################################
#Exploratory Data Analysis part 2 in Swirl
#Exploratory Graphs


#| Exploratory_Graphs. (Slides for this and other Data
#| Science courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/.
#| If you care to use them, they must be downloaded as
#| a zip file and viewed locally. This lesson
#| corresponds to
#| 04_ExploratoryAnalysis/exploratoryGraphs.)

#| In this lesson, we'll discuss why graphics are an
#| important tool for data scientists and the special
#| role that exploratory graphs play in the field.

#...

#  |=                                           |   3%

#| Which of the following would NOT be a good reason
| to use graphics in data science?

#1: To understand data properties
#2: To find patterns in data
########3: To find a color that best matches the shirt you're wearing
#4: To suggest modeling strategies

#A picture is worth a 1000 words

#| Exploratory graphs serve mostly the same functions
#| as graphs. They help us find patterns in data and
#| understand its properties. They suggest modeling
#| strategies and help to debug analyses. We DON'T use
#| exploratory graphs to communicate results.

#| Instead, exploratory graphs are the initial step in
#| an investigation, the "quick and dirty" tool used
#| to point the data scientist in a fruitful
#| direction. A scientist might need to make a lot of
#| exploratory graphs in order to develop a personal
#| understanding of the problem being studied. Plot
#| details such as axes, legends, color and size are
#| cleaned up later to convey more information in an
#| aesthetically pleasing way.

#| To demonstrate these ideas, we've copied some data
#| for you from the U.S. Environmental Protection
#| Agency (EPA) which sets national ambient air
#| quality standards for outdoor air pollution. These
#| Standards say that for fine particle pollution
#| (PM2.5), the "annual mean, averaged over 3 years"
#| cannot exceed 12 micro grams per cubic meter. We
#| stored the data from the U.S. EPA web site in the
#| data frame pollution. Use the R function head to
#| see the first few entries of pollution.

#head(pollution)
#       pm25  fips region longitude latitude
#1  9.771185 01003   east -87.74826 30.59278
#2  9.993817 01027   east -85.84286 33.26581
#3 10.688618 01033   east -87.72596 34.73148
#4 11.337424 01049   east -85.79892 34.45913
#5 12.119764 01055   east -86.03212 34.01860
#6 10.827805 01069   east -85.35039 31.18973

#| We see right away that there's at least one county
#| exceeding the EPA's standard of 12 micrograms per
#| cubic meter. What else do we see?

#| We see 5 columns of data. The pollution count is in
#| the first column labeled pm25. We'll work mostly
#| with that. The other 4 columns are a fips code
#| indicating the state (first 2 digits) and county
#| (last 3 digits) with that count, the associated
#| region (east or west), and the longitude and
#| latitude of the area. Now run the R command dim
#| with pollution as an argument to see how long the
#| table is.

dim(pollution)
#[1] 576   5

#| So there are 576 entries in pollution. We'd like to
#| investigate the question "Are there any counties in
#| the U.S. that exceed that national standard (12
#| micro grams per cubic meter) for fine particle
#| pollution?" We'll look at several one dimensional
#| summaries of the data to investigate this question.

#| The first technique uses the R command summary, a
#| 5-number summary which returns 6 numbers. Run it
#| now with the pm25 column of pollution as its
#| argument. Recall that the construct for this is
#| pollution$pm25.

summary(pollution$pm25)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  3.383   8.549  10.050   9.836  11.360  18.440 


#| This shows us basic info about the pm25 data,
#| namely its Minimum (0 percentile) and Maximum (100
#| percentile) values, and three Quartiles of the
#| data. These last indicate the pollution measures at
#| which 25%, 50%, and 75% of the counties fall below.
#| In addition to these 5 numbers we see the Mean or
#| average measure of particulate pollution across the
#| 576 counties.

#| To save you a lot of typing we've saved off
#| pollution$pm25 for you in the variable ppm. You can
#| use ppm now in place of the longer expression. Try
#| it now as the argument of the R command quantile.
#| See how the results look a lot like the results of
#| the output of the summary command.

quantile(ppm)
#       0%       25%       50%       75%      100% 
# 3.382626  8.548799 10.046697 11.356012 18.440731 

#| Now we'll plot a picture, specifically a boxplot.
#| Run the R command boxplot with ppm as an input.
#| Also specify the color parameter col equal to
#| "blue".

boxplot(ppm)

#| Not quite, but you're learning! Try again. Or, type
#| info() for more options.

#| Type boxplot(ppm,col="blue") at the command prompt.

boxplot(ppm,col="blue")


#| The boxplot shows us the same quartile data that
#| summary and quantile did. The lower and upper edges
#| of the blue box respectively show the values of the
#| 25% and 75% quantiles.

#...

#  |===========                                 |  24%

#| What do you think the horizontal line inside the
#| box represents? The MEAN.

#| The "whiskers" of the box (the vertical lines
#| extending above and below the box) relate to the
#| range parameter of boxplot, which we let default to
#| the value 1.5 used by R. The height of the box is
#| the interquartile range, the difference between the
#| 75th and 25th quantiles. In this case that
#| difference is 2.8. The whiskers are drawn to be a
#| length of range*2.8 or 1.5*2.8. This shows us
#| roughly how many, if any, data points are outliers,
#| that is, beyond this range of values.

#| Note that boxplot is part of R's base plotting
#| package. A nice feature that this package provides
#| is its ability to overlay features. That is, you
#| can add to (annotate) an existing plot.

#...

#  |============                                |  28%

#| To see this, run the R command abline with the
#| argument h equal to 12. Recall that 12 is the EPA
#| standard for air quality.

abline(h=12)

#| What do you think this command did?

#3: drew a horizontal line at 12

#| So abline "adds one or more straight lines through
#| the current plot." We see from the plot that the
#| bulk of the measured counties comply with the
#| standard since they fall under the line marking
#| that standard.

#| Now use the R command hist (another function from
#| the base package) with the argument ppm. Specify
#| the color parameter col equal to "green". This will
#| plot a histogram of the data.

#| The histogram gives us a little more detailed
#| information about our data, specifically the
#| distribution of the pollution counts, or how many
#| counties fall into each bucket of measurements.

#...

 # |===============                             |  35%

#Now run the R command rug with the argument ppm.

rug(ppm)

#| This one-dimensional plot, with its grayscale
#| representation, gives you a little more detailed
#| information about how many data points are in each
#| bucket and where they lie within the bucket. It
#| shows (through density of tick marks) that the
#| greatest concentration of counties has between 9
#| and 12 micrograms per cubic meter just as the
#| histogram did.

#| To illustrate this a little more, we've defined for
#| you two vectors, high and low, containing pollution
#| data of high (greater than 15) and low (less than
#| 5) values respectively. Look at low now and see how
#| it relates to the output of rug.

low
# [1] 3.494351 4.186090 4.917140 4.504539 4.793644
# [6] 4.601408 4.195688 4.625279 4.460193 4.978397
#[11] 4.324736 4.175901 3.382626 4.132739 4.955570
#[16] 4.565808

#| It confirms that there are two data points between
#| 3 and 4 and many between 4 and 5. Now look at high.

high
#[1] 16.19452 15.80378 18.44073 16.66180 15.01573
#[6] 17.42905 16.25190 16.18358

#| Again, we see one data point greater than 18, one
#| between 17 and 18, several between 16 and 17 and
#| two between 15 and 16, verifying what rug
#| indicated.

#| Now rerun hist with 3 arguments, ppm as its first,
#| col equal to "green", and the argument breaks equal
#| to 100.

hist(ppm, col="green", breaks=100)

#| So this histogram with more buckets is not nearly
#| as smooth as the preceding one. In fact, it's a
#| little too noisy to see the distribution clearly.
#| When you're plotting histograms you might have to
#| experiment with the argument breaks to get a good
#| idea of your data's distribution. For fun now,
#| rerun the R command rug with the argument ppm.

rug(ppm)

#| See how rug works with the existing plot? It
#| automatically adjusted its pocket size to that of
#| the last plot plotted.

#...

 # |=====================                       |  49%

#| Now rerun hist with ppm as the data and col equal
#| to "green".

#| Now run the command abline with the argument v
#| equal to 12 and the argument lwd equal to 2.

abline(v=12,lwd=2)

#| See the vertical line at 12? Not very visible, is
#| it, even though you specified a line width of 2?
#| Run abline with the argument v equal to
#| median(ppm), the argument col equal to "magenta",
#| and the argument lwd equal to 4.

abline(v=median(ppm),lwd=4,col="magenta")

#| Better, right? Thicker and more of a contrast in
#| color. This shows that although the median (50%) is
#| below the standard, there are a fair number of
#| counties in the U.S that have pollution levels
#| higher than the standard.

#| Now recall that our pollution data had 5 columns of
#| information. So far we've only looked at the pm25
#| column. We can also look at other information. To
#| remind yourself what's there run the R command
#| names with pollution as the argument.

names(pollution)
#[1] "pm25"      "fips"      "region"    "longitude"
#[5] "latitude"

#| Longitude and latitude don't sound interesting, and
#| each fips is unique since it identifies states
#| (first 2 digits) and counties (last 3 digits).
#| Let's look at the region column to see what's
#| there. Run the R command table on this column. Use
#| the construct pollution$region. Store the result in
#| the variable reg.

reg<-table(pollution$region)
reg

#east west 
# 442  134 

#| Lot more counties in the east than west. We'll use
#| the R command barplot (another type of
#| one-dimensional summary) to plot this information.
#| Call barplot with reg as its first argument, the
#| argument col equal to "wheat", and the argument
#| main equal to the string "Number of Counties in
#| Each Region".

barplot(reg,col="wheat",main="Number of Counties in Each Region")

#| So we've seen several examples of one-dimensional
#| graphs that summarize data. Two dimensional graphs
#| include scatterplots, multiple graphs which we'll
#| see more examples of, and overlayed one-dimensional
#| plots which the R packages such as lattice and
#| ggplot2 provide.

#| Some graphs have more than two-dimensions. These
#| include overlayed or multiple two-dimensional plots
#| and spinning plots. Some three-dimensional plots
#| are tricky to understand so have limited
#| applications. We'll see some examples now of more
#| complicated graphs, in particular, we'll show two
#| graphs together.

#| First we'll show how R, in one line and using base
#| plotting, can display multiple boxplots. We simply
#| specify that we want to see the pollution data as a
#| function of region. We know that our pollution data
#| characterized each of the 576 entries as belonging
#| to one of two regions (east and west).


#| We use the R formula construct y ~ x to show that y
#| (in this case pm25) depends on x (region). Since
#| both come from the same data frame (pollution) we
#| can specify a data argument set equal to pollution.
#| By doing this, we don't have to type pollution$pm25
#| (or ppm) and pollution$region. We can just specify
#| the formula pm25~region. Call boxplot now with this
#| formula as its argument, data equal to pollution,
#| and col equal to "red".

boxplot(pm25 ~ region, data=pollution, col="red")

#| Two for the price of one! Similarly we can plot
#| multiple histograms in one plot, though to do this
#| we have to use more than one R command. First we
#| have to set up the plot window with the R command
#| par which specifies how we want to lay out the
#| plots, say one above the other. We also use par to
#| specify margins, a 4-long vector which indicates
#| the number of lines for the bottom, left, top and
#| right. Type the R command
#| par(mfrow=c(2,1),mar=c(4,4,2,1)) now. Don't expect
#| to see any new result.

par(mfrow=c(2,1),mar=c(4,4,2,1))

#  |==============================              |  68%

#| So we set up the plot window for two rows and one
#| column with the mfrow argument. The mar argument
#| set up the margins. Before we plot the histograms
#| let's explore the R command subset which, not
#| surprisingly, "returns subsets of vectors, matrices
#| or data frames which meet conditions". We'll use
#| subset to pull off the data we want to plot. Call
#| subset now with pollution as its first argument and
#| a boolean expression testing region for equality
#| with the string "east". Put the result in the
#| variable east.

east<-subset(pollution, region=="east")

head(east)
 #      pm25  fips region longitude latitude
#1  9.771185 01003   east -87.74826 30.59278
#2  9.993817 01027   east -85.84286 33.26581
#3 10.688618 01033   east -87.72596 34.73148
#4 11.337424 01049   east -85.79892 34.45913
#5 12.119764 01055   east -86.03212 34.01860
#6 10.827805 01069   east -85.35039 31.18973

#| So east holds more information than we need. We
#| just want to plot a histogram with the pm25
#| portion. Call hist now with the pm25 portion of
#| east as its first argument and col equal to "green"
#| as its second.

hist(east$pm25,col="green")

#| See? The command par told R we were going to have one column with 2 rows,
#| so it placed this histogram in the top position.

#| Now, here's a challenge for you. Plot
#| the histogram of the counties from the
#| west using just one R command. Let the
#| appropriate subset command (with the
#| pm25 portion specified) be the first
#| argument and col (equal to "green") the
#| second.  To cut down on your typing,
#| use the up arrow key to get your last
#| command and replace "east" with the
#| subset command. Make sure the boolean
#| argument checks for equality between
#| region and "west".

hist(subset(pollution,region=="west")$pm25, col = "green")
#DID NOT GET RIGHT used skip()

#| See how R does all the labeling for
#| you? Notice that the titles are
#| different since we used different
#| commands for the two plots. Let's look
#| at some scatter plots now.

#| Scatter plots are two-dimensional plots
#| which show the relationship between two
#| variables, usually x and y. Let's look
#| at a scatterplot showing the
#| relationship between latitude and the
#| pm25 data. We'll use plot, a function
#| from R's base plotting package.

# We've seen that we can use a function
#| call as an argument when calling
#| another function. We'll do this again
#| when we call plot with the arguments
#| latitude and pm25 which are both from
#| our data frame pollution. We'll call
#| plot from inside the R command with
#| which evaluates "an R expression in an
#| environment constructed from data".
#| We'll use pollution as the first
#| argument to with and the call to plot
#| as the second. This allows us to avoid
#| typing "pollution$" before the arguents
#| to plot, so it saves us some typing and
#| adds to your base of R knowledge. Try
#| this now.

with(pollution, plot(latitude, pm25))

#| Note that the first argument is plotted
#| along the x-axis and the second along
#| the y. Now use abline to add a
#| horizontal line at 12. Use two
#| additional arguments, lwd equal to 2
#| and lty also equal to 2. See what
#| happens.

abline(h=12,lwd=2,lty=2)

#| See how lty=2 made the line dashed? Now
#| let's replot the scatterplot. This
#| time, instead of using with, call plot
#| directly with 3 arguments. The first 2
#| are pollution$latitude and ppm. The
#| third argument, col, we'll use to add
#| color and more information to our plot.
#| Set this argument (col) equal to
#| pollution$region and see what happens.

#wrong## plot(pollution$latitude,pollution$ppm,col=pollution$region)
plot(pollution$latitude, ppm, col= pollution$region)

#| We've got two colors on the map to
#| distiguish between counties in the east
#| and those in the west. Can we figure
#| out which color is east and which west?
#| See that the high (greater than 50) and
#| low (less than 25) latitudes are both
#| red. Latitudes indicate distance from
#| the equator, so which half of the U.S.
#| (east or west) has counties at the
#| extreme north and south?

#East

#| As before, use abline to add a
#| horizontal line at 12. Use two
#| additional arguments, lwd equal to 2
#| and lty also equal to 2.

abline(h=12,lwd=2,lty=2)

#| We see many counties are above the
#| healthy standard set by the EPA, but
#| it's hard to tell overall, which
#| region, east or west, is worse.

#| Let's plot two scatterplots
#| distinguished by region.

 # |======================================      |  86%

#| As we did with multiple histograms, we
#| first have to set up the plot window
#| with the R command par. This time,
#| let's plot the scatterplots side by
#| side (one row and two columns). We also
#| need to use different margins. Type the
#| R command par(mfrow = c(1, 2), mar =
#| c(5, 4, 2, 1)) now. Don't expect to see
#| any new result.

par(mfrow=c(1,2),mar=c(5,4,2,1))

#| For the first scatterplot, on the left,
#| we'll plot the latitudes and pm25
#| counts from the west. We already pulled
#| out the information for the counties in
#| the east. Let's now get the information
#| for the counties from the west. Create
#| the variable west by using the subset
#| command with pollution as the first
#| argument and the appropriate boolean as
#| the second.

west <- subset(pollution,region=="west")

#| Now call plot with three arguments.
#| These are west$latitude (x-axis),
#| west$pm25 (y-axis), and the argument
#| main equal to the string "West"
#| (title). Do this now.

plot(west$latitude,west$pm25,main="West")

#| For the second scatterplot, on the
#| right, we'll plot the latitudes and
#| pm25 counts from the east.

###BUG IN PROGRAM AGAIN!! CAN'T FINISH 

##############################################################################################################################################







# Swirl exploratory data analysis lecture 3 
# Graphing devices in R 

#| Graphics_Devices_in_R. (Slides for this and other Data Science
#| courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/. If you care
#| to use them, they must be downloaded as a zip file and viewed
#| locally. This lesson corresponds to
#| 04_ExploratoryAnalysis/Graphics_Devices_in_R.)

#| As the title suggests, this will be a short
#| lesson introducing you to graphics devices in
#| R. So, what IS a graphics device?

#| Would you believe that it is something where
#| you can make a plot appear, either a screen
#| device, such as a window on your computer, OR
#| a file device.

#| There are several different kinds of file
#| devices with particular characteristics and
#| hence uses. These include PDF, PNG, JPEG, SVG,
#| and TIFF. We'll talk more about these later.

#| To be clear, when you make a plot in R, it has
#| to be "sent" to a specific graphics device.
#| Usually this is the screen (the default
#| device), especially when you're doing
#| exploratory work. You'll send your plots to
#| files when you're ready to publish a report,
#| make a presentation, or send info to
#| colleagues.

#| How you access your screen device depends on
#| what computer system you're using. On a Mac
#| the screen device is launched with the call
#| quartz(), on Windows you use the call
#| windows(), and on Unix/Linux x11().  On a
#| given platform (Mac, Windows, Unix/Linux)
#| there is only one screen device, and obviously
#| not all graphics devices are available on all
#| platforms (i.e. you cannot launch windows() on
#| a Mac).

?Devices #shows what graphics devices are availsble on mym system 

#from site
#The following graphics devices are currently available:

#windows The graphics device for Windows (on screen, to printer and to Windows metafile).

#pdf Write PDF graphics commands to a file

#postscript Writes PostScript graphics commands to a file

#xfig Device for XFIG graphics file format

#bitmap bitmap pseudo-device via Ghostscript (if available).

#pictex Writes TeX/PicTeX graphics commands to a file (of historical interest only)

#The following devices will be functional if R was compiled to use them (they exist but will return with a warning on other systems):

#cairo_pdf, cairo_ps PDF and PostScript devices based on cairo graphics.

#svg SVG device based on cairo graphics.

#png PNG bitmap device

#jpeg JPEG bitmap device

#bmp BMP bitmap device

#tiff TIFF bitmap device

#| There are two basic approaches to plotting.
#| The first, plotting to the screen, is the most
#| common. It's simple - you call a plotting
#| function like plot, xyplot, or qplot (which
#| you call depends on the plotting system you
#| favor, but that's another lesson), so that the
#| plot appears on the screen. Then you annotate
#| (add to) the plot if necessary.

#| As an example, run the R command with with 2
#| arguments. The first is a dataset, faithful,
#| which comes with R, and the second is a call
#| to the base plotting function plot. Your call
#| to plot should have two arguments, eruptions
#| and waiting. Try this now to see what happens.

with(faithful, plot(eruptions, waiting))

#| See how R created a scatterplot on the screen
#| for you? This shows that relationship between
#| eruptions of the geyser Old Faithful and
#| waiting time. Now use the R function title
#| with the argument main set equal to the string
#| "Old Faithful Geyser data". This is an
#| annotation to the plot.

title("Old Faithful Geyser data")

#| Simple, right?  Now run the command dev.cur().
#| This will show you the current plotting
#| device, the screen.

dev.cur()
#RStudioGD 
#        2 

#| The second way to create a plot is to send it
#| to a file device. Depending on the type of
#| plot you're making, you explicitly launch a
#| graphics device, e.g., a pdf file. Type the
#| command pdf(file="myplot.pdf") to launch the
#| file device. This will create the pdf file
#| myplot.pdf in your working directory.

pdf(file="myplot.pdf")

#| You then call the plotting function (if you
#| are using a file device, no plot will appear
#| on the screen). Run the with command again to
#| plot the Old Faithful data. Use the up arrow
#| key to recover the command and save yourself
#| some typing.

with(faithful, plot(eruptions, waiting))

#| Now rerun the title command and annotate the
#| plot. (Up arrow keys are great!)

#| Finally, when plotting to a file device, you
#| have to close the device with the command
#| dev.off(). This is very important! Don't do it
#| yet, though. After closing, you'll be able to
#| view the pdf file on your computer.

#| There are two basic types of file devices,
#| vector and bitmap devices. These use different
#| formats and have different characteristics.
#| Vector formats are good for line drawings and
#| plots with solid colors using a modest number
#| of points, while bitmap formats are good for
#| plots with a large number of points, natural
#| scenes or web-based plots.

#| We'll mention 4 specific vector formats. The
#| first is pdf, which we've just used in our
#| example. This is useful for line-type graphics
#| and papers. It resizes well, is usually
#| portable, but it is not efficient if a plot
#| has many objects/points.

#| The second is svg which is XML-based, scalable
#| vector graphics. This supports animation and
#| interactivity and is potentially useful for
#| web-based plots.

#| The last two vector formats are win.metafile,
#| a Windows-only metafile format, and postscript
#| (ps), an older format which also resizes well,
#| is usually portable, and can be used to create
#| encapsulated postscript files. Unfortunately,
#| Windows systems often don’t have a
#| postscript viewer.

#| We'll also mention 4 different bitmap formats.
#| The first is png (Portable Network Graphics)
#| which is good for line drawings or images with
#| solid colors. It uses lossless compression
#| (like the old GIF format), and most web
#| browsers can read this format natively. In
#| addition, png is good for plots with many
#| points, but it does not resize well.

#| In contrast, jpeg files are good for
#| photographs or natural scenes. They use lossy
#| compression, so they're good for plots with
#| many points. Files in jpeg format don't resize
#| well, but they can be read by almost any
#| computer and any web browser. They're not
#| great for line drawings.

#| The last two bitmap formats are tiff, an older
#| lossless compression meta-format and bmp which
#| is a native Windows bitmapped format.

#| Although it is possible to open multiple
#| graphics devices (screen, file, or both), when
#| viewing multiple plots at once, plotting can
#| only occur on one graphics device at a time.

#| The currently active graphics device can be
#| found by calling dev.cur(). Try it now to see
#| what number is assigned to your pdf device.

dev.cur()

#RStudioGD 
#        2 

#  |=============================================              |  76%

#| Now use dev.off() to close the device.

dev.off()
#null device 
#          1 

#| Now rerun dev.cur() to see what integer
#| your plotting window is assigned.

dev.cur()

#null device 
#          1 

#| The device is back to what it was when
#| you started. As you might have guessed,
#| every open graphics device is assigned
#| an integer greater than or equal to 2.
#| You can change the active graphics
#| device with dev.set(<integer>) where
#| <integer> is the number associated with
#| the graphics device you want to switch
#| to.

#| You can also copy a plot from one
#| device to another. This can save you
#| some time but beware! Copying a plot is
#| not an exact operation, so the result
#| may not be identical to the original. R
#| provides some functions to help you do
#| this. The function dev.copy copies a
#| plot from one device to another, and
#| dev.copy2pdf specifically copies a plot
#| to a PDF file.

#| Just for fun, rerun the with command
#| again, with(faithful, plot(eruptions,
#| waiting)), to plot the Old Faithful
#| data. Use the up arrow key to recover
#| the command if you don't feel like
#| typing.

with(faithful,plot(eruptions,waiting))

#| Now rerun the title command, title(main
#| = "Old Faithful Geyser data"), to
#| annotate the plot. (Up arrow keys are
#| great!)

title(main="Old Faithful Geyser data")

#| Now run dev.copy with the 2 arguments.
#| The first is png, and the second is
#| file set equal to "geyserplot.png".
#| This will copy your screen plot to a
#| png file in your working directory
#| which you can view AFTER you close the
#| device.

dev.copy(png, file="geyserplot.png")

#| Don't forget to close the PNG device!
#| Do it NOW!!! Then you'll be able to
#| view the file.

dev.off()

#END
###########################################################
###########################################################
###########################################################
###########################################################


#5: Base Plotting System

#| Base_Plotting_System. (Slides for this and other
#| Data Science courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/.
#| If you care to use them, they must be downloaded as
#| a zip file and viewed locally. This lesson
#| corresponds to 04_ExploratoryAnalysis/PlottingBase.)

#| The core plotting and graphics engine in R is
#| encapsulated in two packages. The first is the
#| graphics package which contains plotting functions
#| for the "base" system. The functions in this package
#| include plot, hist, boxplot, barplot, etc. The
#| second package is grDevices which contains all the
#| code implementing the various graphics devices,
#| including X11, PDF, PostScript, PNG, etc.

#| Base graphics are often constructed piecemeal, with
#| each aspect of the plot handled separately through a
#| particular function call. Usually you start with a
#| plot function (such as plot, hist, or boxplot), then
#| you use annotation functions (text, abline, points)
#| to add to or modify your plot.

#| Before making a plot you have to determine where the
#| plot will appear and what it will be used for.  Is
#| there a large amount of data going into the plot? Or
#| is it just a few points? Do you need to be able to
#| dynamically resize the graphic?

# drawback of base plotting system = 
# You can't go back once a plot has started

#| Yes! The base system is very intuitive and easy to
#| use. You can't go backwards, though, say, if you
#| need to readjust margins or have misspelled a
#| caption. A finished plot will be a series of R
#| commands, so it's difficult to translate a
#| finished plot into a different system.

#| Calling a basic routine such as plot(x, y) or
#| hist(x) launches a graphics device (if one is not
#| already open) and draws a new plot on the device.
#| If the arguments to plot or hist are not of some
#| special class, then the default method is called.

#| As you'll see, most of the base plotting functions
#| have many arguments, for example, setting the
#| title, labels of axes, plot character, etc. Some of
#| the parameters can be set when you call the
#| function or they can be added later in a separate
#| function call.

#| Now we'll go through some quick examples of basic
#| plotting before we delve into gory details. We'll
#| use the dataset airquality (part of the library
#| datasets) which we've loaded for you. This shows
#| ozone and other air measurements for New York City
#| for 5 months in 1973.

#| Use the R command head with airquality as an
#| argument to see what the data looks like.

head(airquality)

#  Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2
#3    12     149 12.6   74     5   3
#4    18     313 11.5   62     5   4
#5    NA      NA 14.3   56     5   5
#6    28      NA 14.9   66     5   6

#| We see the dataset contains 6 columns of data. Run
#| the command range with two arguments. The first is
#| the ozone column of airquality, specified by
#| airquality$Ozone, and the second is the boolean
#| na.rm set equal to TRUE. If you don't specify this
#| second argument, you won't get a meaningful result.

range(airquality$Ozone,na.rm=TRUE)

#| So the measurements range from 1 to 168. First
#| we'll do a simple histogram of this ozone column to
#| show the distribution of measurements. Use the R
#| command hist with the argument airquality$Ozone.

hist(airquality$Ozone)

#| Simple, right? R put a title on the histogram and
#| labeled both axes for you. What is the most
#| frequent count?

#1: Under 25

#| Next we'll do a boxplot. First, though, run the R
#| command table with the argument airquality$Month.

table(airquality$Month)

# 5  6  7  8  9 
#31 30 31 31 30 

#| We see that the data covers 5 months, May through
#| September. We'll want a boxplot of ozone as a
#| function of the month in which the measurements
#| were taken so we'll use the R formula Ozone~Month
#| as the first argument of boxplot. Our second
#| argument will be airquality, the dataset from which
#| the variables of the first argument are taken.  Try
#| this now.

boxplot(Ozone~Month,airquality)

#| Note that boxplot, unlike hist, did NOT specify a
#| title and axis labels for you automatically.

#| Let's call boxplot again to specify labels. (Use
#| the up arrow to recover the previous command and
#| save yourself some typing.) We'll add more
#| arguments to the call to specify labels for the
#| 2 axes. Set xlab equal to "Month" and ylab equal
#| to "Ozone (ppb)". Specify col.axis equal to
#| "blue" and col.lab equal to "red". Try this now.

boxplot(Ozone~Month,airquality,xlab="Month",ylab="Ozone (ppb)",col.axis="blue",col.lab="red")

#| Nice colors, but still no title. Let's add one
#| with the R command title. Use the argument main
#| set equal to the string "Ozone and Wind in New
#| York City".

title(main="Ozone and Wind in New York City")

#| Now we'll show you how to plot a simple
#| two-dimensional scatterplot using the R function
#| plot. We'll show the relationship between Wind
#| (x-axis) and Ozone (y-axis). We'll use the
#| function plot with those two arguments (Wind and
#| Ozone, in that order). To save some typing,
#| though, we'll call the R command with using 2
#| arguments. The first argument of with will be
#| airquality, the dataset containing Wind and
#| Ozone; the second argument will be the call to
#| plot. Doing this allows us to avoid using the
#| longer notation, e.g., airquality$Wind. Try this
#| now.

with(airquality,plot(Wind,Ozone))

#| Note that plot generated labels for the x and y
#| axes but no title.

#| Add one now with the R command title. Use the
#| argument main set equal to the string "Ozone and
#| Wind in New York City". (You can use the up arrow
#| to recover the command if you don't want to type
#| it.)

title(main="Ozone and Wind in New York City")

#| The basic plotting parameters are documented in
#| the R help page for the function par. You can use
#| par to set parameters OR to find out what values
#| are already set. To see just how much flexibility
#| you have, run the R command length with the
#| argument par() now.

length(par())
#[1] 72

#| So there are a boatload (72) of parameters that
#| par() gives you access to. Run the R function
#| names with par() as its argument to see what
#| these parameters are.

names(par())

#[1] "xlog"      "ylog"      "adj"       "ann"      
# [5] "ask"       "bg"        "bty"       "cex"      
# [9] "cex.axis"  "cex.lab"   "cex.main"  "cex.sub"  
#[13] "cin"       "col"       "col.axis"  "col.lab"  
#[17] "col.main"  "col.sub"   "cra"       "crt"      
#[21] "csi"       "cxy"       "din"       "err"      
#[25] "family"    "fg"        "fig"       "fin"      
#[29] "font"      "font.axis" "font.lab"  "font.main"
#[33] "font.sub"  "lab"       "las"       "lend"     
#[37] "lheight"   "ljoin"     "lmitre"    "lty"      
#[41] "lwd"       "mai"       "mar"       "mex"      
#[45] "mfcol"     "mfg"       "mfrow"     "mgp"      
#[49] "mkh"       "new"       "oma"       "omd"      
#[53] "omi"       "page"      "pch"       "pin"      
#[57] "plt"       "ps"        "pty"       "smo"      
#[61] "srt"       "tck"       "tcl"       "usr"      
#[65] "xaxp"      "xaxs"      "xaxt"      "xpd"      
#[69] "yaxp"      "yaxs"      "yaxt"      "ylbias"

#| Variety is the spice of life. You might recognize
#| some of these such as col and lwd from previous
#| swirl lessons. You can always run ?par to see
#| what they do. For now, run the command par()$pin
#| and see what you get.

par()$pin 
#[1] 1.596667 2.005000

#| Alternatively, you could have gotten the same
#| result by running par("pin") or par('pin')).
#| What do you think these two numbers represent?

#Plot dimensions in inches

#| Now, run the command par("fg") or or par('fg') or
#| par()$fg and see what you get.

par("fg")
#[1] "black"

#| It gave you a color, right? Since par()$fg
#| specifies foreground color, what do you think
#| par()$bg specifies?

#Background color

#| Many base plotting functions share a set of
#| parameters. We'll go through some of the more
#| commonly used ones now. See if you can tell what
#| they do from their names.

#| What do you think the graphical parameter pch
#| controls?

#plot character 

#| The plot character default is the open circle,
#| but it "can either be a single character or an
#| integer code for one of a set of graphics
#| symbols." Run the command par("pch") to see the
#| integer value of the default. When you need to,
#| you can use R's Documentation (?pch) to find what
#| the other values mean.

par("pch")
#[1] 1
?pch

#| So 1 is the code for the open circle. What do you
#| think the graphical parameters lty and lwd
#| control respectively?

#line type and line width

#| Run the command par("lty") to see the default
#| line type.

par("lty")
#[1] "solid"

#| So the default line type is solid, but it can be
#| dashed, dotted, etc. Once again, R's ?par
#| documentation will tell you what other line types
#| are available. The line width is a positive
#| integer; the default value is 1.

?par

#| We've seen a lot of examples of col, the plotting
#| color, specified as a number, string, or hex
#| code; the colors() function gives you a vector of
#| colors by name.

?colors()

#| What do you think the graphical parameters xlab
#| and ylab control respectively?

#| The par() function is used to specify global
#| graphics parameters that affect all plots in an R
#| session. (Use dev.off or plot.new to reset to the
#| defaults.) These parameters can be overridden
#| when specified as arguments to specific plotting
#| functions. These include las (the orientation of
#| the axis labels on the plot), bg (background
#| color), mar (margin size), oma (outer margin
#| size), mfrow and mfcol (number of plots per row,
#| column).

#| The last two, mfrow and mfcol, both deal with
#| multiple plots in that they specify the number of
#| plots per row and column. The difference between
#| them is the order in which they fill the plot
#| matrix. The call mfrow will fill the rows first
#| while mfcol fills the columns first.

#| So to reiterate, first call a basic plotting
#| routine. For instance, plot makes a scatterplot
#| or other type of plot depending on the class of
#| the object being plotted.

#| So you can add text, title, points, and lines to
#| an existing plot. To add lines, you give a vector
#| of x values and a corresponding vector of y
#| values (or a 2-column matrix); the function lines
#| just connects the dots. The function text adds
#| text labels to a plot using specified x, y
#| coordinates.

#| The function title adds annotations. These
#| include x- and y- axis labels, title, subtitle,
#| and outer margin. Two other annotating functions
#| are mtext which adds arbitrary text to either the
#| outer or inner margins of the plot and axis which
#| adds axis ticks and labels. Another useful
#| function is legend which explains to the reader
#| what the symbols your plot uses mean.

#| Before we close, let's test your ability to make
#| a somewhat complicated scatterplot. First run
#| plot with 3 arguments. airquality$Wind,
#| airquality$Ozone, and type set equal to "n". This
#| tells R to set up the plot but not to put the
#| data in it.

plot(airquality$Wind, type="n",airquality$Ozone)
plot(airquality$Wind,type="n",airquality$Ozone)

#| Now for the test. (You might need to check R's
#| documentation for some of these.) Add a title
#| with the argument main set equal to the string
#| "Wind and Ozone in NYC"

title(main="Wind and Ozone in NYC")

#| Now create a variable called may by subsetting
#| airquality appropriately. (Recall that the data
#| specifies months by number and May is the fifth
#| month of the year.)










###UNSURE WHY THE BREAK IS HERE 

plot(cars, sub = "My Plot Subtitle")

#| The plot help page (?plot) only covers a small
#| number of the many arguments that can be passed
#| in to plot() and to other graphical functions.
#| To begin to explore the many other options, look
#| at ?par. Let's look at some of the more commonly
#| used ones. Continue using plot(cars, ...) as the
#| base answer to these questions.

#| Plot cars with a red color. (Use col = 2 to
#| achieve this effect.)

plot(cars,col=2)

#| Plot cars while limiting the x-axis to 10
#| through 15.  (Use xlim = c(10, 15) to achieve
#| this effect.)

plot(cars,xlim=c(10,15))

#| You can also change the shape of the symbols in
#| the plot. The help page for points (?points)
#| provides the details.

#| Plot cars using triangles.  (Use pch = 2 to
#| achieve this effect.)

plot(cars,pch=2)

#| Arguments like "col" and "pch" may not seem very
#| intuitive. And that is because they aren't! So,
#| many/most people use more modern packages, like
#| ggplot2, for creating their graphics in R.

#| It is, however, useful to have an introduction
#| to base graphics because many of the idioms in
#| lattice and ggplot2 are modeled on them.

#| Let's now look at some other functions in base
#| graphics that may be useful, starting with
#| boxplots.

data(mtcars)

#| Anytime that you load up a new data frame, you
#| should explore it before using it. In the middle
#| of a swirl lesson, just type play(). This
#| temporarily suspends the lesson (without losing
#| the work you have already done) and allows you
#| to issue commands like dim(mtcares) and
#| head(mtcars). Once you are done examining the
#| data, just type nxt() and the lesson will pick
#| up where it left off.

dim(mtcars)
str(mtcars)

?boxplot

## S3 method for class 'formula'
#boxplot(formula, data = NULL, ..., subset, na.action = NULL)

## Default S3 method:
#boxplot(x, ..., range = 1.5, width = NULL, varwidth = FALSE,
#        notch = FALSE, outline = TRUE, names, plot = TRUE,
#        border = par("fg"), col = NULL, log = "",
#        pars = list(boxwex = 0.8, staplewex = 0.5, outwex = 0.5),
#        horizontal = FALSE, add = FALSE, at = NULL)

#| Instead of adding data columns directly as input
#| arguments, as we did with plot(), it is often
#| handy to pass in the entire data frame. This is
#| what the "data" argument in boxplot() allows.

#| boxplot(), like many R functions, also takes a
#| "formula" argument, generally an expression with
#| a tilde ("~") which indicates the relationship
#| between the input variables. This allows you to
#| enter something like mpg ~ cyl to plot the
#| relationship between cyl (number of cylinders)
#| on the x-axis and mpg (miles per gallon) on the
#| y-axis.

#| Use boxplot() with formula = mpg ~ cyl and data
#| = mtcars to create a box plot.

boxplot(formula=mpg~cyl,data=mtcars)

#| The plot shows that mpg is much lower for cars
#| with more cylinders. Note that we can use the
#| same set of arguments that we explored with
#| plot() above to add axis labels, titles and so
#| on.

#| When looking at a single variable, histograms
#| are a useful tool. hist() is the associated R
#| function. Like plot(), hist() is best used by
#| just passing in a single vector.

#| Use hist() with the vector mtcars$mpg to create
#| a histogram.

hist(mtcars$mpg)

#| In this lesson, you learned how to work with
#| base graphics in R. The best place to go from
#| here is to study the ggplot2 package. If you
#| want to explore other elements of base graphics,
#| then this web page
#| (http://www.ling.upenn.edu/~joseff/rstudy/week4.html)
#| provides a useful overview.






#Swirl lecture for 6: Lattice Plotting System from Exploratory Data Analysis 

#| In another lesson, we gave you an overview of
#| the three plotting systems in R. In this lesson
#| we'll focus on the lattice plotting system.  As
#| we did with the base plotting system, we'll
#| focus on using lattice to create graphics on the
#| screen device rather than another graphics
#| device.

#| The lattice plotting system is completely
#| separate and independent of the base plotting
#| system. It's an add-on package so it has to be
#| explicitly loaded with a call to the R function
#| library. We've done this for you. The R
#| Documentation tells us that lattice "is an
#| implementation of Trellis graphics for R. It is
#| a powerful and elegant high-level data
#| visualization system with an emphasis on
#| multivariate data."

#| Lattice is implemented using two packages. The
#| first is called, not surprisingly, lattice, and
#| it contains code for producing Trellis graphics.
#| Some of the functions in this package are the
#| higher level functions which you, the user,
#| would call. These include xyplot, bwplot, and
#| levelplot.

## bwplot() is for box and whisker plots 

#| The second package in the lattice system is grid
#| which contains the low-level functions upon
#| which the lattice package is built. You, the
#| user, seldom call functions from the grid
#| package directly.

#| Unlike base plotting, the lattice system does
#| not have a "two-phase" aspect with separate
#| plotting and annotation. Instead all plotting
#| and annotation is done at once with a single
#| function call.

#| The lattice system, as the base does, provides
#| several different plotting functions. These
#| include xyplot for creating scatterplots, bwplot
#| for box-and-whiskers plots or boxplots, and
#| histogram for histograms. There are several
#| others (stripplot, dotplot, splom and
#| levelplot), which we won't cover here.

#| Lattice functions generally take a formula for
#| their first argument, usually of the form y ~ x.
#| This indicates that y depends on x, so in a
#| scatterplot y would be plotted on the y-axis and
#| x on the x-axis.

## y depends on x is same as y ~ x 

#| Here's an example of typical lattice plot call,
#| xyplot(y ~ x | f * g, data). The f and g
#| represent the optional conditioning variables.
#| The * represents interaction between them.
#| Remember when we said that lattice is good for
#| plotting multivariate data? That's where these
#| conditioning variables come into play.

## xyplot(y ~ x | f* g, data)

#| The second argument is the data frame or list
#| from which the variables in the formula should
#| be looked up.  If no data frame or list is
#| passed, then the parent frame is used. If no
#| other arguments are passed, the default values
#| are used.

#| Recall the airquality data we've used before.
#| We've loaded it again for you. To remind
#| yourself what it looks like run the R command
#| head with airquality as an argument to see what
#| the data looks like.

head(airquality)

#  Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2
#3    12     149 12.6   74     5   3
#4    18     313 11.5   62     5   4
#5    NA      NA 14.3   56     5   5
#6    28      NA 14.9   66     5   6

#| Now try running xyplot with the formula
#| Ozone~Wind as the first argument and the second
#| argument data set equal to airquality.

xyplot(Ozone~Wind,airquality)

#| Look vaguely familiar? The dots are blue,
#| instead of black, but lattice labeled the axes
#| for you. You can use some of the same graphical
#| parameters (e.g., pch and col) that you used in
#| the base package in calls to lattice functions.

#| Now rerun xyplot with the formula Ozone~Wind as the
#| first argument and the second argument data set equal
#| to airquality (use the up arrow to save typing). This
#| time add the arguments col set equal to "red", pch
#| set equal to 8, and main set equal to "Big Apple
#| Data".

xyplot(Ozone~Wind,data=airquality,col="red",pch=8,main="Big Apple Data")

#| Red snowflakes are cool, right? Now that you’ve
#| seen the basic xyplot() and some of its arguments,
#| you might want to experiment more by yourself when
#| you're done with the lesson to discover what other
#| arguments and colors are available. (If you can't
#| wait to experiment, recall that swirl has play() and
#| nxt() functions. At a command prompt, typing play()
#| allows you to leave swirl temporarily so you can try
#| different R commands at the console. Typing nxt()
#| when you’re done playing brings you back to swirl
#| and you can resume your lesson.)

#| Run xyplot with the formula Ozone~Wind |
#| as.factor(Month) as the first argument and the second
#| argument data set equal to airquality (use the up
#| arrow to save typing). So far, not much is different,
#| right? Add a third argument, layout, set equal to
#| c(5,1).

xyplot(Ozone~Wind | as.factor(Month),data=airquality,layout=c(5,1))

#| Note that the default color and plotting character
#| are back. What did the as.factor(Month) do?

####Displayed and labeled each subplot with the month's integer

#| Since Month is a named column of the airquality
#| dataframe we had to tell R to treat it as a factor.
#| To see how this affects the plot, rerun the xyplot
#| command you just ran, but use Ozone ~ Wind | Month
#| instead of Ozone ~ Wind | as.factor(Month) as the
#| first argument.

xyplot(Ozone~Wind | Month,data=airquality,layout=c(5,1))

#| Not as informative, right? The word Month in each
#| panel really doesn't tell you much if it doesn't
#| identify which month it's plotting. Notice that the
#| actual data is the same between the two plots,
#| though.

#| Lattice functions behave differently from base
#| graphics functions in one critical way. Recall that
#| base graphics functions plot data directly to the
#| graphics device (e.g., screen, or file such as a PDF
#| file). In contrast, lattice graphics functions return
#| an object of class trellis.

#| The print methods for lattice functions actually do
#| the work of plotting the data on the graphics device.
#| They return "plot objects" that can be stored (but
#| it’s usually better to just save the code and
#| data). On the command line, trellis objects are
#| auto-printed so that it appears the function is
#| plotting the data.

#| To see this, create a variable p which is assigned
#| the output of this simple call to xyplot,
#| xyplot(Ozone~Wind,data=airquality).

p<-xyplot(Ozone~Wind,data=airquality)
p 
names(p)
# [1] "formula"           "as.table"         
# [3] "aspect.fill"       "legend"           
# [5] "panel"             "page"             
# [7] "layout"            "skip"             
# [9] "strip"             "strip.left"       
#[11] "xscale.components" "yscale.components"
#[13] "axis"              "xlab"             
#[15] "ylab"              "xlab.default"     
#[17] "ylab.default"      "xlab.top"         
#[19] "ylab.right"        "main"             
#[21] "sub"               "x.between"        
#[23] "y.between"         "par.settings"     
#[25] "plot.args"         "lattice.options"  
#[27] "par.strip.text"    "index.cond"       
#[29] "perm.cond"         "condlevels"       
#[31] "call"              "x.scales"         
#[33] "y.scales"          "panel.args.common"
#[35] "panel.args"        "packet.sizes"     
#[37] "x.limits"          "y.limits"         
#[39] "x.used.at"         "y.used.at"        
#[41] "x.num.limit"       "y.num.limit"      
#[43] "aspect.ratio"      "prepanel.default" 
#[45] "prepanel"  

#| We see that the trellis object p has 45 named
#| properties, the first of which is "formula" which
#| isn't too surprising. A lot of these properties are
#| probably NULL in value. We've done some
#| behind-the-scenes work for you and created two
#| vectors. The first, mynames, is a character vector of
#| the names in p. The second is a boolean vector,
#| myfull, which has TRUE values for nonnull entries of
#| p. Run mynames[myfull] to see which entries of p are
#| not NULL.

mynames[myfull] #re-read above 

#| Wow! 29 nonNull values for one little plot. Note that
#| a lot of them are like the ones we saw in the base
#| plotting system. Let's look at the values of some of
#| them. Type p[["formula"]] now.

p[["formula"]]
#Ozone ~ Wind

#| Not surprising, is it? It's a familiar formula. Now
#| look at p's x.limits. Remember the double square
#| brackets and quotes.

p[["x.limits"]]
#[1]  0.37 22.03

#| They match the plot, right? The x values are indeed
#| between .37 and 22.03.

#| Again, not surprising. Before we wrap up, let's talk
#| about lattice's panel functions which control what
#| happens inside each panel of the plot. The ease of
#| making multi-panel plots makes lattice very
#| appealing. The lattice package comes with default
#| panel functions, but you can customize what happens
#| in each panel.

#| Panel functions receive the x and y coordinates of
#| the data points in their panel (along with any
#| optional arguments). To see this, we've created some
#| data for you - two 100-long vectors, x and y. For its
#| first 50 values y is a function of x, for the last 50
#| values, y is random. We've also defined a 100-long
#| factor vector f which distinguishes between the first
#| and last 50 elements of the two vectors. Run the R
#| command table with f as it argument.

table(f)
#f
#Group 1 Group 2 
#     50      50 

#| The first 50 entries of f are "Group 1" and the last
#| 50 are "Group 2". Run xyplot with two arguments. The
#| first is the formula y~x|f, and the second is layout
#| set equal to c(2,1). Note that we're not providing an
#| explicit data argument, so xyplot will look in the
#| environment and see the x and y that we've generated
#| for you.

xyplot(y~x|f,layout=c(2,1))

#| To understand this a little better look at the
#| variable v1 we've created for you.

v1 
#[1] -2.185287  1.101780 -2.716851  1.569850

#| The first two numbers are the range of the x values
#| of Group 1 and the last two numbers are the range of
#| y values of Group 1. See how they match the values of
#| the left panel (Group 1) in the plot. Now look at v2
#| which holds the comparable numbers for Group 2.

v2
#[1] -1.6066772  2.2205197 -0.1605085  2.0341048

#| Again, the values match the plot. That's reassuring.
#| We've copied some code from the slides for you. To
#| see it, type myedit("plot1.R"). This will open your
#| editor and display the R code in it.

myedit("plot1.R")

#p <- xyplot(y ~ x | f, panel = function(x, y, ...) {
#  panel.xyplot(x, y, ...)  ## First call the default panel function for 'xyplot'
#  panel.abline(h = median(y), lty = 2)  ## Add a horizontal line at the median
#})
#print(p)
#invisible()

#| How many calls to basic lattice plotting functions
#| are there in plot1.R? --> 1

#| Note the panel function. How many formal arguments
#| does it have? --> 3 

#| The panel function has 3 arguments, x, y and ... .
#| This last stands for all other arguments (such as
#| graphical parameters) you might want to include.
#| There are 2 lines in the panel function. Each invokes
#| a panel method, the first to plot the data in each
#| panel (panel.xyplot), the second to draw a horizontal
#| line in each panel (panel.abline). Note the
#| similarity of this last call to that of the base
#| plotting function of the same name.

#| We've defined a function for you, pathtofile, which
#| takes a filename as its argument. This makes sure R
#| can find the file on your computer. Now run the R
#| command source with two arguments. The first is the
#| call to pathtofile with the string "plot1.R" as its
#| argument and the second is the argument local set
#| equal to TRUE. This command will run the code
#| contained in plot1.R within the swirl environment so
#| you can see what it does.

source(pathtofile("plot1.R"),local=TRUE)

#| See how the lines appear. The plot shows two panels
#| because...?
## f contains 2 factors 

#| We've copied another piece of similar code, i.e., a
#| call to xyplot with a custom panel function, from the
#| slides. To see it, type myedit("plot2.R"). This will
#| open your editor and display the R code in it.

myedit("plot2.R")

#p2 <- xyplot(y ~ x | f, panel = function(x, y, ...) {
#  panel.xyplot(x, y, ...)  ## First call default panel function
#  panel.lmline(x, y, col = 2)  ## Overlay a simple linear regression line
#})
#print(p2)
#invisible()

#| Again, run the R command source with the two
#| arguments pathtofile("plot2.R") and local=TRUE. This
#| will run the code in plot2.R.

source(pathtofile("plot2.R"),local=TRUE)

#| The regression lines are red because ...?
####the custom panel function specified a col argument

#| Before we close we'll look at how easily lattice can
#| handle a plot with a great many panels. (The sky's
#| the limit.) We've loaded some diamond data for you.
#| It comes with the ggplot2 package. We'll use it just
#| to show off lattice's panel plotting capability.

#| The data is in the data frame diamonds. Use the R
#| command str to see what it looks like.

str(diamonds)
#'data.frame':	53940 obs. of  10 variables:
# $ carat  : num  0.23 0.21 0.23 0.29 0.31 0.24 0.24 0.26 0.22 0.23 ...
# $ cut    : Ord.factor w/ 5 levels "Fair"<"Good"<..: 5 4 2 4 2 3 3 3 1 3 ...
# $ color  : Ord.factor w/ 7 levels "D"<"E"<"F"<"G"<..: 2 2 2 6 7 7 6 5 2 5 ...
# $ clarity: Ord.factor w/ 8 levels "I1"<"SI2"<"SI1"<..: 2 3 5 4 2 6 7 3 4 5 ...
# $ depth  : num  61.5 59.8 56.9 62.4 63.3 62.8 62.3 61.9 65.1 59.4 ...
# $ table  : num  55 61 65 58 58 57 57 55 61 61 ...
# $ price  : int  326 326 327 334 335 336 336 337 337 338 ...
# $ x      : num  3.95 3.89 4.05 4.2 4.34 3.94 3.95 4.07 3.87 4 ...
# $ y      : num  3.98 3.84 4.07 4.23 4.35 3.96 3.98 4.11 3.78 4.05 ...
# $ z      : num  2.43 2.31 2.31 2.63 2.75 2.48 2.47 2.53 2.49 2.39 ...

#| So the data frame contains 10 pieces of information
#| for each of 53940 diamonds. Run the R command table
#| with diamonds$color as an argument.

table(diamonds$color)
#    D     E     F     G     H     I     J 
# 6775  9797  9542 11292  8304  5422  2808 

#| We see 7 colors each represented by a letter. Now run
#| the R command table with two arguments,
#| diamonds$color and diamonds$cut.

table(diamonds$color,diamonds$cut)

#    Fair Good Very Good Premium Ideal
#  D  163  662      1513    1603  2834
#  E  224  933      2400    2337  3903
#  F  312  909      2164    2331  3826
#  G  314  871      2299    2924  4884
#  H  303  702      1824    2360  3115
#  I  175  522      1204    1428  2093
#  J  119  307       678     808   896

#| We see a 7 by 5 array with counts indicating how many
#| diamonds in the data frame have a particular color
#| and cut. From the table, which is the most frequent
#| combination? __> Ideal cut of color G

#| To save you some trouble we've defined three
#| character strings for you, labels for the x- and
#| y-axes and a main title. They're in the file
#| myLabels.R, so run myedit on this file to see them.
#| Remember to put the file name in quotes when you call
#| myedit.

myedit("myLabels.R")

#| Now run source with pathtofile("myLabels.R") and
#| local set equal to TRUE.

source(pathtofile("myLabels.R"),local=TRUE)

#| Now call xyplot with the formula price~carat |
#| color*cut and data set equal to diamonds. In
#| addition, set the argument strip equal to FALSE, pch
#| set equal to 20, xlab to myxlab, ylab to myylab, and
#| main to mymain. The plot may take longer than
#| previous plots because it is bigger.

xyplot(price~carat|color*cut,data=diamonds,strip=FALSE,pch=20,xlab=myxlab,ylab=myylab,main=mymain)

#| Pretty cool, right? 35 panels, one for each
#| combination of color and cut. The dots (pch=20) show
#| how prices for the diamonds in each category (panel)
#| vary depending on carat.

#Colors are defining the columns here

#| Were you curious about that argument strip? I know I
#| was. Now rerun the xyplot command you just ran (use
#| the up arrow key to retrieve it), this time without
#| the strip argument.

xyplot(price~carat|color*cut,data=diamonds,pch=20,xlab=myxlab,ylab=myylab,main=mymain)

#| The plot shows that the strip argument .... LABELS EACH PANEL 

## END OF SWIRL LECTURE , SKIPPING WORKING WITH COLORS FOR NOW. 





# Swirl Lecture 8: GGPlot2 Part1 

#| GGPlot2_Part1. (Slides for this and other Data
#| Science courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/.
#| If you care to use them, they must be downloaded as a
#| zip file and viewed locally. This lesson corresponds
#| to 04_ExploratoryAnalysis/ggplot2.)

#| The ggplot2 package is an add-on package available
#| from CRAN via install.packages(). (Don't worry, we've
#| installed it for you already.) It is an
#| implementation of The Grammar of Graphics, an
#| abstract concept (as well as book) authored and
#| invented by Leland Wilkinson and implemented by
#| Hadley Wickham while he was a graduate student at
#| Iowa State. The web site http://ggplot2.org provides
#| complete documentation.

#| A grammar of graphics represents an abstraction of
#| graphics, that is, a theory of graphics which
#| conceptualizes basic pieces from which you can build
#| new graphics and graphical objects. The goal of the
#| grammar is to “Shorten the distance from mind to
#| page”. From Hadley Wickham's book we learn that

#| The ggplot2 package "is composed of a set of
#| independent components that can be composed in many
#| different ways. ... you can create new graphics that
#| are precisely tailored for your problem." These
#| components include aesthetics which are attributes
#| such as colour, shape, and size, and geometric
#| objects or geoms such as points, lines, and bars.

#| Before we delve into details, let's review the other
#| 2 plotting systems.
####In base system cannot easily go back and replace typos 
####In Lattice, cannot add to plot once it is created 

#| If we told you that ggplot2 combines the best of base
#| and lattice, that would mean it ...?

#1: Automatically deals with spacings, text, titles but also allows you to annotate
####2: All of the others
#3: Its default mode makes many choices for you (but you can customize!)
#4: Like lattice it allows for multipanels but more easily and intuitively

#| Yes, ggplot2 combines the best of base and lattice.
#| It allows for multipanel (conditioning) plots (as
#| lattice does) but also post facto annotation (as base
#| does), so you can add titles and labels. It uses the
#| low-level grid package (which comes with R) to draw
#| the graphics. As part of its grammar philosophy,
#| ggplot2 plots are composed of aesthetics (attributes
#| such as size, shape, color) and geoms (points, lines,
#| and bars), the geometric objects you see on the plot.

#| The ggplot2 package has 2 workhorse functions. The
#| more basic workhorse function is qplot, (think quick
#| plot), which works like the plot function in the base
#| graphics system. It can produce many types of plots
#| (scatter, histograms, box and whisker) while hiding
#| tedious details from the user. Similar to lattice
#| functions, it looks for data in a data frame or
#| parent environment.

#| The more advanced workhorse function in the package
#| is ggplot, which is more flexible and can be
#| customized for doing things qplot cannot do. In this
#| lesson we'll focus on qplot.

#| We'll start by showing how easy and versatile qplot
#| is. First, let's look at some data which comes with
#| the ggplot2 package. The mpg data frame contains fuel
#| economy data for 38 models of cars manufactured in
#| 1999 and 2008. Run the R command str with the
#| argument mpg. This will give you an idea of what mpg
#| contains.

str(mpg)
#'data.frame':	234 obs. of  11 variables:
# $ manufacturer: Factor w/ 15 levels "audi","chevrolet",..: 1 1 1 1 1 1 1 1 1 1 ...
# $ model       : Factor w/ 38 levels "4runner 4wd",..: 2 2 2 2 2 2 2 3 3 3 ...
# $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
# $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
# $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
# $ trans       : Factor w/ 10 levels "auto(av)","auto(l3)",..: 4 9 10 1 4 9 1 9 4 10 ...
# $ drv         : Factor w/ 3 levels "4","f","r": 2 2 2 2 2 2 2 1 1 1 ...
# $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
# $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
# $ fl          : Factor w/ 5 levels "c","d","e","p",..: 4 4 4 4 4 4 4 4 4 4 ...
# $ class       : Factor w/ 7 levels "2seater","compact",..: 2 2 2 2 2 2 2 2 2 2 ...

#| We see that there are 234 points in the dataset
#| concerning 11 different characteristics of the cars.
#| Suppose we want to see if there's a correlation
#| between engine displacement (displ) and highway miles
#| per gallon (hwy). As we did with the plot function of
#| the base system we could simply call qplot with 3
#| arguments, the first two are the variables we want to
#| examine and the third argument data is set equal to
#| the name of the dataset which contains them (in this
#| case, mpg). Try this now.

qplot(displ,hwy,data=mpg)

#| A nice scatterplot done simply, right? All the labels
#| are provided. The first argument is shown along the
#| x-axis and the second along the y-axis. The negative
#| trend (increasing displacement and lower gas mileage)
#| is pretty clear. Now suppose we want to do the same
#| plot but this time use different colors to
#| distinguish between the 3 factors (subsets) of
#| different types of drive (drv) in the data
#| (front-wheel, rear-wheel, and 4-wheel). Again, qplot
#| makes this very easy. We'll just add what ggplot2
#| calls an aesthetic, a fourth argument, color, and set
#| it equal to drv. Try this now. (Use the up arrow key
#| to save some typing.)

qplot(displ,hwy,data=mpg,color=drv)

#| Pretty cool, right? See the legend to the right which
#| qplot helpfully supplied? The colors were
#| automatically assigned by qplot so the legend decodes
#| the colors for you. Notice that qplot automatically
#| used dots or points to indicate the data. These
#| points are geoms (geometric objects). We could have
#| used a different aesthetic, for instance shape
#| instead of color, to distinguish between the drive
#| types.

qplot(displ,hwy,data=mpg,color=drv,geom=c("point","smooth"))

#geom_smooth: method="auto" and size of largest group is# <1000, so using loess. Use 'method = x' to change the #smoothing method.

#| Note the helpful message R returns in red telling you
#| what function (loess) it used to create the trend
#| lines. No need to worry - we'll see another example
#| of method in another (Extras) lesson. Notice the gray
#| areas surrounding each trend lines. These indicate
#| the 95% confidence intervals for the lines

#| Before we leave qplot's scatterplotting ability, call
#| qplot again, this time with 3 arguments. The first is
#| y set equal to hwy, the second is data set equal to
#| mpg, and the third is color set equal to drv. Try
#| this now.

qplot(y=hwy,data=mpg,color=drv)

#| What's this plot showing? We see the x-axis ranges
#| from 0 to 250 and we remember that we had 234 data
#| points in our set, so we can infer that each point in
#| the plot represents one of the hwy values (indicated
#| by the y-axis). We've created the vector myhigh for
#| you which contains the hwy data from the mpg dataset.
#| Look at myhigh now.

myhigh
#  [1] 29 29 31 30 26 26 27 26 25 28 27 25 25 25 25 24 25
# [18] 23 20 15 20 17 17 26 23 26 25 24 19 14 15 17 27 30
# [35] 26 29 26 24 24 22 22 24 24 17 22 21 23 23 19 18 17
# [52] 17 19 19 12 17 15 17 17 12 17 16 18 15 16 12 17 17
# [69] 16 12 15 16 17 15 17 17 18 17 19 17 19 19 17 17 17
# [86] 16 16 17 15 17 26 25 26 24 21 22 23 22 20 33 32 32
#[103] 29 32 34 36 36 29 26 27 30 31 26 26 28 26 29 28 27
#[120] 24 24 24 22 19 20 17 12 19 18 14 15 18 18 15 17 16
#[137] 18 17 19 19 17 29 27 31 32 27 26 26 25 25 17 17 20
#[154] 18 26 26 27 28 25 25 24 27 25 26 23 26 26 26 26 25
#[171] 27 25 27 20 20 19 17 20 17 29 27 31 31 26 26 28 27
#[188] 29 31 31 26 26 27 30 33 35 37 35 15 18 20 20 22 17
#[205] 19 18 20 29 26 29 29 24 44 29 26 29 29 29 29 23 24
#[222] 44 41 29 26 28 29 29 29 28 29 26 26 26

#| Comparing the values of myhigh with the plot, we see
#| the first entries in the vector (29, 29, 31, 30,...)
#| correspond to the leftmost points in the the plot (in
#| order), and the last entries in myhigh (28, 29, 26,
#| 26, 26) correspond to the rightmost plotted points.
#| So, specifying the y parameter only, without an x
#| argument, plots the values of the y argument in the
#| order in which they occur in the data.

#| The all-purpose qplot can also create box and whisker
#| plots.  Call qplot now with 4 arguments. First
#| specify the variable by which you'll split the data,
#| in this case drv, then specify the variable which you
#| want to examine, in this case hwy. The third argument
#| is data (set equal to mpg), and the fourth, the geom,
#| set equal to the string "boxplot"

qplot(drv,hwy,data=mpg,geom="boxplot")

#| We see 3 boxes, one for each drive. Now to impress
#| you, call qplot with 5 arguments. The first 4 are
#| just as you used previously, (drv, hwy, data set
#| equal to mpg, and geom set equal to the string
#| "boxplot"). Now add a fifth argument, color, equal to
#| manufacturer.

qplot(drv,hwy,data=mpg,geom="boxplot",color=manufacturer)

#| It's a little squished but we just wanted to
#| illustrate qplot's capabilities. Notice that there
#| are still 3 regions of the plot (determined by the
#| factor drv). Each is subdivided into several boxes
#| depicting different manufacturers.

#| Now, on to histograms. These display frequency counts
#| for a single variable. Let's start with an easy one.
#| Call qplot with 3 arguments. First specify the
#| variable for which you want the frequency count, in
#| this case hwy, then specify the data (set equal to
#| mpg), and finally, the aesthetic, fill, set equal to
#| drv. Instead of a plain old histogram, this will
#| again use colors to distinguish the 3 different drive
#| factors.

#| See how qplot consistently uses the colors. Red (if
#| 4-wheel drv is in the bin) is at the bottom of the
#| bin, then green on top of it (if present), followed
#| by blue (rear wheel drv). The color lets us see right
#| away that 4-wheel drive vehicles in this dataset
#| don't have gas mileages exceeding 30 miles per
#| gallon.

#| It's cool that qplot can do this so easily, but some
#| people may find this multi-color histogram hard to
#| interpret. Instead of using colors to distinguish
#| between the drive factors let's use facets or panels.
#| (That's what lattice called them.) This just means
#| we'll split the data into 3 subsets (according to
#| drive) and make 3 smaller individual plots of each
#| subset in one plot (and with one call to qplot).

#| Remember that with base plot we had to do each
#| subplot individually. The lattice system made
#| plotting conditioning plots easier. Let's see how
#| easy it is with qplot.

#| We'll do two plots, a scatterplot and then a
#| histogram, each with 3 facets. For the scatterplot,
#| call qplot with 4 arguments. The first two are displ
#| and hwy and the third is the argument data set equal
#| to mpg. The fourth is the argument facets which will
#| be set equal to the expression . ~ drv which is
#| ggplot2's shorthand for number of rows (to the left
#| of the ~) and number of columns (to the right of the
#| ~). Here the . indicates a single row and drv implies
#| 3, since there are 3 distinct drive factors. Try this
#| now.

#| The result is a 1 by 3 array of plots. Note how each
#| is labeled at the top with the factor label (4,f, or
#| r). This shows us more detailed information than the
#| histogram. We see the relationship between
#| displacement and highway mileage for each of the 3
#| drive factors.

qplot(hwy,data=mpg,facets=drv~.,binwidth=2)

#| The facets argument, drv ~ ., resulted in what
#| arrangement of facets --> 3 by 1 

#### END OF LECTURE 






# SWIRL Exploratory Data Analysis
# 9: GGPlot2 Part2

#| GGPlot2_Part2. (Slides for this and other Data
#| Science courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/.
#| If you care to use them, they must be downloaded as a
#| zip file and viewed locally. This lesson corresponds
#| to 04_ExploratoryAnalysis/ggplot2.)

#| In a previous lesson we showed you the vast
#| capabilities of qplot, the basic workhorse function
#| of the ggplot2 package. In this lesson we'll focus on
#| some fundamental components of the package. These
#| underlie qplot which uses default values when it
#| calls them. If you understand these building blocks,
#| you will be better able to customize your plots.
#| We'll use the second workhorse function in the
#| package, ggplot, as well as other graphing functions.

#| A "grammar" of graphics means that ggplot2 contains
#| building blocks with which you can create your own
#| graphical objects. What are these basic components of
#| ggplot2 plots? There are 7 of them.

#| Obviously, there's a DATA FRAME which contains the
#| data you're trying to plot. Then the AESTHETIC
#| MAPPINGS determine how data are mapped to color,
#| size, etc. The GEOMS (geometric objects) are what you
#| see in the plot (points, lines, shapes) and FACETS
#| are the panels used in conditional plots. You've used
#| these or seen them used in the first ggplot2 (qplot)
#| lesson.

#| There are 3 more. STATS are statistical
#| transformations such as binning, quantiles, and
#| smoothing which ggplot2 applies to the data. SCALES
#| show what coding an aesthetic map uses (for example,
#| male = red, female = blue). Finally, the plots are
#| depicted on a COORDINATE SYSTEM. When you use qplot
#| these were taken care of for you.

#| Plots are built up in LAYERS ... As in the base plotting system (and in contrast to
#| the lattice system), when building plots with
#| ggplot2, the plots are built up in layers, maybe in
#| several steps. You can plot the data, then overlay a
#| summary (for instance, a regression line or smoother)
#| and then add any metadata and annotations you need.

#| We'll keep using the mpg data that comes with the
#| ggplot2 package. Recall the versatility of qplot.
#| Just as a refresher, call qplot now with 6 arguments.
#| The first 3 deal with data - displ, hwy, and
#| data=mpg. The fourth is geom set equal to the
#| concatenation of the two strings, "point" and
#| "smooth". The fifth is facets set equal to the
#| formula .~drv, and the final argument is method set
#| equal to the string "loess". Try this now.

qplot(displ, hwy, data = mpg, geom=c("point", "smooth"),facets=.~drv,method="loess")

#| We see a 3 facet plot, one for each drive type (4,
#| f, and r). The method argument specified the
#| smoothing function (loess) we wanted to use to draw
#| trend lines through the data. (We did this to avoid
#| getting a warning message from R.) Now we'll see how
#| ggplot works. We'll build up a similar plot using
#| the basic components of the package. We'll do this
#| in a series of steps.

#| First we'll create a variable g by assigning to it
#| the output of a call to ggplot with 2 arguments. The
#| first is mpg (our dataset) and the second will tell
#| ggplot what we want to plot, in this case, displ and
#| hwy. These are what we want our aesthetics to
#| represent so we enclose these as two arguments to
#| the function aes. Try this now.

g <- ggplot(mpg,aes(displ,hwy))

#| Notice that nothing happened? As in the lattice
#| system, ggplot created a graphical object which we
#| assigned to the variable g.

summary(g)
#data: manufacturer, model, displ, year, cyl,
#  trans, drv, cty, hwy, fl, class [234x11]
#mapping:  x = displ, y = hwy
#faceting: facet_null() 

#| So g contains the mpg data with all its named
#| components in a 234 by 11 matrix. It also contains a
#| mapping, x (displ) and y (hwy) which you specified,
#| and no faceting.

#| Note that if you tried to print g with the
#| expressions g or print(g) you'd get an error! Even
#| though it's a great package, ggplot doesn't know how
#| to display the data yet since you didn't specify how
#| you wanted to see it. Now type g+geom_point() and
#| see what happens.

g+geom_point()

#| By calling the function geom_point you added a
#| layer. By not assigning the expression to a variable
#| you displayed a plot. Notice that you didn't have to
#| pass any arguments to the function geom_point.
#| That's because the object g has all the data stored
#| in it. (Remember you saw that when you ran summary
#| on g before.) Now use the expression you just typed
#| (g + geom_point()) and add to it another layer, a
#| call to geom_smooth(). Notice the red message R
#| gives you.

g+geom_point()+geom_smooth()

#| R is telling you that it used the smoothing function
#| loess to display the trend of the data. The gray
#| shadow around the blue line is the confidence band.
#| See how wide it is at the right? Let's try a
#| different smoothing function. Use the up arrow to
#| recover the expression you just typed, and instead
#| of calling geom_smooth with no arguments, call it
#| with the argument method set equal to the string
#| "lm".

g+geom_point()+geom_smooth(method="lm")

#| By changing the smoothing function to "lm" (linear
#| model) ggplot2 generated a regression line through
#| the data. Now recall the expression you just used
#| and add to it another call, this time to the
#| function facet_grid. Use the formula . ~ drv as it
#| argument. Note that this is the same type of formula
#| used in the calls to qplot.

g+geom_point()+geom_smooth(method="lm") + facet_grid(.~drv)

#| Notice how each panel is labeled with the
#| appropriate factor. All the data associated with
#| 4-wheel drive cars is in the leftmost panel,
#| front-wheel drive data is shown in the middle panel,
#| and rear-wheel drive data in the rightmost. Notice
#| that this is similar to the plot you created at the
#| start of the lesson using qplot. (We used a
#| different smoothing function than previously.)

#| So far you've just used the default labels that
#| ggplot provides. You can add your own annotation
#| using functions such as xlab(), ylab(), and
#| ggtitle(). In addition, the function labs() is more
#| general and can be used to label either or both axes
#| as well as provide a title. Now recall the
#| expression you just typed and add a call to the
#| function ggtitle with the argument "Swirl Rules!".

g+geom_point()+geom_smooth(method="lm"),+facet_grid(.~drv)+ggtitle("Swirl Rules!")

#| Now that you've seen the basics we'll talk about
#| customizing. Each of the “geom” functions (e.g.,
#| _point and _smooth) has options to modify it. Also,
#| the function theme() can be used to modify aspects
#| of the entire plot, e.g. the position of the legend.
#| Two standard appearance themes are included in
#| ggplot. These are theme_gray() which is the default
#| theme (gray background with white grid lines) and
#| theme_bw() which is a plainer (black and white)
#| color scheme.

#| Let's practice modifying aesthetics now. We'll use
#| the graphic object g that we already filled with mpg
#| data and add a call to the function geom_point, but
#| this time we'll give geom_point 3 arguments. Set the
#| argument color equal to "pink", the argument size to
#| 4, and the argument alpha to 1/2. Notice that all
#| the arguments are set equal to constants.

g+geom_point(color="pink",size=4,alpha=1/2)

#| Notice the different shades of pink? That's the
#| result of the alpha aesthetic which you set to 1/2.
#| This aesthetic tells ggplot how transparent the
#| points should be. Darker circles indicate values hit
#| by multiple data points.

#| Now we'll modify the aesthetics so that color
#| indicates which drv type each point represents.
#| Again, use g and add to it a call to the function
#| geom_point with 3 arguments. The first is size set
#| equal to 4, the second is alpha equal to 1/2. The
#| third is a call to the function aes with the
#| argument color set equal to drv. Note that you MUST
#| use the function aes since the color of the points
#| is data dependent and not a constant as it was in
#| the previous example.

g+geom_point(size=4,alpha=1/2,aes(color=drv))

#| Notice the helpful legend on the right decoding the
#| relationship between color and drv.

#| Now we'll practice modifying labels. Again, we'll
#| use g and add to it calls to 3 functions. First, add
#| a call to geom_point with an argument making the
#| color dependent on the drv type (as we did in the
#| previous example). Second, add a call to the
#| function labs with the argument title set equal to
#| "Swirl Rules!". Finally, add a call to labs with 2
#| arguments, one setting x equal to "Displacement" and
#| the other setting y equal to "Hwy Mileage".

g+geom_point(aes(color=drv))+labs(title="Swirl Rules!")+labs(x="Displacement", y="Hwy Mileage")

#| Note that you could have combined the two calls to
#| the function labs in the previous example. Now we'll
#| practice customizing the geom_smooth calls. Use g
#| and add to it a call to geom_point setting the color
#| to drv type (remember to use the call to the aes
#| function), size set to 2 and alpha to 1/2. Then add
#| a call to geom_smooth with 4 arguments. Set size
#| equal to 4, linetype to 3, method to "lm", and se to
#| FALSE.

g+geom_point(aes(color=drv),size=2,alpha=1/2)+geom_smooth(size=4,linetype=3,method="lm",se=FALSE)

#| What did these arguments do? The method specified a
#| linear regression (note the negative slope
#| indicating that the bigger the displacement the
#| lower the gas mileage), the linetype specified that
#| it should be dashed (not continuous), the size made
#| the dashes big, and the se flag told ggplot to turn
#| off the gray shadows indicating standard errors
#| (confidence intervals).

#| Finally, let's do a simple plot using the black and
#| white theme, theme_bw. Specify g and add a call to
#| the function geom_point with the argument setting
#| the color to the drv type. Then add a call to the
#| function theme_bw with the argument base_family set
#| equal to "Times". See if you notice the difference.

g+geom_point(aes(color=drv))+theme_bw(base_family="Times")

#| No more gray background! Also, if you have good
#| eyesight, you'll notice that the font in the labels
#| changed.

#| One final note before we go through a more
#| complicated, layered ggplot example, and this
#| concerns the limits of the axes. We're pointing this
#| out to emphasize a subtle difference between ggplot
#| and the base plotting function plot.

#| We've created some random x and y data, called myx
#| and myy, components of a dataframe called testdat.
#| These represent 100 random normal points, except
#| halfway through, we made one of the points be an
#| outlier. That is, we set its y-value to be out of
#| range of the other points. Use the base plotting
#| function plot to create a line plot of this data.
#| Call it with 4 arguments - myx, myy, type="l", and
#| ylim=c(-3,3). The type="l" tells plot you want to
#| display the data as a line instead of as a
#| scatterplot.

#warning messages from top-level task callback 'mini'
#There were 40 warnings (use warnings() to see them)

plot(myx, myy, type = "l", ylim = c(-3,3))

g <- ggplot(testdat, aes(x = myx, y = myy))

g+geom_line()

#| Notice how ggplot DID display the outlier point at
#| (50,100). As a result the rest of the data is
#| smashed down so you don't get to see what the bulk
#| of it looks like. The single outlier probably isn't
#| important enough to dominate the graph. How do we
#| get ggplot to behave more like plot in a situation
#| like this?

#| Let's take a guess that in addition to adding
#| geom_line() to g we also just have to add ylim(-3,3)
#| to it as we did with the call to plot. Try this now
#| to see what happens.

g+geom_line()+ylim(-3,3)

#| Notice that by doing this, ggplot simply ignored the
#| outlier point at (50,100). There's a break in the
#| line which isn't very noticeable. Now recall that at
#| the beginning of the lesson we mentioned 7
#| components of a ggplot plot, one of which was a
#| coordinate system. This is a situation where using a
#| coordinate system would be helpful. Instead of
#| adding ylim(-3,3) to the expression g+geom_line(),
#| add a call to the function coord_cartesian with the
#| argument ylim set equal to c(-3,3).

g+geom_line()+coord_cartesian(ylim=c(-3,3))

#| See the difference? This looks more like the plot
#| produced by the base plot function. The outlier y
#| value at x=50 is not shown, but the plot indicates
#| that it is larger than 3.

#| We'll close with a more complicated example to show
#| you the full power of ggplot and the entire ggplot2
#| package. We'll continue to work with the mpg
#| dataset.

#| Start by creating the graphical object g by
#| assigning to it a call to ggplot with 2 arguments.
#| The first is the dataset and the second is a call to
#| the function aes. This call will have 3 arguments, x
#| set equal to displ, y set equal to hwy, and color
#| set equal to factor(year). This last will allow us
#| to distinguish between the two manufacturing years
#| (1999 and 2008) in our data.

g<-ggplot(mpg,aes(x=displ,y=hwy,color=factor(year)))

#| Uh oh! Nothing happened. Does g exist? Of course, it
#| just isn't visible yet since you didn't add a layer.

####Printing g at the command line will return an error

g+geom_point()

#| A simple, yet comfortingly familiar scatterplot
#| appears. Let's make our display a 2 dimensional
#| multi-panel plot. Recall your last command (with the
#| up arrow) and add to it a call the function
#| facet_grid. Give it 2 arguments. The first is the
#| formula drv~cyl, and the second is the argument
#| margins set equal to TRUE. Try this now.

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)

#| A 4 by 5 plot, huh? The margins argument tells
#| ggplot to display the marginal totals over each row
#| and column, so instead of seeing 3 rows (the number
#| of drv factors) and 4 columns (the number of cyl
#| factors) we see a 4 by 5 display. Note that the
#| panel in position (4,5) is a tiny version of the
#| scatterplot of the entire dataset.

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",se=FALSE,size=2,color="black")

#| Angry Birds? Finally, add to your last command (or
#| retype it if you like to type) a call to the
#| function labs with 3 arguments. These are x set to
#| "Displacement", y set to "Highway Mileage", and
#| title set to "Swirl Rules!".

g+geom_point()+facet_grid(drv~cyl,margins=TRUE)+geom_smooth(method="lm",se=FALSE,size=2,color="black")+labs(x="Displacement",y="Highway Mileage",title="Swirl Rules!")

#| You could have done these labels with separate calls
#| to labs but we thought you'd be sick of this by now.
#| Anyway, congrats! You've concluded part 2 of
#| ggplot2. We hope you got enough mileage out of the
#| lesson. If you like ggplot2 you can do some extras
#| with the extra lesson.

######END GGPLOT2 PART 2 SWIRL LESSON 

#| GGPlot2_Extras. (Slides for this and other Data
#| Science courses may be found at github
#| https://github.com/DataScienceSpecialization/courses/.
#| If you care to use them, they must be downloaded as
#| a zip file and viewed locally. This lesson
#| corresponds to 04_ExploratoryAnalysis/ggplot2.)








