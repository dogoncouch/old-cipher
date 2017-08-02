#!/usr/bin/env ruby

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
      #print "#{h[1].join("")}\n"
    end
  end

end
