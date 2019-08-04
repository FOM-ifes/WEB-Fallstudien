

# Fun: Create png-image programmatically -----------------------------

create_imgfiles <- function(title_casestudy, 
                            title_short, 
                            tags,
                            save_to_disk = TRUE,
                            background_color = "#00998a"){

  
  # Output: Thumbnail-Image (png) for case study gallery, output size is approx 8cm by 8cm
  # Input: Name of case study and short name that serves as file name(obligatory), and tags (optional)
  
  
  library(tidyverse)
  library(here)
  library(magick)
  
  
  # collate vector of tags to one string:
  tags_pasted <- str_c(tags, collapse = ", ")
  
  fom_green <- background_color
  
  # write image to this folder:
  img_full_folder <- paste0(here::here(),"/static/images/full")
  img_thumbs_folder <- paste0(here::here(),"/static/images/thumbs")
  
  
  
  
  gg_thumb <- ggplot(tibble(x = -3:3, y = -3:3)) +
    aes(x = x, y = y) +
    geom_rect(xmin = -3, xmax = 3,
              ymin = -3, ymax = 3,
              fill = fom_green) +
    scale_x_continuous(limits = c(-3,3)) +
    scale_y_continuous(limits = c(-3,3)) +
    annotate("text", x = 0, y = 0, label = title_casestudy,
             color = "white", size = 10) +
    annotate("text", x = 0, y = -2, label = tags_pasted,
             color = "grey80", size = 8) +
    theme_void()
  
  # show image:
  gg_thumb
  
  # save to disk if desired:
  if (save_to_disk == TRUE) {
    ggsave(gg_thumb, filename = paste0(img_full_folder, "/", title_short, ".png"),
           height = 17.6, width = 17.6, units = "cm", dpi = 72)   
    
    full_image <- image_read(paste0(img_full_folder, "/", title_short, ".png"))
    
    thumb <- image_scale(full_image, "250")
    
    image_write(thumb, path = paste0(img_thumbs_folder, "/", title_short, ".png"))
  }
}




# Test fun ------------------------------------------------------




title_casestudy <- "Quantitative Berufsfelder\nder Wirtschaftspsychologie"

title_short <- "Quant-Berufe-WiPsy"

tags <- c("Psychologie", "HR")

fom_standard_green <- "#00998a"



create_imgfiles(title_casestudy = title_casestudy,
                title_short = title_short,
                tags = tags,
                background_color = fom_standard_green)




# Read casestudies ----------------------------






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
