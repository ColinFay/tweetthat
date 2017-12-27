#' Create a post
#'
#' @param status post title
#' @param media output directory (default to _posts)
#' @param token the output url
#' @param in_reply_to_status_id the date of the post
#'
#' @import shiny
#' @import rtweet
#' @import miniUI
#'
#' @export


tweet_widget <- function(inputValue1, inputValue2) {
  if (Sys.getenv("TWITTER_PAT") == "") {
    stop("You should set a twitter token. See ?rtweet::create_token")
  }
  ui <- miniPage(
    gadgetTitleBar("Create a new tweet"),
    miniContentPanel(
      textAreaInput(inputId = "status", label = "Status", value = "my first rtweet #rstats"),
      fileInput(inputId = "media", label = "Media"),
      h6("If you upload a file, this might take some time"),
      textAreaInput(inputId = "in_reply_to_status_id", label = "in reply to status",
                    value = NULL),
      actionButton("button", "Send")
    )
  )

  server <- function(input, output, session) {
    observeEvent(input$button, {
      inFile <- input$media
      if (is.null(inFile)) {
        media <- NULL
      } else {
        media <- normalizePath(inFile$datapath)
      }
      returnValue <- list(status = input$status,
                          media = media,
                          in_reply_to_status_id = input$in_reply_to_status_id)
      rtweet::post_tweet(status = returnValue$status,
                         media = returnValue$media,
                         in_reply_to_status_id = returnValue$in_reply_to_status_id)
    })
    observeEvent(input$done, { stopApp() } )
  }
  runGadget(ui, server, viewer = paneViewer())
}

