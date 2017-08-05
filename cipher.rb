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

# To Do: add input/output files

require_relative 'ciphers/caesar'
require_relative 'ciphers/vigenere'
require 'optparse'

def main
  options = {}
  OptionParser.new do |opt|
    opt.on('--caesar SPACES', 'Use Caesar shift') { |o| options[:caesar] = o }
    opt.on('--vigenere WORD', 'Use Vigenere cipher') { |o| options[:vigenere] = o }
    opt.on('--input FILE', 'Set input file') { |o| options[:input] = o }
    opt.on('--output FILE', 'Set output file') { |o| options[:output] = o }
    opt.on('--reverse', 'Set decipher mode') { options[:reverse] = true }
    opt.on('--verbose', 'Set verbose output') { options[:verbose] = true }
    opt.on('--help', 'Display usage') { puts opt ; exit }
  end.parse!
  
  if options[:input]
    plaintext = File.read(options[:input])
  else
    plaintext = ARGV.join(" ")
  end

  if options[:caesar]
    ciph = CaesarShift.new(options[:caesar].to_i)
    options[:reverse] ? ciphertext = ciph.cipher(plaintext, reverse = true) : ciphertext = ciph.cipher(plaintext)
    
    if options[:verbose]
      ciph.print_hash(reverse = options[:reverse])
      options[:reverse] ? plaintext.upcase! : plaintext.downcase!
      print "\nplaintext:  #{plaintext}\n"
      print "ciphertext: "
    end

  elsif options[:vigenere]
    ciph = Vigenere.new(options[:vigenere])
    ciphertext = ciph.cipher(plaintext, reverse = options[:reverse])
    
    if options[:verbose]
      ciph.print_hash(reverse = options[:reverse])
      options[:reverse] ? plaintext.upcase! : plaintext.downcase!
      print "\nplaintext:  #{plaintext}\n"
      print "ciphertext: "
    end

  end

  if options[:output]
    File.open(options[:output], 'w') { |f| f.write(ciphertext) }
  end

  print "#{ciphertext}" if options[:verbose] or not options[:output]

  if options[:verbose]
    print "\n\n"
  end

end

main
