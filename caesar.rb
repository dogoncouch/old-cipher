#!/usr/bin/env ruby

class CaesarShift

  def self.initialize(spaces)
    spaces = spaces - 26 while spaces > 25
  
    alphabet = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ]
    alphahash = { 'a' => 0, 'b' => 1, 'c' => 2, 'd' => 3, 'e' => 4, 'f' => 5, 'g' => 6, 'h' => 7, 'i' => 8, 'j' => 9, 'k' => 10, 'l' => 11, 'm' => 12, 'n' => 13, 'o' => 14, 'p' => 15, 'q' => 16, 'r' => 17, 's' => 18, 't' => 19,'u' => 20, 'v' => 21, 'w' => 22, 'x' => 23, 'y' => 24, 'z' => 25 }
    numhash = { 0 => 'a', 1 => 'b', 2 => 'c', 3 => 'd', 4 => 'e', 5 => 'f', 6 => 'g', 7 => 'h', 8 => 'i', 9 => 'j', 10 => 'k', 11 => 'l', 12 => 'm', 13 => 'n', 14 => 'o', 15 => 'p', 16 => 'q', 17 => 'r', 18 => 's', 19 => 't', 20 => 'u', 21 => 'v', 22 => 'w', 23 => 'x', 24 => 'y', 25 => 'z' }

    @cipherhash = {}
    for letter in alphahash.keys do
      if alphahash[letter] + spaces > 25
        @cipherhash[letter] = numhash[alphahash[letter] + spaces - 26]
      else
        @cipherhash[letter] = numhash[alphahash[letter] + spaces]
      end
    end  
  end
  
  def self.shift(plaintext)
    plainletters = plaintext.downcase.split("")
    cipherletters = []
    for letter in plainletters do
      if @cipherhash.keys.include? letter
        cipherletters << @cipherhash[letter]
      else
        cipherletters << letter
      end
    end
    ciphertext = cipherletters.join("")
    return ciphertext.upcase
  end

  def self.printhash
    print "cipherhash: "
    hash = []
    for x in @cipherhash.keys do
      hash << "#{x}: #{@cipherhash[x].upcase}"
    end
    print "#{hash.join(', ')}\n\n"
  end

end

shifter = CaesarShift
shifter.initialize(ARGV[0].to_i)
shifter.printhash
#plaintext = "Proof of concept"
plaintext = ARGV[1..ARGV.length].join(" ")
print "plaintext:  #{plaintext}\n\n"
ciphertext = shifter.shift(plaintext)
print "ciphertext: #{ciphertext}\n\n"

