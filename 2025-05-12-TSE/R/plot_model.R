plot_model <- function(model) {
  
  # Design matrix for faceting
  design <- "
  AABBCC 
  DDEEFF
  ##GG##
"
  # Plotting results
  model |>
    ggplot(aes(x = estimate, y = transition, colour = colour)) +
    geom_vline(xintercept = 1, linetype = "dashed", color = "gray50") +
    ggstance::geom_pointrangeh(
      aes(xmin = conf.low, xmax = conf.high),
      position = ggstance::position_dodgev(height = 0.5),
      linewidth = 2,
      fatten = 6) +
    scale_colour_manual(values = c(
      "Positive" = "#0072B2", 
      "Negative" = "#E69F00", 
      "NS"       = "#B2BEB5")) +
    labs(title = "Odds ratios (stationary model)",
         x = "Odds Ratio", y = "Predictor") +
    guides(colour = "none") +
    ggh4x::facet_manual(~ term, scales = "free_x", design = design) +
    theme_bw() +
    theme(
      plot.title = element_text(hjust = 0.5, size = rel(1.25), face = "bold"),
      axis.title = element_text(size = rel(1.1), face = "bold"),
      strip.text = element_text(size = rel(1), face = "bold"),
      panel.grid.major.y = element_blank(),
      panel.grid.minor.y = element_blank())
}