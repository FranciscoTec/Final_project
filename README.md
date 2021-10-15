# *The Imitation Game*
---
#### Subject: *Lenguajes de programación*

##### Participants:
1. *Rodrigo Sibaja Villarreal* - *A01023121* 
2. *Francisco Acuña Franco* - *A01027294* 


---
## 1. Overview

*Using the knowledge gathered throughout the course, an elixir program that is capable of cracking md5 hashes via brute force will be developed, brute force referst to trying out each posible combiantion of chars until a corresponding string is found.*

## 2. Problem description

*A program that is able to find the corresponding hashes( a hash is a mathematical function that encrypts a string in order to protect it's information it transforms a text in a new string of chars which can later be decrypt into the original string) to a 4 character string will be designed, the characters used in the strings may contain upper case characters an lower case characters in any combination.*


## 3. Solution

The program will iterate through all posible combination of chars and use the hash function md5 to get corresponing hash of the combination to then compare it to the given hash of the original string 
Ei:
given string "Hola" corresponding hash "f688ae26e9cfa3ba6235477831d5122e"


the program wil begin iterating like this:

    AAAA-098890dde069e9abad63f19a0d9e1f32


    AAAB-7d578bb564c511ca301f558528bde644


    AAAC-a1492afabde918a47da2a2c5b1dba15c



until it finds a string which hash corresponds to the orignal string's hash.

## 4. Sources

*Rosettacode.org.(2021). MD5 [online] recuperado de "https://rosettacode.org/wiki/MD5"*
