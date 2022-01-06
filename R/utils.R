#' Check if elixir exists
#'
#' @export
has_elixir <- function() {
  tryCatch({
    system("elixir -v", intern = TRUE)
    TRUE
  }, error = function(e) FALSE)
}

ensure_elixir <- function() {
  if (has_elixir()) return()
  stop("No elixir executable found, see installation instructions at https://elixir-lang.org/install.html and make sure it's in PATH")
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

#' @importFrom xfun with_ext
script_path <- function(name, ext = "exs") {
  name <- with_ext(name, ext)
  system.file(paste0("scripts/", name), package = "elixir4r")
}
