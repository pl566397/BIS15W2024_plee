---
title: "hw8.md"
author: "Pachia Lee"
date: "2024-02-15"
output: html_document
---

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
``` 

## Install `here`
The package `here` is a nice option for keeping directories clear when loading files. I will demonstrate below and let you decide if it is something you want to use.  
```{r}
#install.packages("here")
```

## Data
For this homework, we will use a data set compiled by the Office of Environment and Heritage in New South Whales, Australia. It contains the enterococci counts in water samples obtained from Sydney beaches as part of the Beachwatch Water Quality Program. Enterococci are bacteria common in the intestines of mammals; they are rarely present in clean water. So, enterococci values are a measurement of pollution. `cfu` stands for colony forming units and measures the number of viable bacteria in a sample [cfu](https://en.wikipedia.org/wiki/Colony-forming_unit).   

This homework loosely follows the tutorial of [R Ladies Sydney](https://rladiessydney.org/). If you get stuck, check it out!  

1. Start by loading the data `sydneybeaches`. Do some exploratory analysis to get an idea of the data structure.
```{r}
sydneybeaches <- read_csv("data/sydneybeaches.csv") %>% clean_names()
```

If you want to try `here`, first notice the output when you load the `here` library. It gives you information on the current working directory. You can then use it to easily and intuitively load files.
```{r}
#library(here)
```

The quotes show the folder structure from the root directory.
```{r}
#sydneybeaches <-read_csv(here("homework", "data", "sydneybeaches.csv")) %>% clean_names()
```

2. Are these data "tidy" per the definitions of the tidyverse? How do you know? Are they in wide or long format?
#No it is not tidy because it has multiple variables in observations.

3. We are only interested in the variables site, date, and enterococci_cfu_100ml. Make a new object focused on these variables only. Name the object `sydneybeaches_long`
```{r}
sydneybeaches_long<- sydneybeaches %>%
  select(site, date, enterococci_cfu_100ml)
```

4. Pivot the data such that the dates are column names and each beach only appears once (wide format). Name the object `sydneybeaches_wide`
```{r}
sydneybeaches_wide<- sydneybeaches_long %>% 
  pivot_wider(names_from = "date",
              values_from = "enterococci_cfu_100ml")
```

5. Pivot the data back so that the dates are data and not column names.
```{r}
sydneybeaches_wide %>%
  pivot_longer(-site,
               names_to = "date",
               values_to = "enterococci_cfu_100ml")
```

6. We haven't dealt much with dates yet, but separate the date into columns day, month, and year. Do this on the `sydneybeaches_long` data.
```{r}
sydneybeaches_long %>% 
  separate(date, into= c("day", "month", "year", sep = "/"))
```

7. What is the average `enterococci_cfu_100ml` by year for each beach. Think about which data you will use- long or wide.
```{r}
average_sydney<- sydneybeaches_long %>% 
  separate(date, into= c("day", "month", "year", sep = "/")) %>% 
  group_by(year) %>%
  summarize(average_enterococci= mean(enterococci_cfu_100ml, na.rm=T))
  
```

8. Make the output from question 7 easier to read by pivoting it to wide format.
```{r}
average_sydney%>% 
  pivot_wider(names_from = "year", 
              values_from = "average_enterococci")
```

9. What was the most polluted beach in 2013?
```{r}
sydneybeaches_wide %>%
  pivot_longer(-site,
               names_to = "date",
               values_to = "enterococci_cfu_100ml") %>% 
  separate(date, into= c("day", "month", "year", sep = "/")) %>% 
  filter(year==2013) %>% 
  arrange(desc(enterococci_cfu_100ml))
  
```

10. Please complete the class project survey at: [BIS 15L Group Project](https://forms.gle/H2j69Z3ZtbLH3efW6)
completed

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.   