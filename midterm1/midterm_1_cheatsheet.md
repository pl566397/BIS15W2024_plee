---
title: "midterm1_cheatsheet"
author: "Pachia Lee"
date: "2024-02-06"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

##Libraries to upload
```{r}
#library(tidyverse)
#library(janitor) #clean_names & tabyl
#library(skimr)
```

## Uploading data
```{r}
#<-read.csv("data_folder_in_file/input_dataframe")
#<-read_csv("")
#clean_names(dataframe) 
```

##Structure/dimensions of data
```{r}
#str()
#glimpse()
#names()
#summary()
#dim()
#names()
#skim()
```

## Checking the type of data (character etc)
```{r}
#class()

#levels(hot_springs$scientist)#tells you how many different factors you have in a dataframe, JUST FACTORS

#is.integer(insert_variable) #is insert_variable an integer?

#hot_springs$scientist <- as.factor(hot_springs$scientist) #replace the scientist in the hotspring data frame to be a factor instead of character
```

##Columns in a dataframe
```{r}
#rename(data_frame, genus="Genus") #new name, old name

#count() #can use in pipe, it also counts variables within a column
  #Example:
    #penguins %>% #how many penguins were present on each island
  #count(island, sort = T) #sort=T sorts the column in descending order
  
  #penguins %>% 
  #count(island, species, sort = T) # sort=T will arrange in descending order #can use count across mutiple variables

#Instead of count you can also use tabyl (janitor package)

#penguins %>% 
  #tabyl(island, species) #tabyl is apart of janitor package
    
#table() #counts the amount of variables in a column, cannot use in pipe
#Example:
  #table(mammals$order)#gives you all the orders(column) and the #of animals within that column

#superhero_info %>% 
  #select(Publisher)
  
#table(superhero_info$Publisher) #this makes a table of superhero_info and their publishers

```

##NAs in the data
```{r}
#anyNA(input_data_frame) #how to look for NAs in dataframe

#mean(input_data_frame, na.rm=T) #when trying to take the mean of a data that has NAs, #na.rm removes the NA values in the vector equals True. F=False will give you NA again.

#mammals %>% 
  #select(genus, species, newborn) %>%
  #mutate(newborn_new = ifelse(newborn == -999.00, NA, newborn))%>% 
  #arrange(newborn) #turning -999.00 into NAs

#mammals %>% 
  #select(family, genus, species, max_life) %>% 
  #mutate(max_life_new = ifelse(max_life == -999.00, NA, max_life)) %>% 
  #arrange(desc(max_life_new))

#msleep24 <- msleep %>% 
  #select(name, vore, sleep_total) %>% 
  #mutate(sleep_total_24=sleep_total/24) %>% 
  #filter(sleep_total_24<=0.3) %>% 
  #arrange(desc(sleep_total_24))
#msleep24

#penguins %>% 
  #filter(!is.na(bill_length_mm)) %>% #take out all the nas and pick out things that only have a value in body mass in grams
  #group_by(species) %>% 
  #summarize(mean_bill_length_mm=mean(bill_length_mm),
            #na.rm=T)
```

##To pull out columns use: `dplyr`=select & filter
```{r}
#select()

#select(fish, fish_id:length)# fish_id:length gives us the data in the columns from fish_id to length

#select(fish, -fish_id, -annnumber, -length, -radii_length_mm) #- operator selects everything except the specified variables

#select(fish, contains("length")) #pulls out data that contains the work length

#select(fish, starts_with("radii")) #pull out all the variables that start with "radii"

#select(fish, ends_with("id"))

#select(fish, matches("a.+er")) #handy bit of code for the project, start with an a and ends with an er

#select_if(fish, is.numeric) #pull out all the numerics

#select_if(fish, ~!is.numeric(.)) #look into fish and pull out everything that is not numeric

#select_all(mammals, tolower) #select all data in mammals and make them lowercase

#dataframe %>% 
  #mutate_all(tolower)

#mammals %>% 
  #mutate(across(c("order", "family"), tolower))

#mammals %>% 
  #mutate(across(c("order", "family"), tolower)) #can mutate across these columns cz genus names should be capitalized (clean name only do column names)
```

