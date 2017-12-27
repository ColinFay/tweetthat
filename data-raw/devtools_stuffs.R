# Devtools

library(devtools)
setup()
use_data_raw()
system("git init")

# init stuffs
use_code_of_conduct()
use_cran_badge()
use_mit_license()
use_news_md()
use_readme_rmd()
use_testthat()
use_travis()

# Tests

use_test("init")

# package dependencies
use_package("glue")
use_package("utils")
use_package("assertthat")
use_package("rtweet")
