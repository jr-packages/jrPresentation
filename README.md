<!-- README.md is generated from README.Rmd. Please edit that file -->
Jumping Rivers Presentation Style
=================================

Style sheets for the [xaringan](https://github.com/yihui/xaringan) package

Installation
------------

``` r
devtools::install_github('yihui/xaringan') # not on CRAN
devtools::install_github('jumpingrivers/jrPresentation')
```

You **may** need to submit a PR to update the `get_author()` function.

Example
-------

You can create an example presentation in the directory `/tmp/example`

``` r
library("jrPresentation")
create_example(path = "/tmp/example")
```

Just go to that directory and knit `index.Rmd`
