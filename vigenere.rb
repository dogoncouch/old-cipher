#!/usr/bin/env ruby
#_MIT License
#_
#_Copyright (c) 2017 Dan Persons (dpersonsdev@gmail.com)
#_
#_Permission is hereby granted, free of charge, to any person obtaining a copy
#_of this software and associated documentation files (the "Software"), to deal
#_in the Software without restriction, including without limitation the rights
#_to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#_copies of the Software, and to permit persons to whom the Software is
#_furnished to do so, subject to the following conditions:
#_
#_The above copyright notice and this permission notice shall be included in all
#_copies or substantial portions of the Software.
#_
#_THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#_IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#_FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#_AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#_LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#_OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#_SOFTWARE.

class Vigenere

  def initialize(word)
  
    alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    alphahash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17, 's' => 18, 't' => 19,'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
    numhash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h', 8 => 'i', 9 => 'j', 10 => 'k', 11 => 'l', 12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p', 16 => 'q', 17 => 'r', 18 => 's', 19 => 't', 20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x', 24 => 'y', 25 => 'z' }

    @hashes = {}
    word.downcase!
    for n in (1..word.length).to_a do
      cipherhash = {}
      for letter in alphahash.keys do
        if alphahash[letter] + alphahash[word[n-1]] > 25
          cipherhash[letter] = numhash[alphahash[letter] + alphahash[word[n-1]] - 26].upcase
        else
          cipherhash[letter] = numhash[alphahash[letter] + alphahash[word[n-1]]].upcase
        end
      end
      
      @hashes[n] = cipherhash
      
    end
  end
  
  def cipher(plaintext)
    plainletters = plaintext.downcase.split("")
    cipherletters = []
    
    a = 0
    for letter in plainletters do
      if @hashes[1].keys.include? letter
        a = a + 1
        a = 1 if a > @hashes.length
        cipherletters << @hashes[a][letter]
      else
        cipherletters << letter
      end
    end
    
    ciphertext = cipherletters.join("")
    return ciphertext.upcase

  end

  def print_hash
    print "cipher:\n"
    for h in @hashes do
      hashlist = []
      for key in h[1] do
        hashlist << key[1]
      end
      print "#{hashlist.join("")}\n"
    end
  end

end
