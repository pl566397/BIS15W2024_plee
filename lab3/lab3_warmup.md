---
title: "Lab 3 Warm-Up"
date: "2024-01-18"
output:
  html_document: 
    theme: spacelab
    toc: yes
    toc_float: yes
    keep_md: yes
  pdf_document:
    toc: yes
---



### 1. Plant Height Vector.

```r
plant_height <- c(30.7, 37.6, 28.4, NA, 33.2)
```

### 2. Plant Weight Vector.

```r
plant_weight <- c(4, 5.2, 3.7, NA, 4.6)
```

### 3. Labels for data matrix.

```r
samples <- c("plant1", "plant2", "plant3", "plant4", "plant5")
measured <- c("height", "weight")
```

### 4. Combine data for height and weight.

```r
plant_experiment <- c(plant_height, plant_weight)
```

### 5. Build the data matrix.

```r
plant_experiment_matrix <- matrix(plant_experiment, nrow = 5, byrow = F)
```

### 6. Name the columns and rows.

```r
colnames(plant_experiment_matrix) <- measured
rownames(plant_experiment_matrix) <- samples
```

### 7. Calculate the means of each column.

```r
plant_means <- colMeans(plant_experiment_matrix, na.rm=T)
```

### 8. Add this as a new row.

```r
plant_experiment_matrix_final <- rbind(plant_experiment_matrix, plant_means)
```

### 9. Print the matrix.

```r
plant_experiment_matrix_final
```

```
##             height weight
## plant1      30.700  4.000
## plant2      37.600  5.200
## plant3      28.400  3.700
## plant4          NA     NA
## plant5      33.200  4.600
## plant_means 32.475  4.375
```
