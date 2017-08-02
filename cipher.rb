#!/usr/bin/env ruby

# To Do: add input/output files

require_relative 'caesar'
require_relative 'vigenere'
require 'optparse'

def main
  options = {}
  OptionParser.new do |opt|
    opt.on('--caesar SPACES', 'Use Caesar shift') { |o| options[:caesar] = o }
    opt.on('--vigenere WORD', 'Use Vigenere cipher') { |o| options[:vigenere] = o }
    opt.on('--input FILE', 'Set input file') { |o| options[:input] = o }
    opt.on('--output FILE', 'Set output file') { |o| options[:output] = o }
    opt.on('--verbose', 'Set verbose output') { options[:verbose] = true }
    opt.on('--help', 'Display usage') { puts opt ; exit }
  end.parse!
  
  if options[:input]
    plaintext = File.read(options[:input])
  else
    plaintext = ARGV.join(" ") if not options[:input]
  end

  if options[:caesar]
    ciph = CaesarShift.new(options[:caesar].to_i)
    ciphertext = ciph.cipher(plaintext)
    
    if options[:verbose]
      ciph.print_hash
      print "\nplaintext:  #{plaintext.downcase}\n"
      print "ciphertext: "
    end

  elsif options[:vigenere]
    ciph = Vigenere.new(options[:vigenere])
    ciphertext = ciph.cipher(plaintext)
    
    if options[:verbose]
      ciph.print_hash
      print "\nplaintext:  #{plaintext.downcase}\n"
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
