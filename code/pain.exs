defmodule HASH do
  def md5(text) do
    :crypto.hash(:md5 , text) |> Base.encode16()
  end

  text = text 
    |> File.stream! \
    |> Enum.map(&String.trim/1) \
    |> Enum.map(&String.reverse/1) \
    |> Enum.join("\n")
    File.write!("text4.txt", text)

end
