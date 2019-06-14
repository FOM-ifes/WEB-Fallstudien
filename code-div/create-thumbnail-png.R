

# Create png-image programmatically -----------------------------







create_thumb_imgfile <- function(title_casestudy, 
                                 title_short, 
                                 tags,
                                 save_to_disk = TRUE,
                                 background_color = "#00998a"){

  
  # Output: Thumbnail-Image (png) for case study gallery, output size is approx 8cm by 8cm
  # Input: Name of case study and short name that serves as file name(obligatory), and tags (optional)
  
  
  library(tidyverse)
  library(here)
  
  
  # collate vector of tags to one string:
  tags_pasted <- str_c(tags, collapse = ", ")
  
  fom_green <- background_color
  
  # write image to this folder:
  img_folder <- paste0(here::here(),"/static/images/thumbs")
  
  
  
  
  gg_thumb <- ggplot(tibble(x = -3:3, y = -3:3)) +
    aes(x = x, y = y) +
    geom_rect(xmin = -3, xmax = 3,
              ymin = -3, ymax = 3,
              fill = fom_green) +
    scale_x_continuous(limits = c(-3,3)) +
    scale_y_continuous(limits = c(-3,3)) +
    annotate("text", x = 0, y = 0, label = title_casestudy,
             color = "white", size = 6) +
    annotate("text", x = 0, y = -2, label = tags_pasted,
             color = "grey80", size = 5) +
    theme_void()
  
  # show image:
  gg_thumb
  
  # save to disk if desired:
  if (save_to_disk == TRUE) ggsave(gg_thumb, 
                                  filename = paste0(img_folder, "/", title_short, ".png"),
                                  height = 3.13 , width = 3.14, dpi = 72)   
  
}


title_casestudy <- "Quantitative Berufsfelder\nder Wirtschaftspsychologie"

title_short <- "Quant-Berufe-WiPsy"

tags <- c("Psychologie", "HR")



create_thumb_imgfile(title_casestudy = title_casestudy,
                     title_short = title_short,
                     tags = tags)