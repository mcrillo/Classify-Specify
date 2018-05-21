rm(list=ls())

library(xlsx)
library(dplyr)
library(tidyr)

setwd("/Users/marinacostarillo/Documents/Classify-Specify/specify")
# list.files()




### Specimens for R (no squares) ######################################################################

file <- read.xlsx("Buckley_Specimens_for_R_image_names.xlsx",sheetIndex=1, header = T)

name_vector <- as.character(file$Image.name)

# substituing the double name, otherwise it creates an extra column in function 'separate'
length(grep(pattern = "aequilateralis-siphonifera", name_vector))
name_vector <- sub(pattern="aequilateralis-siphonifera", replacement="siphonifera", x=name_vector)
length(grep(pattern = "aequilateralis-siphonifera", name_vector))

# separating the names into parts
name_df <- as.data.frame(name_vector) %>% separate(name_vector, into = paste("V", 1:6, sep = "_"))

# creating sequential numbering for each ZF number 
name_df <- cbind(name = name_vector, 
                  new_sub_indiv = ave(name_df$V_4, as.factor(name_df$V_1), FUN = seq_along),
                  name_df)


head(name_df)
write.csv(name_df,"Buckley_Specimens_for_R_numbers.csv", row.names = F)




### Specimens for R with one square ###############################################################

file_1sq <- read.xlsx("Buckley_R_one_sq.xlsx",sheetIndex=1, header = T)

name_vector_1sq <- as.character(file_1sq$Image.name)

# separating names into parts
name_df_1sq <- as.data.frame(name_vector_1sq) %>% separate(name_vector_1sq, into = paste("V", 1:7, sep = "_"))

# getting unique slide and square to add sequential number to it
name_df_1sq$slide_new_ind <- as.factor(paste(name_df_1sq$V_1,name_df_1sq$V_4, sep='_'))

name_df_1sq$new_ind <- sub(pattern='square', replacement='', x=name_df_1sq$V_4)

name_df_1sq <- cbind(name = name_vector_1sq, name_df_1sq,
                        new_sub_indiv = ave(name_df_1sq$V_5, as.factor(name_df_1sq$slide_new_ind), FUN = seq_along))

write.csv(name_df_1sq,"Buckley_Specimens_R_squares_1sq.csv", row.names = F)




### Specimens for R with two squares ###############################################################
file_2sq <- read.xlsx("Buckley_R_two_sq.xlsx",sheetIndex=1, header = T)

name_vector_2sq <- as.character(file_2sq$Image.name)

# separating names into parts
name_df_2sq <- as.data.frame(name_vector_2sq) %>% separate(name_vector_2sq, into = paste("V", 1:8, sep = "_"))

# getting unique slide and square to add sequential number to it
name_df_2sq$slide_new_ind <- as.factor(paste(name_df_2sq$V_1,name_df_2sq$V_4,name_df_2sq$V_5, sep='_'))

name_df_2sq$new_ind <- sub(pattern='square', replacement='', x=paste(name_df_2sq$V_4,name_df_2sq$V_5, sep='_'))

name_df_2sq <- cbind(name = name_vector_2sq, name_df_2sq,
                     new_sub_indiv = ave(name_df_2sq$V_5, as.factor(name_df_2sq$slide_new_ind), FUN = seq_along))

write.csv(name_df_2sq,"Buckley_Specimens_R_squares_2sq.csv", row.names = F)



### Specimens for R with three squares ###############################################################
file_3sq <- read.xlsx("Buckley_R_three_sq.xlsx",sheetIndex=1, header = T)

name_vector_3sq <- as.character(file_3sq$Image.name)

# separating names into parts
name_df_3sq <- as.data.frame(name_vector_3sq) %>% separate(name_vector_3sq, into = paste("V", 1:9, sep = "_"))

# getting unique slide and square to add sequential number to it
name_df_3sq$slide_new_ind <- as.factor(paste(name_df_3sq$V_1, name_df_3sq$V_4, name_df_3sq$V_5, name_df_3sq$V_6, sep='_'))

name_df_3sq$new_ind <- sub(pattern='square', replacement='', x=paste(name_df_3sq$V_4,name_df_3sq$V_5, name_df_3sq$V_6, sep='_'))

name_df_3sq <- cbind(name = name_vector_3sq, name_df_3sq,
                     new_sub_indiv = ave(name_df_3sq$V_5, as.factor(name_df_3sq$slide_new_ind), FUN = seq_along))

head(name_df_3sq)
write.csv(name_df_3sq,"Buckley_Specimens_R_squares_3sq.csv", row.names = F)



