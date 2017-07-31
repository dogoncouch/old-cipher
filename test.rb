#!/usr/bin/env ruby

require_relative 'caesar'


shifter = CaesarShift.new(ARGV[0].to_i)
shifter.print_hash

plaintext = ARGV[1..ARGV.length].join(" ")
print "\nplaintext:  #{plaintext.downcase}\n\n"

ciphertext = shifter.shift(plaintext)
print "ciphertext: #{ciphertext}\n\n"

