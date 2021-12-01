defmodule Project do
  def md5(text) do
    :crypto.hash(:md5 , text) |> Base.encode16()
  end

  def md5onlist(text, path) do
    File.read!(path) |>String.split(",") |> Enum.filter( fn x -> if md5(x) == String.upcase(text) do x end end)
  end

  def iterations(["","","",a]) do
    if a == "\d" do
      list = ["", "", "!", "!"]
      list
    else
      <<letter::utf8>> = a
      list = ["","","",List.to_string([letter+1])]
      list
    end
  end

  def iterations(["","",b,a]) do
    if a == "\d" && b== "\d" do
       list = ["", "!", "!", "!"]
       list
    else
      if a == "\d" do
        <<letter::utf8>> = b
        list = ["","",List.to_string([letter+1]),"!"]
        list
      else
        <<letter::utf8>> = a
        list = ["","",b,List.to_string([letter+1])]
        list
      end
    end
  end

  def iterations(["",c,b,a]) do
    if a == "\d" && b== "\d" && c == "\d" do
       list = ["!", "!", "!", "!"]
       list
    else
      if a == "\d" && b == "\d" do
        <<letter::utf8>> = c
        list = ["",List.to_string([letter+1]),"!","!"]
        list
      else
        if a == "\d" do
          <<letter::utf8>> = b
          list = ["",c,List.to_string([letter+1]),"!"]
          list
        else
          <<letter::utf8>> = a
          list = ["",c,b,List.to_string([letter+1])]
          list
        end
      end
    end
  end

  def auxiliar(string, text) do
    if md5(List.to_string(string)) == String.upcase(text) do
      IO.puts(List.to_string(string))
    else
       if (step = iterations(string)) == nil do
       IO.puts "Error in input"
       else
        auxiliar(step, text)
       end
    end
  end

  def main(text, path) do
    res=md5onlist(text, path)
    if res == [] do
      auxiliar(["","","","!"],text)
    else
      IO.puts(res)
    end
  end
end
