---
title: "hw9.md"
author: "Pachia Lee"
date: "2024-02-20"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the libraries
```{r message=FALSE, warning=FALSE}
library(tidyverse)
library(janitor)
library(here)
library(naniar)
``` 

For this homework, we will take a departure from biological data and use data about California colleges. These data are a subset of the national college scorecard (https://collegescorecard.ed.gov/data/). Load the `ca_college_data.csv` as a new object called `colleges`.
```{r}
colleges<- read_csv("data/ca_college_data.csv") %>% clean_names()
```

The variables are a bit hard to decipher, here is a key:  

INSTNM: Institution name  
CITY: California city  
STABBR: Location state  
ZIP: Zip code  
ADM_RATE: Admission rate  
SAT_AVG: SAT average score  
PCIP26: Percentage of degrees awarded in Biological And Biomedical Sciences  
COSTT4_A: Annual cost of attendance  
C150_4_POOLED: 4-year completion rate  
PFTFTUG1_EF: Percentage of undergraduate students who are first-time, full-time degree/certificate-seeking undergraduate students  

1. Use your preferred function(s) to have a look at the data and get an idea of its structure. Make sure you summarize NA's and determine whether or not the data are tidy. You may also consider dealing with any naming issues.
```{r}
glimpse(colleges)
#data is not tidy because there are observations as columns
```

2. Which cities in California have the highest number of colleges?
```{r}
colleges %>% 
  filter(stabbr=="CA") %>% 
  group_by(stabbr) %>% 
  count(city) %>% 
  arrange(desc(n))
```

3. Based on your answer to #2, make a plot that shows the number of colleges in the top 10 cities.
```{r}
colleges %>% 
  count(city) %>% 
  top_n(10, n) %>%
  arrange(desc(n)) %>% 
  ggplot(aes(x=city, y=n))+
  geom_col()+
  coord_flip()

```

4. The column `COSTT4_A` is the annual cost of each institution. Which city has the highest average cost? Where is it located?
```{r}
colleges %>% 
  group_by(city) %>% 
  summarize(annual_cost=mean(costt4_a, na.rm=T)) %>% 
  arrange(desc(annual_cost))
```

5. Based on your answer to #4, make a plot that compares the cost of the individual colleges in the most expensive city. Bonus! Add UC Davis here to see how it compares :>).
```{r}
colleges %>% 
  select(instnm, city, costt4_a) %>% 
  filter(city=="Claremont" & costt4_a !="NA"| instnm=="University of California-Davis") %>% 
  ggplot(aes(x=instnm, y=costt4_a))+
  geom_col()+
  coord_flip()
```

6. The column `ADM_RATE` is the admissions rate by college and `C150_4_POOLED` is the four-year completion rate. Use a scatterplot to show the relationship between these two variables. What do you think this means?
```{r}
ggplot(data=colleges,
       mapping=aes(x=adm_rate, y=c150_4_pooled))+
  geom_point(na.rm=T)
```

7. Is there a relationship between cost and four-year completion rate? (You don't need to do the stats, just produce a plot). What do you think this means?
```{r}
ggplot(data=colleges,
       mapping=(aes(x=costt4_a, y=c150_4_pooled)))+
  geom_point(na.rm=T)
```

8. The column titled `INSTNM` is the institution name. We are only interested in the University of California colleges. Make a new data frame that is restricted to UC institutions. You can remove `Hastings College of Law` and `UC San Francisco` as we are only interested in undergraduate institutions.

Remove `Hastings College of Law` and `UC San Francisco` and store the final data frame as a new object `univ_calif_final`.
```{r}
univ_calif_final<- colleges %>% 
  filter_all(any_vars(str_detect(.,pattern="University of California"))) %>% 
  filter(city !="San Fransico")
```

Use `separate()` to separate institution name into two new columns "UNIV" and "CAMPUS".
```{r}
univ_calif_final<- univ_calif_final %>% 
  separate(instnm, into=c("univ", "campus"), sep="-")
```

9. The column `ADM_RATE` is the admissions rate by campus. Which UC has the lowest and highest admissions rates? Produce a numerical summary and an appropriate plot.
```{r}
univ_calif_final %>% 
  select(campus, adm_rate) %>% 
  arrange(desc(adm_rate))
```

```{r}
univ_calif_final %>% 
  select(campus, adm_rate) %>% 
  arrange(desc(adm_rate)) %>% 
  ggplot(aes(x=campus, y=adm_rate))+
  geom_col()+
  coord_flip()
```

10. If you wanted to get a degree in biological or biomedical sciences, which campus confers the majority of these degrees? Produce a numerical summary and an appropriate plot.
```{r}
univ_calif_final %>% 
  select(campus, pcip26) %>% 
  arrange(desc(pcip26))
```

## Knit Your Output and Post to [GitHub](https://github.com/FRS417-DataScienceBiologists)