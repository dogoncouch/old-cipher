#!/usr/bin/env ruby

require_relative 'caesar'
require 'optparse'

options = {}
OptionParser.new do |opt|
  opt.on('--caesar SPACES', 'Enable Caesar shift') { |o| options[:caesar] = o }
  opt.on('--input FILE', 'Set input file') { |o| options[:input] = o }
  opt.on('--output FILE', 'Set output file') { |o| options[:output] = o }
  opt.on('--verbose', 'Set verbose output') { options[:verbose] = true }
  opt.on('--help', 'Display usage') { puts opt ; exit }
end.parse!

plaintext = ARGV.join(" ")

if options[:caesar]
  shifter = CaesarShift.new(options[:caesar].to_i)
  ciphertext = shifter.shift(plaintext)
  
  if options[:verbose]
    shifter.print_hash
    print "\nplaintext:  #{plaintext.downcase}\n\n"
    print "ciphertext: "
  end

  if options[:verbose] or not options[:output]
    print "#{ciphertext}"
  end

  if options[:verbose]
    print "\n\n"
  end

end
