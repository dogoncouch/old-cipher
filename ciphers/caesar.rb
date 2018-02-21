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

class CaesarShift

  def initialize(spaces)
    spaces = spaces - 26 while spaces > 25
  
    alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    alphahash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17, 's' => 18, 't' => 19,'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
    numhash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h', 8 => 'i', 9 => 'j', 10 => 'k', 11 => 'l', 12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p', 16 => 'q', 17 => 'r', 18 => 's', 19 => 't', 20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x', 24 => 'y', 25 => 'z' }

    @cipherhash = {}
    for letter in alphahash.keys do
      if alphahash[letter] + spaces > 25
        @cipherhash[letter] = numhash[alphahash[letter] + spaces - 26].upcase
      else
        @cipherhash[letter] = numhash[alphahash[letter] + spaces].upcase
      end
    end
    
    @decipherhash = {}
    for letter in @cipherhash do
      @decipherhash[letter[1]] = letter[0]
    end
  end
  
  def cipher(plaintext, reverse = false)
    reverse ? plainletters = plaintext.upcase.split("") : plainletters = plaintext.downcase.split("")
    cipherletters = []
    reverse ? hash = @decipherhash : hash = @cipherhash
    for letter in plainletters do
      if hash.keys.include? letter
        cipherletters << hash[letter]
      else
        cipherletters << letter
      end
    end
    ciphertext = cipherletters.join("")
    return ciphertext
  end

  def print_hash( reverse = false)
    print "cipher:\n"
    if reverse
      print "#{@decipherhash.keys.join("")}\n"
      print "#{@decipherhash.values.join("")}\n"
    else
      print "#{@cipherhash.keys.join("")}\n"
      print "#{@cipherhash.values.join("")}\n"
    end
  end

end
