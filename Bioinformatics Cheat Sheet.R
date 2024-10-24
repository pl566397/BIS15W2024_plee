library("tidyverse")
library(readr)
library(dplyr)
library("janitor")

#How to get working directory
getwd()

#How to set working directory
##Session>Set Working Directory>Choose Directory>Documents>folder name
setwd("C:/Users/plee/Documents/Bioinfo_R_analysis")


#How to import data from excel
elephants <- read_csv("data/ElephantsMF.csv")
fish <- read_csv("data/Gaeta_etal_CLC_data.csv")

##Data Structure Summary functions
#Once data have been uploaded, you may want to get an idea of its structure, contents, and dimensions. I routinely run one or more of these commands when data are first imported.  
summary(elephants) #tells us how big data is, gives us min, medium, max, can't do that to characters
summary(fish)

glimpse(elephants)

nrow(elephants) #4033 rows, # of rows

ncol(elephants) #number of col

dim(elephants) #gives the dimensions

names(elephants) #gives the column names

head(elephants) #gives you first few observations of dataframe

tail(fish) #gives you the few last snapshot of data frame

table(elephants) #useful when you have a limited number of categorical variables. It produces fast counts of the number of observations in a variable.

table(fish$lakeid)

View(elephants) #to view data,click on the `fish` data frame in the Environment tab or type View(fish)

str(fish) 


# Accessing Data Frame Columns and Rows 
##The first row.  
fish[5,]

##The third column.  
elephants[ ,3]



#Adding ROWS to data
# `rbind()` function, known as row bind will bind new vectors to our data frame row-wise.
#cannot rbind fish and elephants because their columns don't match (aka not the same data)
##Example: 
### Data frame 1
elephants
### Data Frame 2 
new_elephants <- c(1000, 1, "M")
### Combining them
elephants<- rbind(new_elephants, elephants) #adding "new_bird" to "hbirds"



## Adding Columns
#What if we come across more data and we want to add it to our data frame? We can also do that with the `$` operator.
elephants$Age <- c(3000,4000,5000)



## Writing Data to File
#We should save our hbirds data frame so we can use it again later! There are many ways to save data in R, here we write our data frame to a csv file. We use `row.names = FALSE` to avoid row numbers from printing out. 
write.csv(dataframe, "elephants.csv", row.names = FALSE)


##Select Function
# allows you to pull out columns of interest from a dataframe. To do this, just add the names of the columns to the `select()` command. The order in which you add them, will determine the order in which they appear in the output.
#We are only interested in lakeid and scalelength.
select(fish, "scalelength", "lakeid") #allows you to just pull out those columns, select(name of dataframe and the columns you want), fish is not a column so it is not in quotes

fish_subset<- select(fish, "fish_id", "length") #reversing length and fishid, it's going to give it in the reverse way #fishsubset chops up the dataframe and now we have it in our environment

select(fish, fish_id:length)# fish_id:length gives us the data in the columns from fish_id to length

select(fish, -fish_id, -annnumber, -length, -radii_length_mm) #- operator selects everything except the specified variables

select(fish, contains("length")) #pulls out data that contains the work length

select(fish, starts_with("radii")) #pull out all the variables that start with "radii"

select(fish, matches("a.+er"))

select_if(fish, is.numeric) #pull out all the numerics

select_if(fish, ~!is.numeric(.)) #look into fish and pull out everything that is not numeric

#Options to select columns based on a specific criteria include:  
#1. ends_with() = Select columns that end with a character string  
#2. contains() = Select columns that contain a character string  
#3. matches() = Select columns that match a regular expression 
#4. one_of() = Select columns names that are from a group of names  


#New Data
mammals <- read_csv("data/mammal_lifehistories_v2.csv")

#rename data to keep things uniformed
mammals <- rename(mammals, genus=Genus, wean_mass="wean mass", max_life="max. life", litter_size="litter size", litters_per_year="litters/year")


##FILTER FUNCTION
#Unlike `select()`, `filter()` allows us to extract data that meet specific criteria within a variable. Let's say that we are interested only in the fish that occur in lake "AL". We can use `filter()` to extract these observations.  

filter(fish, lakeid == "AL")#look in the fish data and pull out all the obersavtions that correspond to lakeid

