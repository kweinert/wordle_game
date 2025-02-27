#' Search Bing for Words
#'
#' This functions searches bing for the provided words and returns the number of search
#' results for each word.
#'
#' @param fits	character, words to lookup
#' @return numeric, vector of numbers of search results
#' @references https://github.com/KewKalustian/wordle_cracker/blob/master/script.R
#' @export
popularity <- function(fits) {
	x <- sprintf("https://www.bing.com/search?q=%s", fits)
	x <- lapply(x, rvest::read_html)
	x <- lapply(x, rvest::html_nodes, css=".sb_count")
	x <- lapply(x, rvest::html_text)
	x <- lapply(x, function(s) strsplit(s, " ")[[1]][[1]])
	x <- gsub("\\.", "", x)
	x <- as.numeric(x)
	names(x) <- fits
	return(x)
}
