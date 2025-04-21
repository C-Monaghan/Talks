pivot_and_factorise <- function(data) {
  # Converts cognitive function data from wide to long format and factorizes key variables.
  # Pivots multiple cogfunction columns into wave/status pairs and converts categorical
  # variables (Gender, Education, status) to factors with meaningful labels.
  # Arguments:
  #   - data: Dataset containing cognitive function variables in wide format
  # Returns:
  #   - Long-format dataset with factorized variables, ordered by ID and wave
  # 
  
  # Pivoting depression variables
  # depression <- data |>
  #   select(starts_with("Total_dep")) |>
  #   tidyr::pivot_longer(
  #     cols = everything(), names_to = "Remove", values_to = "Depression") |>
  #   select(Depression)
  
  # Pivoting cardio variables
  # cardio <- data |>
  #   select(starts_with("Cardio_risk")) |>
  #   tidyr::pivot_longer(
  #     cols = everything(), names_to = "Remove", values_to = "Cardio") |>
  #   select(Cardio)
  
  
  data |>
    # select(!starts_with(c("Total_dep", "Cardio_risk"))) |>
    tidyr::pivot_longer(
      cols = starts_with("cogfunction"), names_to = "wave",
      names_prefix = "cogfunction", values_to = "status") |>
    mutate(
      Gender = factor(Gender, levels = c(0, 1)),
      Education_tri = factor(Education_tri, levels = c(0, 1, 2)),
      wave = factor(wave),
      status = factor(status, 
                      levels = c("Normal Cognition", "MCI", "Dementia"),
                      labels = c(1, 2, 3))) |>
    relocate(wave, .after = ID) |>
    relocate(status, .after = wave)
  #cbind(depression, cardio)
}