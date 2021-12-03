'''
deciphering md5 hashes
Rodrigo Sibaja Villarreal A01023121
Francisco Acuña Franco A01027294
19-11-21
'''


  '''
  module definition this contains the all of methods used in the project
  including the main method that uses all of them
  '''
defmodule Project do

  @doc """
  this functions uses the crypto library to create an md5 hash with a given string
  """
  def md5(text) do
    :crypto.hash(:md5 , text) |> Base.encode16()
  end


  @doc """
  with this function we take a given md5 hash and an asolute path to a csv file we then use a map to genrate all of the hashes in
  that list and verify is none of those correspond to the given hash in orer to make the brute force somewhat avoidable
  """
  def md5onlist(text, path) do
    File.read!(path) |>String.split(",") |> Enum.filter( fn x -> if md5(x) == String.upcase(text) do x end end)
  end

  @doc """
  the iterations function uses patter matching to recive from 1 to 4 chars in a list to iterate over them going from the far right to the far left
  and return the next string in the sequence for example a -> b, aaaa -> aaab aaa\d -> aaba
  """

  def iterations(["","","",a]) do
    #we use  ! to reset the values of chars in the list because it's the first value in the numerical order in utf8 encoding
    #as well a \d to make sure the next letter needs to be changed because it's the last letter in the numerical order of ut8 encoding
    if a == "\d" do
      list = ["", "", "!", "!"]
      list
    else
      #using this code fragment <<letter::utf8>> = a we can get the numerical value correspoding to the letter in that position and
      #adding 1 to the value we get the value of the following letter to then get the corresponding letter to that number with this List.to_string([letter+1]) code
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

  def iterations([d,c,b,a]) do
    if a == "\d" && b== "\d" && c == "\d" && d == "\d"do
      nil
    else
      if a == "\d" && b == "\d" && c == "\d"do
        <<letter::utf8>> = d
        list = [List.to_string([letter+1]),"!","!","!"]
        list
      else
        if a == "\d" && b == "\d" do
          <<letter::utf8>> = c
          list = [d,List.to_string([letter+1]),"!","!"]
          list
        else
          if a == "\d"  do
            <<letter::utf8>> = b
            list = [d,c,List.to_string([letter+1]),"!"]
          list
          else
            <<letter::utf8>> = a
            list = [d,c,b,List.to_string([letter+1])]
          list
          end
        end
      end
    end
  end

  @doc """
  the auxiliar methods allows us to both use m5donlist to search for the string we need in the file given and also use the itrations function
  to create all the hashes need to find the solution if it's posible to find using this program
  """

  def auxiliar(string, text) do
    if md5(List.to_string(string)) == String.upcase(text) do
      IO.puts(List.to_string(string))
    else
      #here we verify that the result is different from nil, as the only case where we would get nil is if the program is unable to decioher the input
       if (step = iterations(string)) == nil do
       IO.puts "Error in input"
       else
        auxiliar(step, text)
       end
    end
  end

  @doc """
  with the main program we use all of methods previously mentioned to make the operations of this program posible
  """
  def main(text, path) do
    res=md5onlist(text, path)
    # after looking of the string in the list if the result is empty we now try the brute force solution
    if res == [] do
      #the first time we call this function we use ["","","","!"] as the initial list as it is the very first posible hash in a 4 char combination
      auxiliar(["","","","!"],text)
    else
      IO.puts(res)
    end
  end
end

#:timer.tc(fn -> Project.main("0886f6cc13e9058351becc0f8d5d30fe","C:/Users/malte/Desktop/pl/final_project/project/lib/4letter.txt")  end) |> elem(0) |> Kernel./(1_000_000)
