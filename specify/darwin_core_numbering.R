rm(list=ls())

setwd("/Users/marinacostarillo/Documents/Classify-Specify/specify")

library(xlsx)
library(dplyr)
library(tidyr)

test <- read.xlsx("seq_numbering_test.xlsx",sheetIndex=1, header = T)
image_name_vector <- as.character(test$Image.name)

image_name_df <- as.data.frame(image_name_vector) %>% separate(image_name_vector, into = paste("V", 1:8, sep = "_"))

cbind(image_name_vector, image_name_df)
