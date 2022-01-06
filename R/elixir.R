#' elixir interfaces
#'
#' @description
#' `ex_eval` for run string commands, `ex_eval` run


#' Evaluate string commands
#' @param code a single elixir expression
#' @export
ex_eval <- function(code) {
  ensure_elixir()

  run_elixir(code, append_print = FALSE)
}

#' Run elixir file
#' @param file file path
#' @param append_print boolean, if IO.inpsect last line
#' @importFrom xfun read_utf8
#' @export
ex_run <- function(file, append_print = FALSE) {
  ensure_elixir()

  code <- read_utf8(file)
  run_elixir(code, append_print = FALSE)
}

run_elixir <- function(code, append_print = TRUE) {
  tmp_file <- tempfile(fileext = "exs")
  if (append_print) code <- append_print_to_last_line(code)
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
