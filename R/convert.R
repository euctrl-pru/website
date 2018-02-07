files = list.files(
  'content/', '[.](md|markdown)$', full.names = TRUE,
  recursive = TRUE
)



for (f in files) {
  blogdown:::process_file(f, function(x) {
    # process x here and return the modified x
    x
  })
}