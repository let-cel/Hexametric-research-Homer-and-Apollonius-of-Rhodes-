library(XML)
library(dplyr)
library(purrr)
library(udpipe)
library(tidyr)
library(stringr)
library(ggplot2)

# url <- "https://raw.githubusercontent.com/PerseusDL/canonical-greekLit/master/data/tlg0012/tlg001/tlg0012.tlg001.perseus-grc2.xml"
# download.file(url, destfile = "Ilias.xml")
# doc <- xmlTreeParse("Ilias.xml", useInternalNodes = T)
# 
# rootnode <- xmlRoot(doc)
# ns="http://www.tei-c.org/ns/1.0"
# line_nodes <- getNodeSet(rootnode, "//tei:l", namespaces = c(tei = ns))
# #xmlValue(line_nodes[1])
# 
# vec <- map_chr(line_nodes, xmlValue) 
# 
# tbl <- tibble(line = vec) %>% 
#   mutate(id = row_number(), .before = "line")
# 
# # скачиваем модель
# udpipe_download_model(language = "ancient_greek-perseus")
# 
# # загружаем модель
# perseus_model <- udpipe_load_model("ancient_greek-perseus-ud-2.5-191206.udpipe")
# 
# # аннотируем
# ilias_ann <- udpipe_annotate(perseus_model, tbl$line, 
#                              doc_id = tbl$id)
# # преобразуем в тиббл
# ilias_tbl <- ilias_ann %>% 
#   as_tibble()

save(ilias_tbl, file = "Ilias.Rdata")

ilias_upos <- ilias_tbl %>% 
  select(doc_id, upos) %>% 
  filter(upos != "PUNCT")

ilias_lines <- ilias_upos %>% 
  group_by(doc_id) %>% 
  mutate(line = str_c(upos, collapse = " ")) %>% 
  distinct(doc_id, line)

ilias_upos %>% 
  group_by(as.numeric(doc_id)) %>% 
  summarise(n = n()) %>% 
  summarise(mean = mean(n))
  
ilias_lines %>% 
  group_by(line) %>% 
  summarise(total = n()) %>% 
  arrange(-total)
  
  
  
  
  