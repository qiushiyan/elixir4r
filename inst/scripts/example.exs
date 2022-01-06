defmodule Test do
  def main(arg) when is_binary(arg) do
    IO.puts(arg)
  end

  def main(arg) when is_integer(arg) do
    Integer.to_string(arg) |> main
  end

  def main(_), do: :error
end

Test.main("hello world")
Test.main(19981112)
