defmodule Project do
  def md5(text) do
    :crypto.hash(:md5 , text) |> Base.encode16()
  end

  def md5onlist(text, path) do
    File.read!(path) |>String.split(",") |> Enum.filter( fn x -> if md5(x) == String.upcase(text) do x end end)
  end


  def iterations(string) do
    Alphabetify.seed_hash(string)
    Alphabetify.generate_hash()
  end

  def auxiliar(string, text) do
    if md5(string) == text do
      IO.puts(string)
    else
       step = iterations(string)
      auxiliar(step, text)
    end
  end

  def main(text, path) do
    res=md5onlist(text, path)
    if res == [] do

    else
      IO.puts(res)
    end

  end
end
