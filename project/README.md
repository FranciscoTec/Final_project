

## Instructions

To run this project the user must clone repository to a location in their computer and then move to that directory and with the command ```iex -S mx``` compile the project

```
..//final_project/project> iex -S mix
```

after compilation the user must use the command ```Project.main(<<md5Hash>>, <<absolute_path>>)``` to run the project.
Where md5hash is a md5 hash of a string of up to 4 chars and absolute_path is a path to a csv file containing posible string corresponding to that hash   

```
iex> Project.main(<<md5Hash>>, <<absolute_path>>)
```


