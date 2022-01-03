
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

Insert an `elixir` chunk

    ```{elixir}
    {{year, month, day}, {hour, _, _}} = :calendar.local_time()
    IO.puts("hello world from #{year}/#{month}/#{day} #{hour} o'clock") 
    ```

``` elixir
IO.puts({1, 2, 3})
```

    #> ** (Protocol.UndefinedError) protocol String.Chars not implemented for {1, 2, 3} of type Tuple
    #>     (elixir 1.13.1) lib/string/chars.ex:3: String.Chars.impl_for!/1
    #>     (elixir 1.13.1) lib/string/chars.ex:22: String.Chars.to_string/1
    #>     (elixir 1.13.1) lib/io.ex:724: IO.puts/2

This yields

    #> hello world from 2022/1/2 21 o'clock

The last line of the code block gets automatically printed by
`IO.inspect`

``` elixir
m = %{name: "elixir", creator: "José Valim", status: :nice}
m
```

    #> %{creator: "José Valim", name: "elixir", status: :nice}
