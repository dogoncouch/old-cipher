#!/usr/bin/env ruby

class Vigenere

  def initialize(word)
  
    alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    alphahash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17, 's' => 18, 't' => 19,'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
    numhash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h', 8 => 'i', 9 => 'j', 10 => 'k', 11 => 'l', 12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p', 16 => 'q', 17 => 'r', 18 => 's', 19 => 't', 20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x', 24 => 'y', 25 => 'z' }

    @hashes = {}
    word.downcase!
    for n in (1..word.length).to_a do
      for letter in alphahash.keys do
        cipherhash[letter] = numhash[alphahash[letter] + alphahash[word[n-1]]]
      end
      
      @hashes[n] = cipherhash
      
    end
  end
  
  def cipher(plaintext)
    plainletters = plaintext.downcase.split("")
    cipherletters = []
    
    a = 1
    for n in (1..plainletters.length).to_a do
      if @hashes[0].include? plainletters[n-1]
        a = a + 1
        a = a - @hashes.length if a > @hashes.length
        cipherletters << @hashes[a[plainletters[n-1]]]
      else
        cipherletters << plainletters
    end
    
    ciphertext = cipherletters.join("")
    return ciphertext.upcase

  end

  def print_hash
    print "cipher:\n"
    for h in @hashes do
      print "#{h.values.join("")}\n".upcase
    end
  end

end
