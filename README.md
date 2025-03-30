
# moarcolourz

<!-- badges: start -->
<!-- badges: end -->

So there I was, trying to use ggplot to make a bunch of pie charts. Unfortunately,
I needed about 60 unique colours that could be distingushable from each other.
Would you have guessed that the easier solution would be to make a whole new
package? Moarcolourz generates a spectrum for you and instead of scrambling randomly,
it makes sure that similar shades do not end up in sequence with each other. 
This way you can generate large amounts of high-contrast colours.

## Installation

Easy installation of moarcolorz:

``` r
# Install from GitHub
library(devtools)
devtools::install_github("Morganator2000/moarcolourz")
```

## Example

Simple usage of moarcolourz

``` r
library(moarcolourz)
# Create colours
colours <- moarcolourz(60)

# View colours
barplot(rep(1, 60),
          col = colours,
          border = NA,
          space = 0,
          axes = FALSE,
          main = paste0("moarcolourz(", 60, ")"))
```

