<!-- README.md is generated from README.Rmd. Please edit that file -->
tweetthat
=========

A simple wrapper to tweet straight from your R session. Opens your browser with a text ready to tweet. You need to add a text, url and via are optional.

Install
-------

``` r
devtools::install_github("ColinFay/tweetthat")
```

Example
-------

![](gifs/tweet_that.gif)

``` r
library(tweetthat)
tweet_that(text = "I wrote this tweet in RStudio, how cool is that?")
```

``` r
tweet_that(text = "This website is awesome", url = "http://colinfay.me")
```

``` r
tweet_that(text = "Colin's Twitter is full of advices", via = "@_colinfay")
```

``` r
tweet_that(text = "Colin's website is cool", url = "http://colinfay.me", via = "@_colinfay")
```
