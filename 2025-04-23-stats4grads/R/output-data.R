output_data <- function(data, lag = FALSE) {
  
  if(lag == FALSE) {
  data |>
  head(n = 8) |>
    dplyr::select(ID, wave, status, Total_p) |>
    knitr::kable(
      format = "html", align = "c",
      col.names = c(
        "ID", "Wave", 
        "Status", "Procrastination")) |>
    kableExtra::kable_paper(
      html_font = "Arial", 
      font_size = 20)
  } else{
    data |>
    head(n = 8) |>
      dplyr::select(ID, wave, status, status_prev, Total_p) |>
      knitr::kable(
        format = "html", align = "c",
        col.names = c(
          "ID", "Wave", 
          "Status (t)", "Status (t-1)", 
          "Procrastination")) |>
      kableExtra::kable_paper(
        html_font = "Arial", 
        font_size = 20)
  }
}