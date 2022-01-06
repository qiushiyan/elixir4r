
<!-- README.md is generated from README.Rmd. Please edit that file -->

# elixir4r (WIP)

The package provides R interface to [elixir](https://elixir-lang.org/)

## Installation

You can install the development version of elixir4r via:

``` r
devtools::install_github("enixam/elixir4r")
```

## Example

First load the package

``` r
library(elixir4r)
```

### Interfaces

Evaluate inline elixir code

``` r
ex_eval("
defmodule Test do
  def main, do: IO.puts(:ok)
end 

Test.main()
")
```

    #> [1] "ok"

Run `.exs` script

``` r
code <- "IO.write(['hello ', 'R'])"
tmp <- tempfile()
cat(code, file = tmp)
ex_run(tmp)
```

    #> [1] "hello R"

### R Markdown

After `library`, elixir4r will register a custom knitr engine `elixir`.

Insert an `elixir` chunk

    ```{elixir}
    {{year, month, day}, {hour, _, _}} = :calendar.local_time()
    IO.puts("hello world from #{year}/#{month}/#{day} #{hour} o'clock") 
    ```

This yields

    #> hello world from 2022/1/5 18 o'clock

The last line of the code block gets automatically printed by
`IO.inspect`

``` elixir
m = %{name: "elixir", creator: "José Valim", status: :nice}
m
```

    #> %{creator: "José Valim", name: "elixir", status: :nice}
