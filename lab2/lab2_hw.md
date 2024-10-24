---
title: "Lab 2 Homework"
author: "Pachia Lee"
date: "2024-01-17"
output:
  html_document:
    theme: spacelab
    toc: no
---

## Instructions
Answer the following questions and complete the exercises in RMarkdown. Please embed all of your code and push your final work to your repository. Your final lab report should be organized, clean, and run free from errors. Remember, you must remove the `#` for the included code chunks to run. Be sure to add your name to the author header above.  

Make sure to use the formatting conventions of RMarkdown to make your report neat and clean!  

1. What is a vector in R?  
A vector in R is a way of organizing data. 

2. What is a data matrix in R?  
A data matrix is a series of vectors all stacked together.

3. Below are data collected by three scientists (Jill, Steve, Susan in order) measuring temperatures of eight hot springs. Run this code chunk to create the vectors.  
```{r}
spring_1 <- c(36.25, 35.40, 35.30)
spring_2 <- c(35.15, 35.35, 33.35)
spring_3 <- c(30.70, 29.65, 29.20)
spring_4 <- c(39.70, 40.05, 38.65)
spring_5 <- c(31.85, 31.40, 29.30)
spring_6 <- c(30.20, 30.65, 29.75)
spring_7 <- c(32.90, 32.50, 32.80)
spring_8 <- c(36.80, 36.45, 33.15)
```

4. Build a data matrix that has the springs as rows and the columns as scientists.  

```{r}
hot_springs <- c(spring_1, spring_2, spring_3, spring_4, spring_5, spring_6, spring_7, spring_8)
hot_springs
```

```{r}
hot_spring_matrix <- matrix(hot_springs, nrow = 8, byrow = T)
hot_spring_matrix
```

5. The names of the springs are 1.Bluebell Spring, 2.Opal Spring, 3.Riverside Spring, 4.Too Hot Spring, 5.Mystery Spring, 6.Emerald Spring, 7.Black Spring, 8.Pearl Spring. Name the rows and columns in the data matrix. Start by making two new vectors with the names, then use `colnames()` and `rownames()` to name the columns and rows.

```{r}
region <- c("Jill", "Steve", "Susan")
region
```

```{r}
titles <- c("Bluebell Spring", "Opal Spring", "Riverside Spring", "Too Hot Spring", "Mystery Spring", "Emerald Spring", "Black Spring", "Pearl Spring")
titles
```

```{r}
colnames(hot_spring_matrix) <- region
```

```{r}
rownames(hot_spring_matrix) <- titles
```

```{r}
hot_spring_matrix
```


6. Calculate the mean temperature of all eight springs.

```{r}
average_temp <-rowMeans(hot_spring_matrix)
average_temp
```


7. Add this as a new column in the data matrix.  

```{r}
hot_spring_matrix <- cbind(hot_spring_matrix, average_temp)
hot_spring_matrix
```

8. Show Susan's value for Opal Spring only.

```{r}
hot_spring_matrix[2,3]
```

9. Calculate the mean for Jill's column only.  

```{r}
jill <-c(36.25, 35.15, 30.70, 39.70, 31.85, 30.20, 32.90, 36.80)
```

```{r}
jill_column <-jill
```

```{r}
mean(jill_column)
```

10. Use the data matrix to perform one calculation or operation of your interest.

```{r}
steve <-c(35.40, 35.35, 29.65, 40.05, 31.40, 30.65, 32.50, 36.45)
```

```{r}
steve_column <-steve
```

```{r}
mean(steve_column)
```

## Push your final code to GitHub!
Please be sure that you check the `keep md` file in the knit preferences.  