little_fish <- filter(fish, length<=100) #fishes that are less than or equal to 100
little_fish

filter(fish, length >= 350) #all the observations that are greater than or equal to 350

filter(fish, lakeid == "AL" & length > 350)#filter, fish data with lakeid =="AL" AND length>350

filter(fish, lakeid == "AL" | length > 350)# | = or 

#+ `filter()` allows all of the expected operators; i.e. >, >=, <, <=, != (not equal), and == (equal).  
#Using the `!` operator allows for the exclusion of specific observations.

## Using `filter()` with multiple observations 
filter(fish, length %in% c(167, 175)) #filter is within the variable length that are 167 or 175
filter(fish, between(scalelength, 2.5, 2.55)) #look at fish, and look in scalelength in between 2.5 and 2.55
filter(fish, near(radii_length_mm, 2, tol = 0.2)) #look for radii length near 2 with a 0.2 tolerance


## Pipes `%>%` 
#In order to start combining `select()`, `filter()`, and other functions efficiently, we need to learn pipes. 
#Pipes feed the output from one function into the input of another function. This helps us keep our code sequential and clean.  
select(fish, lakeid, scalelength)
filter(fish, lakeid == "AL")

fish %>% 
  select(lakeid, scalelength) %>% 
  filter(lakeid == "AL")

fish %>% #fish data
  select(lakeid, radii_length_mm) %>% #pulls out variables of interest
  filter(lakeid=="AL" | lakeid== "AR") %>% #only these lakes
  filter(between(radii_length_mm, 2,4)) %>% #between 2 and 4
  arrange(radii_length_mm) #sort from greatest to least


##MUTATE FUNCTION
#Let's convert the length variable from cm to millimeters and create a new variable called length_mm.  
fish %>% 
  mutate(length_mm = length*10) %>% 
  select(fish_id, length, length_mm)

mammals %>%
  mutate_all(tolower)#makkes everything lowercase


#NEW DATA SET
superhero_info <- read_csv("data/heroes_information.csv", na = c("", "-99", "-"))# means that NA = "nothing", "-99", "-"
superhero_powers <- read_csv("data/super_hero_powers.csv", na = c("", "-99", "-"))

names(superhero_info)
names(superhero_powers)

superhero_info %>% 
  select(Publisher)

table(superhero_info$Publisher)

filter(superhero_info, Alignment=="neutral")

superhero_info %>% 
  select(name, Alignment, Race)

#List all of the superheros that are not human.
filter(superhero_info, Race != "Human" & Race != "Human / Radiation")

#Let's make two different data frames, one focused on the "good guys" and another focused on the "bad guys".

good_guys <- superhero_info %>% 
  select(name, Gender, Race, `Hair color`, Alignment, Publisher) %>% 
  filter(Alignment=="good")
good_guys



bad_guys <- superhero_info %>% #work w/ superhero data
  select(name, Gender, Race, `Hair color`, Height, Alignment, Publisher) %>% 
  filter(Alignment=="bad")
bad_guys

tabyl(good_guys, Race)#`tabyl` function to summarize their "race"

#Among the good guys, Who are the Vampires?
vampires <- good_guys %>% 
  select(name, Race) %>% 
  filter(Race=="Vampire")
vampires

#Among the bad guys, who are the male humans over 200 inches in height?
bad_guys %>% 
  select(name, Gender, Race, Height) %>% 
  filter(Height>200) %>% 
  filter(Gender=="Male")

#Are there more good guys or bad guys with green hair?  
good_guys %>% 
  select(name, `Hair color`) %>% 
  filter(`Hair color`== "Green")

bad_guys %>% 
  select(name, `Hair color`) %>% 
  filter(`Hair color`== "Green")

#Let's explore who the really small superheros are. In the `superhero_info` data, 
#which have a weight less than 50? Be sure to sort your results by weight lowest to highest.
superhero_info %>% 
  select(name, Weight) %>% 
  filter(Weight<50) %>% 
  arrange(Weight)# different from arrange(desc)

#Let's make a new variable that is the ratio of height to weight. Call this variable `height_weight_ratio`    
superhero_info %>% 
  mutate(height_weight_ratio = Height/Weight) %>% 
  select(name, height_weight_ratio)

