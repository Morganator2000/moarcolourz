#' moarcolourz: A High-Contrast Colour Palette Generator
#'
#' I got real sick and tired of having to make high-contrast colour palettes for data visualization, so this will do it for us.
#' Real easy, you pick the number of colours you want, moarcolourz generates a spectrum and then scrambles it so similar colours are not together.
#'
#' @param n Number of colours to generate.
#' @param spectrum Function defining the colour spectrum you want to use (default is `custom_spectrum`, which includes rainbow, browns, and greys).
#' @return A vector of `n` colours in hex format.
#' @export
moarcolourz <- function(n, spectrum = custom_spectrum) {
  if (!is.function(spectrum))
    stop("spectrum must be a function that generates colors")
  if (n < 1)
    stop("n must be at least 1")
  # Sample from equidistant points on the spectrum
  colours <- spectrum(n)
  # Scramble to avoid similar colours being adjacent by putting them into a grid
  num_cols <- ceiling(sqrt(n))
  num_rows <- ceiling(n / num_cols)
  #fill the matrix, starting with rows then going down columns
  colour_matrix <- matrix(NA, nrow = num_rows, ncol = num_cols)
  colour_matrix[1:length(colours)] <- colours

  # convert to vector and remove NAs
  scrambled_colours <- as.vector((t(colour_matrix)))
  scrambled_colours <- scrambled_colours[!is.na(scrambled_colours)]

  return(scrambled_colours)
}

custom_spectrum <- function(n) {
  # get 60% rainbow colours, 20% earthy colours, and 20% greys
  rainbow_colours <- grDevices::rainbow(n * 0.60)
  terrain_colours <- grDevices::terrain.colors(n * 0.20)
  grey_colours <- grDevices::gray.colors(n* 0.20)


  combined_colours <- c(rainbow_colours, terrain_colours, grey_colours)
  combined_colours <- combined_colours[seq_len(n)]
  return(combined_colours)
}

# Test function to print the generated spectrum
test_moarcolourz <- function(n = 60, spectrum = custom_spectrum) {
  colours <- moarcolourz(n)

  barplot(rep(1, n),
          col = colours,
          border = NA,
          space = 0,
          axes = FALSE,
          main = paste("moarcolourz(", n, ")"))
}

test_moarcolourz()

