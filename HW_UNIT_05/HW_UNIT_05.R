#################################################################
## DDS UNIT 05 Assignment
## Jeremy Lubich
## 2017/10/08
#################################################################

## Question 1 - Data Munging - yob2016.txt

## 1.a Import File

setwd("C:/Users/LubichJD/OneDrive - Unisys/SMU/DDS/MyGitHubFiles/MSDS-Jeremy-Lubich/HW_UNIT_05")

df <- read.delim("yob2016.txt", sep = ";", header= FALSE, col.names = c("Name", "Gender", "Count"))

## 1.b Display Summary and Structure

summary(df)
str(df)

## 1.c Find and display the record with yyy at the end

subset(df, grepl("yyy", df$Name))

## 1.d Remove the bad record and save as y2016

y2016 <- df[-grepl("yyy", df$Name), ]

## Question 2 - Data Merging 

## 2.a Import File yob2015.txt as y2015

y2015 <- read.delim("yob2015.txt", sep = ",", header= FALSE, col.names = c("Name", "Gender", "Count"))

## 2.b Display last 10 rows and comment on what you see

tail(y2015, 10)
print("Interesting, the last 10 rows are all boys")

## 2.c Merge t2015 & y2016 inner join on Name, assign to final

final <- merge(
    y2015, 
    y2016, 
    by.x = "Name", 
    by.y = "Name"
)

## Question 3 - Data Summary

## 3.a Create "Total" column and display the total 

final$Total <- final$Count.x + final$Count.y

## 3.b Sort by Total, List the top 10 most popular names

final <- final[order(-final$Total), ]
head(final, 10)

## 3.c Omit Boys names and give top 10 girls names

head(final[final$Gender.x == "F", ], 10)

## 3.d Write the top 10 girls names and Totals to a CSV, leaving other columns out

top.10.girls <- head(final[final$Gender.x == "F", c("Name", "Total")], 10)

write.csv(top.10.girls, "Top10GirlNames.csv", row.names = FALSE)

## Question 4 - Github

## Create Code book - README











