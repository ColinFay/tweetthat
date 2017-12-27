#' Tweet that
#'
#' Send a tweet from your R session
#'
#' @param text the text of the tweet (mandatory)
#' @param url optional url
#' @param via optional via, with or without the `@`
#'
#' @importFrom glue glue
#' @importFrom utils browseURL URLencode
#' @importFrom assertthat assert_that
#'
#' @return open your browser with a tweet ready to be sent
#' @export
#'
#' @examples
#' tweet_that(text = "Colin's website is #cool", url = "http://colinfay.me", via = "@_colinfay")

tweet_that <- function(text, url = NULL, via = NULL){
  assertthat::assert_that(inherits(text, "character"), msg = "text should be a character string")
  text <- URLencode(text)
  text <- gsub("#", "%23", text)
  #return(text)
  if(is.null(url) & is.null(via)){
    message <- glue::glue("https://twitter.com/intent/tweet?text={text}")
  } else if (is.null(url) & !is.null(via)){
    via <- gsub("@", "", via)
    message <- glue::glue("https://twitter.com/intent/tweet?text={text}&via={via}")
  } else if (!is.null(url) & is.null(via)){
    message <- glue::glue("https://twitter.com/intent/tweet?text={text}&url={url}")
  } else {
    via <- gsub("@", "", via)
    message <- glue::glue("https://twitter.com/intent/tweet?text={text}&url={url}&via={via}")
  }
  utils::browseURL(url = message)
}
