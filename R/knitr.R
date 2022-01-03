#' Check if elixir exists
#'
#' @export
has_elixir <- function() {
  tryCatch({
    system("elixir -v", intern = TRUE)
    TRUE
  }, error = function(e) FALSE)
}

run_elixir <- function(code) {
  tmp_file <- tempfile(fileext = "ex")
  code <- append_print_to_last_line(code)
  code <- paste(code, collapse = "\n")

  cat(code, file = tmp_file, sep = "\n")

  out <- tryCatch({
    system2(
      "elixir",
      tmp_file,
      stdout = TRUE,
      stderr = TRUE
    )
  }, error = function(e) e$message)

  out
}

append_print_to_last_line <- function(code) {
  last_line <- code[length(code)]
  more_than_one_line <- length(last_line) != 0
  last_line_without_print <- !grepl("^IO.(inspect|puts)", last_line)

  if (more_than_one_line && last_line_without_print) {
    code[length(code)] <- paste0("IO.inspect(", last_line, ")")
  }
  code
}

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
  if (!has_elixir()) {
    warning("No elixir executable found, see installation instructions at https://elixir-lang.org/install.html and make sure it's in PATH")
  } else {
    knitr::knit_engines$set(elixir = knitr_elixir_engine())
  }
}
