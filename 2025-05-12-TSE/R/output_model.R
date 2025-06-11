output_model <- function(model) {
  
  model |>
    select(transition, term, estimate, p.value, conf.low, conf.high) |>
    mutate(across(where(is.numeric), \(x) round(x, digits = 3))) |>
    knitr::kable(format = "html", align = "c") |>
    kableExtra::kable_paper(html_font = "Arial", font_size = 20)
}
