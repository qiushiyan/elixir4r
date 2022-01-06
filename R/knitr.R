#' elixir engine for knitr
#'
#' @export
knitr_elixir_engine <- function() {
  function(options) {
    if (options$eval) {
      out <- run_elixir(options$code)
    } else {
      out <- NULL
    }
    knitr::engine_output(options, options$code, out)
  }
}

#' @export
register_elixir_knitr_engine <- function() {
  ensure_elixir()
  knitr::knit_engines$set(elixir = knitr_elixir_engine())
}
