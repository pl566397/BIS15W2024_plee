---
title: "lab6_2"
author: "Pachia Lee"
date: "2024-02-01"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

1. Who are the publishers of the superheros? Show the proportion of superheros from each publisher. Which publisher has the highest number of superheros?  
```{r}
names(superhero_info)
```

```{r}
superhero_info %>% 
  select(Publisher)
  
table(superhero_info$Publisher)
```


2. Notice that we have some neutral superheros! Who are they? List their names below.  
```{r}
filter(superhero_info, Alignment=="neutral")
```

## `superhero_info`
3. Let's say we are only interested in the variables name, alignment, and "race". How would you isolate these variables from `superhero_info`?
```{r}
superhero_info %>% 
  select(name, Alignment, Race)
```

## Not Human
4. List all of the superheros that are not human.
```{r}
filter(superhero_info, Race != "Human" & Race != "Human / Radiation")
```

## Good and Evil
5. Let's make two different data frames, one focused on the "good guys" and another focused on the "bad guys".
```{r}
good_guys <- superhero_info %>% #work w/ superhero data
  select(name, Gender, Race, `Hair color`, Alignment, Publisher) %>% 
  filter(Alignment=="good")
good_guys
```

```{r}
bad_guys <- superhero_info %>% #work w/ superhero data
  select(name, Gender, Race, `Hair color`, Height, Alignment, Publisher) %>% 
  filter(Alignment=="bad")
bad_guys
```

6. For the good guys, use the `tabyl` function to summarize their "race".
```{r}
tabyl(good_guys, Race)
```

7. Among the good guys, Who are the Vampires?
```{r}
vampires <- good_guys %>% 
  select(name, Race) %>% 
  filter(Race=="Vampire")
vampires
```

8. Among the bad guys, who are the male humans over 200 inches in height?
```{r}
bad_guys %>% 
  select(name, Gender, Race, Height) %>% 
  filter(Height>200) %>% 
  filter(Gender=="Male")
```


9. Are there more good guys or bad guys with green hair?  
```{r}
good_guys %>% 
  select(name, `Hair color`) %>% 
  filter(`Hair color`== "Green")
```

```{r}
bad_guys %>% 
  select(name, `Hair color`) %>% 
  filter(`Hair color`== "Green")
```

10. Let's explore who the really small superheros are. In the `superhero_info` data, which have a weight less than 50? Be sure to sort your results by weight lowest to highest.  
```{r}
superhero_info %>% 
  select(name, Weight) %>% 
  filter(Weight<50) %>% 
  arrange(Weight)
```

11. Let's make a new variable that is the ratio of height to weight. Call this variable `height_weight_ratio`.    
```{r}
superhero_info %>% 
  mutate(height_weight_ratio = Height/Weight) %>% 
  select(name, height_weight_ratio)
```

12. Who has the highest height to weight ratio?  
```{r}
superhero_info %>% 
  mutate(height_weight_ratio = Height/Weight) %>% 
  select(name, height_weight_ratio) %>% 
  filter(height_weight_ratio>100)
```

## `superhero_powers`
Have a quick look at the `superhero_powers` data frame.  

13. How many superheros have a combination of agility, stealth, super_strength, stamina?
```{r}
superhero_powers %>% 
  select(hero_names, Agility, Stealth, `Super Strength`, Stamina) %>% 
  filter(Agility=="TRUE", Stealth=="TRUE", `Super Strength`=="TRUE", Stamina=="TRUE")
```

## Your Favorite
14. Pick your favorite superhero and let's see their powers!  
```{r}
spider_man <- superhero_powers %>% 
  filter(hero_names=="Spider-Man") %>% 
  select_if(.=="TRUE")
spider_man
```

15. Can you find your hero in the superhero_info data? Show their info! 
```{r}
superhero_info %>% 
  filter(name=="Spider-Man")
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences. 