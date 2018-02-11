library(fs)
library(lubridate)
library(magrittr)
library(stringr)

# rename Release Notes posts and fill date
files = dir_ls("content/post/", regexp = ".*-rn[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # YYYY-mm-dd-name.md -> name
      f %>% path_file() %>% path_ext_remove() %>% str_replace_all("_", "-")
    },
    date = ymd(f) %>% as.character(),
    categories = function(old, yaml) {
      # remove the Uncategorized category
      setdiff(old, 'Uncategorized')
    },
    .keep_fields = c('title', 'author', 'date', 'categories', 'tags', 'slug'),
    .keep_empty = FALSE
  )
  
#  file_move(f, path_ext_set(f, "md"))
  # blogdown:::process_file(f, function(x) {
  #   # process x here and return the modified x
  #   x
  # })
}


# rename special posts and fill date
files = dir_ls("content/post/", regexp = ".*-world[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # YYYY-mm-dd-name.md -> YYYY-mm-dd-name
      f %>% path_file() %>% path_ext_remove() %>% str_replace_all("_", "-")
    },
    date = ymd(f) %>% as.character(),
    categories = function(old, yaml) {
      # remove the Uncategorized category
      setdiff(old, 'Uncategorized')
    },
    .keep_fields = c('title', 'author', 'date', 'categories', 'tags', 'slug'),
    .keep_empty = FALSE
  )
  
  file_move(f, path_ext_set(f, "Rmd"))
  # blogdown:::process_file(f, function(x) {
  #   # process x here and return the modified x
  #   x
  # })
}



# rename references/acronym and fix yaml
files = dir_ls("content/reference/acronym/", regexp = "[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # filename.md -> filename
      f %>% path_file() %>% path_ext_remove()
    },
    categories = function(old, yaml) {
      c('metadata', 'acronym')
    },
    type = function(old, yaml) {
      'acronym'
    },
    .keep_fields = c('title', 'categories', 'tags', 'type', 'slug'),
    .keep_empty = FALSE
  )
  
  file_move(f, path_ext_set(f, "md"))
  # blogdown:::process_file(f, function(x) {
  #   # process x here and return the modified x
  #   x
  # })
}


# references/definition: fix yaml
files = dir_ls("content/reference/definition/", regexp = "[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # filename.md -> filename
      f %>% path_file() %>% path_ext_remove() %>% str_replace_all("_", "-")
    },
    categories = function(old, yaml) {
      c('metadata', 'definition')
    },
    type = function(old, yaml) {
      'definition'
    },
    .keep_fields = c('title', 'categories', 'tags', 'type', 'slug'),
    .keep_empty = FALSE
  )
  f %>% 
    path_ext_set("Rmd") %>% 
    {fs::path(fs::path_dir(.), fs::path_file(.)%>% str_replace_all("_", "-"))} %>% 
    file_move(f, .)
  # blogdown:::process_file(f, function(x) {
  #   # process x here and return the modified x
  #   x
  # })
}
