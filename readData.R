
#   ____________________________________________________________________________
#   Database modified Day                                                   ####

modifiedDay <- "2021-05-23"

#   ____________________________________________________________________________
#   Send Email                                                              ####

adminEmail <- "wangqq0515@163.com"
adminEmailPassword <- "otaudkznvbgthihf"

smtp <- server(host = "smtp.qq.com",
               port = 587,
               username = adminEmail,
               password = adminEmailPassword)

#   ____________________________________________________________________________
#   Reviewed Marker Gene Database                                           ####

summary_speciesVShsot <- openxlsx::read.xlsx("www/data/summary_speciesVShsot_number.xlsx", colNames = T)
summary_speciesVShsot_Type <- openxlsx::read.xlsx("www/data/summary_speciesVShsot_type.xlsx", colNames = T)

load("www/data/species_ann_df.R")
for (nspe in c(1:nrow(species_ann_df))) {
   spe_DEG_idfc <- data.table::fread(paste0("www/data/", species_ann_df$species_name[nspe], "_DEG_idfc.txt"), header = T, sep = "\t")
   spe_DEG_idfc$logFC <- round(spe_DEG_idfc$logFC ,2)
   assign(paste0(species_ann_df$species_name[nspe], "_DEG_idfc"), spe_DEG_idfc)
}

all_pathogen_class_DEG_uniqOG_string_edges <- data.table::fread("www/data/all_pathogen_class_DEG_uniqOG_string_edges.txt", header = T, sep = "\t") %>% as.data.frame()
all_pathogen_class_DEG_uniqOG_string_node <- data.table::fread("www/data/all_pathogen_class_DEG_uniqOG_string_node.txt", header = T, sep = "\t") %>% as.data.frame()

print("Read Gene Database Complete")
