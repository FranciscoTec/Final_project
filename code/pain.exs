defmodule HASH do
  def md5(text) do
    :crypto.hash(:md5 , text) |> Base.encode16()
  end

  def md5onlist(text, path) do
    File.read!(path) |>String.split(",") |> Enum.filter( fn x -> if md5(x) == String.upcase(text) do x end end)
  end

  def main(text, path) do
    res=md5onlist(text, path)
    if res == [] do
      
    else
      IO.puts(res)
    end

  end

end
