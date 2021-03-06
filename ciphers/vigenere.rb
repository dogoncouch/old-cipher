#!/usr/bin/env ruby
# MIT License
# 
# Copyright (c) 2017 Dan Persons (dpersonsdev@gmail.com)
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

class Vigenere

  def initialize(word)
  
    alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    alphahash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17, 's' => 18, 't' => 19,'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
    numhash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h', 8 => 'i', 9 => 'j', 10 => 'k', 11 => 'l', 12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p', 16 => 'q', 17 => 'r', 18 => 's', 19 => 't', 20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x', 24 => 'y', 25 => 'z' }

    @cipherhashes = {}
    @decipherhashes = {}
    word.downcase!
    for n in (1..word.length).to_a do
      cipherhash = {}
      decipherhash = {}
      for letter in alphahash.keys do
        if alphahash[letter] + alphahash[word[n-1]] > 25
          value = numhash[alphahash[letter] + alphahash[word[n-1]] - 26]
          cipherhash[letter[0]] = value.upcase
          decipherhash[value] = letter
        else
          value = numhash[alphahash[letter] + alphahash[word[n-1]]]
          cipherhash[letter[0]] = value.upcase
          decipherhash[value] = letter
        end
      end
      @cipherhashes[n] = cipherhash
      @decipherhashes[n] = decipherhash
    end
  end
  
  def cipher(plaintext, reverse = false)
    plainletters = plaintext.downcase.split("")
    cipherletters = []
    
    a = 0
    reverse ? hashes = @decipherhashes : hashes = @cipherhashes

    for letter in plainletters do
      if hashes[1].keys.include? letter
        a = a + 1
        a = 1 if a > hashes.length
        cipherletters << hashes[a][letter]
      else
        cipherletters << letter
      end
    end
    
    ciphertext = cipherletters.join("")
    return ciphertext
  end

  def print_hash(reverse = false)
    reverse ? hashes = @decipherhashes : hashes = @cipherhashes
    reverse ? print("decipher:\n") : print("cipher:\n")
    for h in hashes do
      hashlist = []
      for item in h[1] do
        reverse ? hashlist << item[0] : hashlist << item[1]
      end
      print "#{hashlist.join("")}\n"
    end
  end

end
