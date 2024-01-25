---
title: "lab4_hw"
author: "Pachia Lee"
date: "2024-01-25"
output:
  html_document: default
  pdf_document: default
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

## Load the tidyverse
```{r message=FALSE, warning=FALSE}
library(tidyverse)
```

## Data
For the homework, we will use data about vertebrate home range sizes. The data are in the class folder, but the reference is below.  

**Database of vertebrate home range sizes.**  
Reference: Tamburello N, Cote IM, Dulvy NK (2015) Energy and the scaling of animal space use. The American Naturalist 186(2):196-211. http://dx.doi.org/10.1086/682070.  
Data: http://datadryad.org/resource/doi:10.5061/dryad.q5j65/1  

**1. Load the data into a new object called `homerange`.**
```{r}
homerange <-read.csv("data/Tamburelloetal_HomeRangeDatabase.csv")
```

**2. Explore the data. Show the dimensions, column names, classes for each variable, and a statistical summary. Keep these as separate code chunks.**  
```{r}
dim(homerange)
```

```{r}
names(homerange)
```

```{r}
select_if(homerange, is.character)
```

```{r}
summary(homerange)
```


**3. Change the class of the variables `taxon` and `order` to factors and display their levels.**  
```{r}
homerange$taxon<-as.factor(homerange$taxon)
homerange$order<-as.factor(homerange$order)
```

```{r}
levels(homerange$taxon)
levels(homerange$order)
```


**4. What taxa are represented in the `homerange` data frame? Make a new data frame `taxa` that is restricted to taxon, common name, class, order, family, genus, species.**  
```{r}
taxa <- select(homerange, "taxon", "common.name", "class", "order", "family", "genus", "species")
```

**5. The variable `taxon` identifies the common name groups of the species represented in `homerange`. Make a table the shows the counts for each of these `taxon`.**  
```{r}
table(taxa$taxon)
```

**6. The species in `homerange` are also classified into trophic guilds. How many species are represented in each trophic guild.**  
```{r}
table(homerange$trophic.guild)
```
