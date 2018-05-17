rm(list=ls())

library(xlsx)
library(dplyr)
library(tidyr)

setwd("/Users/marinacostarillo/Documents/Classify-Specify/specify")
# list.files()

test <- read.xlsx("Buckley_DC_tabR_image_names.xlsx",sheetIndex=1, header = T)
image_name_vector <- as.character(test$Image.name)

image_name_df <- as.data.frame(image_name_vector) %>% separate(image_name_vector, into = paste("V", 1:12, sep = "_"))

image_name_df <- cbind(image_name = image_name_vector, 
                  new_sub_indiv = ave(image_name_df$V_4, as.factor(image_name_df$V_1), FUN = seq_along),
                  image_name_df)
image_name_df
