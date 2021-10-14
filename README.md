# *The imitation game*
---
#### Subject: *Lenguajes de programación*

##### Participants:
1. *Rodrigo Sibaja Villarreal* - *A01023121* 
2. *Francisco Acuña Franco* - *A01027294* 


---
## 1. Overview

*Using the knowledge gathered throught the course we will be able to write an elixir program that is capable of cracking md5 hashes via brute force when we say brute force we mean trygin each posible combiantion of strings until we fin the corresponding string*

## 2. Problem description

*A program that is able to find the corresponding hashes( a hash is a mathematical function that encrypts a string in order to protect it's information it transforms a text in a new string of chars which can later be decrypt into the original string) to a 4 character string will be design, The characters used in the strings may contain upper case characters an lower case characters in a random manner*


## 3. Solution

The program will iterate all posible combination of chars and uses the hash function md5 to get corresponing hash of the combination and then compare it to the given hash of the original string 
Ei:
given string "Hola" corresponding hash "f688ae26e9cfa3ba6235477831d5122e"


the program wil begin iterating like this:

    AAAA-098890dde069e9abad63f19a0d9e1f32


    AAAB-7d578bb564c511ca301f558528bde644


    AAAC-a1492afabde918a47da2a2c5b1dba15c



until it finds a string which hash corresponds to the orignal hash

## 4. Sources

*Rosettacode.org.(2021). MD5 [online] recuperado de "https://rosettacode.org/wiki/MD5"*
