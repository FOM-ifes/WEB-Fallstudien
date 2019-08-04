
# Create icons for all casestuies
# This code creates icons for each case study found in the file "casestudies-overview.csv"




# Read all case studies (titles)

library(tidyverse)

casestudies <- read_csv(paste0(here::here(), "/static/casestudies-overview.csv"))

casestudies


# Add linebreaks after k characters

k <- 30


# test it:
casestudies$description[1] %>% str_wrap(width = k) %>% paste0(., "\n") %>% str()


wrap_casestudies <- function(title, description, k = 30) {
  
  casestudies_wrapped <-
    casestudy_df %>% 
    mutate(description_wrapped = map(casestudy_df$description, ~ (str_wrap(., width = k) %>% paste0(., "\n")))) %>% 
    unnest(description_wrapped)
  
  casestudies_wrapped <-
    casestudy_df %>% 
    mutate(title_wrapped = map(casestudy_df$title, ~ (str_wrap(., width = k) %>% paste0(., "\n")))) %>% 
    unnest(title_wrapped)
  
  return(casestudies_wrapped)
}

out <- wrap_casestudies(casestudies)





# Create images -------------------------------------------------

# Create ALL images
casestudies %>% 
  pmap( ~ create_imgfiles(title_casestudy = ..2,
                          title_short = ..1,
                          tags = ..4))


# Create images for one casestudy (full images and thumb image)


create_imgfiles(title_casestudy = "")
