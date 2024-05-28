library(tidyverse)
load("./data/iliad_dior_tokens.Rdata")

iliad_verb_counts <- iliad_dior |> 
  mutate(count = case_when(pos == "verb" ~ 1, 
                           pos != "verb" ~ 0)) |> 
  mutate(cumsum = cumsum(count)) 
 
  
iliad_verb_means <- iliad_verb_counts |> 
  group_by(cumsum) |> 
  summarise(n = n() - 1) |>  # -1 to remove the verb itself
  pull(n)

iliad_verb_mean <- mean(iliad_verb_means)
