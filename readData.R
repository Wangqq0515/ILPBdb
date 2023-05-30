#Database modified Day                                                  
modifiedDay <- "2023-01-5"

#Send Email                                                              
adminEmail <- "wangqq0515@163.com"
adminEmailPassword <- "otaudkznvbgthihf"
smtp <- emayili::server(host = "smtp.qq.com",
               port = 587,
               username = adminEmail,
               password = adminEmailPassword)

load("www/data/species_ann_df.R")
#overview
summary_speciesVShsot <- openxlsx::read.xlsx("www/data/summary_speciesVShsot_number.xlsx", colNames = T)
spe_host_count <- dplyr::inner_join(summary_speciesVShsot, species_ann_df, by=c("species" = "fullname")) %>% dplyr::select(species_name2, total,Species_Class )

#样本汇总
BioProject <- 150
BioSample <- 3332
laboratory <- 219

#查询各个物种的处理
summary_speciesVShsot_Type <- openxlsx::read.xlsx("www/data/summary_speciesVShsot_type.xlsx", colNames = T)


#读入每个物种的host和treat
all_spe_host_treat <- data.table::fread("www/data/all_spe_host_treat.txt", header = T, sep = "\t")

###############读入orthogroup个数和详细基因
colname <- c("Orthogroup", "A.th", "B.di", "B.na", "G.hi", "G.max", "H.vu", "M.tr", "N.ta", "O.sa", "S.bi", "S.ly", "S.tu", "T.ae", "Z.ma", "Type")
orthogroup_counts <- data.table::fread("www/data/orthogroup/cluster_counts_by_taxon.txt", header = T, sep = "\t") %>% dplyr::select(-sum) %>% dplyr::filter(type=="core")
colnames(orthogroup_counts) <- colname

orthogroup <- data.table::fread("www/data/orthogroup/Orthogroups.txt", header = T, sep = "\t")

Orthogroups_pfam <- data.table::fread("www/data/orthogroup/Orthogroups_pfam.txt", header = T, sep = "\t")



#读入每个物种的物种和转录因子家族
TFselectlist <- data.table::fread("www/data/TFselectlist.txt", header = T, sep = "\t")

#读入每个物种的物种和共表达CPPs
NetworkList <- data.table::fread("www/data/NetworkList.txt", header = T, sep = "\t")

print("Read Gene Database Complete")
