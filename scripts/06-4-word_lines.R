iliad_4word <- iliad_pos |> 
  mutate(n_words = str_count(pos_line, " ") + 1) |> 
  filter(n_words == 4) |> 
  select(-n_words)

odyss_4word <- Odyss_pos |> 
  mutate(n_words = str_count(pos_line, " ") + 1) |> 
  filter(n_words == 4) |> 
  select(-n_words)

argo_4word <- Argo_pos |> 
  mutate(n_words = str_count(pos_line, " ") + 1) |> 
  filter(n_words == 4) |> 
  select(-n_words)