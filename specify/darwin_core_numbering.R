rm(list=ls())

library(xlsx)
library(dplyr)
library(tidyr)

setwd("/Users/marinacostarillo/Documents/Classify-Specify/specify")
# list.files()

file <- read.xlsx("Buckley_Specimens_for_R_image_names.xlsx",sheetIndex=1, header = T)

image_name_vector <- as.character(file$Image.name)

# substituing the double name, otherwise it creates an extra column in function 'separate'
length(grep(pattern = "aequilateralis-siphonifera", image_name_vector))
image_name_vector <- sub(pattern="aequilateralis-siphonifera", replacement="siphonifera", x=image_name_vector)
length(grep(pattern = "aequilateralis-siphonifera", image_name_vector))

image_name_df <- as.data.frame(image_name_vector) %>% separate(image_name_vector, into = paste("V", 1:6, sep = "_"))

image_name_df <- cbind(image_name = image_name_vector, 
                  new_sub_indiv = ave(image_name_df$V_4, as.factor(image_name_df$V_1), FUN = seq_along),
                  image_name_df)
head(image_name_df)
write.csv(image_name_df,"Buckley_Specimens_for_R_numbers.csv", row.names = F)

