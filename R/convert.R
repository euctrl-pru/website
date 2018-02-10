library(fs)
library(lubridate)
library(magrittr)
library(stringr)

# rename posts and fill date
files = dir_ls("content/post/", regexp = ".*-rn[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # YYYY-mm-dd-name.md -> name
      gsub('^\\d{4}-\\d{2}-\\d{2}-|[.]md', '', f)
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


# rename special posts and fill date
files = dir_ls("content/post/", regexp = ".*-world[.]md$")

for (f in files) {
  blogdown:::modify_yaml(
    f,
    slug = function(old, yaml) {
      # YYYY-mm-dd-name.md -> name
      gsub('^\\d{4}-\\d{2}-\\d{2}-|[.]md', '', f)
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
