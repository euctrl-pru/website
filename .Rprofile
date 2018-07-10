# Project specific .Rprofile file
# here we
# 1. set options for the project, and
# 2. re-run the personal R profile, ~/.Rprofile, to eventually (re)apply personal options,
#    for example blogdown.author = 'Your Name'

options(
  blogdown.ext = ".Rmd",
  blogdown.publishDir = "../pru-portal-generated"
)

# in .Rprofile of the website project
if (file.exists("~/.Rprofile")) {
  # re-apply personal options that eventually override the project ones
  base::sys.source("~/.Rprofile", envir = environment())
}