##'across()'
```{r}
#penguins %>%
  #summarize(across(contains("mm"), mean, na.rm=T)) #summaries across all the variables with mm and remove NAs
```


##Pulling out variables
```{r}
#filter()

#filter(fish, lakeid == "AL")#look in the fish data and pull out all the obersavtions that correspond to lakeid

#filter(fish, length >= 350) #all the variables that are greater than or equal to 350, no quotes cz it is a number. 

#filter(fish, lakeid != "AL") #all variables that are not AL

#filter(fish, length %in% c(167, 175)) #filter is within the variable length that are 167 or 175

#filter(fish, between(scalelength, 2.5, 2.55)) #look at fish, and look in scalelength in between 2.5 and 2.55

#filter(fish, near(radii_length_mm, 2, tol = 0.2)) #look for radii length near 2 with a 0.2 tolerance

#filter(fish, lakeid == "AL" & length > 350) #interested in all the fish from lake AL but only the ones bigger than 350 in length

#filter(fish, lakeid == "AL" | length > 350) #vertical line stands for "or", so interested in the information from lakeid only from "AL" and only from fishes that are bigger than 350filter(fish, lakeid == "AL" | length > 350) #vertical line stands for "or", so interested in the information from lakeid only from "AL" and only from fishes that are bigger than 350

#filter(fish, length > 400, (scalelength > 11 | radii_length_mm > 8))#filter, fish data with length over 400, scalelength over 11 or radii_length over 8

#filter(superhero_info, Race != "Human" & Race != "Human / Radiation") #pull out data that is not human and human/radiation
```

## %>% Pipe
```{r}
#fish %>% #work w/ fish data
  #select(lakeid, radii_length_mm) %>% #pulls out variables of interest
  #filter(lakeid=="AL" | lakeid== "AR") %>% #only these lakes
  #filter(between(radii_length_mm, 2,4)) %>% #between 2 and 4
  #arrange(desc(radii_length_mm)) #sort 

#superhero_info %>% 
  #mutate(height_weight_ratio = Height/Weight) %>% 
  #select(name, height_weight_ratio) %>% 
  #filter(height_weight_ratio>100)
```

##Mutate()
```{r}
#mutate() #allows you to create a new column

#fish %>% 
  #mutate(length_mm = length*10) %>% #it is creating a new column with length*10 
  #select(fish_id, length, length_mm)
```

##Summarize() & group_by()
```{r}
#msleep %>% 
  #summarize(mean_sleep_total=mean(sleep_total),
            #min_sleep_total=min(sleep_total),
            #max_sleep_total=max(sleep_total),
            #sd_sleep_total=sd(sleep_total),
            #total=n())

#msleep %>%
  #group_by(vore) %>% #we are grouping by feeding ecology, a categorical variable
  #summarize(min_bodywt = min(bodywt), #groupby, groups together categorical variables before you summarize
            #max_bodywt = max(bodywt),
            #mean_bodywt = mean(bodywt),
            #total=n())

#penguins %>% 
  #group_by(island) %>%
  #summarize(mean_body_mass=mean(body_mass_g),
            #n=n())

#penguins %>% 
  #group_by(species, island) %>% #group_by() only works with categorical variables
  #summarize(n=n(), .groups= 'keep')#the .groups argument here just prevents a warning message; n=n() means the number of observations;
```

##NAs in pipe
```{r}
#penguins %>% 
  #group_by(island) %>% 
  #summarize(number_NAs=sum(is.na(body_mass_g))) #this tells me how many Nas there are in each column

#penguins %>% 
  #filter(!is.na(body_mass_g)) %>% #take out all the nas and pick out things that only have a value in body mass in grams
  #group_by(island) %>% 
  #summarize(mean_body_mass=mean(body_mass_g),
            #total=n())

#penguins %>%
  #group_by(sex) %>% 
  #summarize(across(contains("mm"), mean, na.rm=T))
```


##Misc. Things to Remember

#How to insert a website
```{r}
#[Class Website](https://jmledford3115.github.io/datascibiol/)
```

#How to find your working directory
```{r}
#getwd()
```

