GDCtranslateID = function(file_ids, legacy = FALSE) {
  info = files(legacy = legacy) %>%
    filter( ~ file_id %in% file_ids) %>%
    select('cases.submitter_id') %>%
    results_all()
  id_list = lapply(info$cases,function(a) {
    a[[1]][[1]][[1]]})
  # And build the data.frame
  return(data.frame(file_id = ids(info), submitter_id = unlist(id_list)))
}
