# Historic Ciphers

## Options
    Usage: ./cipher.rb [options]
        --caesar SPACES              Use Caesar shift
        --vigenere WORD              Use Vigenere cipher
        --input FILE                 Inpupt from FILE (default: CLI args)
        --output FILE                Output to FILE
        --reverse                    Set decipher mode
        --verbose                    Set verbose output
        --help                       Display usage

## Examples
    ./cipher.rb --caesar 5 "The beagle has landed!"
    ./cipher.rb --vigenere grapefruit --input memo.txt --output memo-code.txt
    ./cipher.rb --vigenere grapefruit --input memo-code.txt --output memo-plain.txt --reverse

## More info
### Caesar shift
The Caesar shift is attributed to (you guessed it) the romans, and is achieved by replacing each letter of the alphabet with the letter a given number of spaces away. In a shift of 1, "a" would become "b", "b" would become "c", and so on.

The Caesar shift was eventually cracked using frequency analysis, which involces the relationships letters have to each other. For instance, "e" is the most common letter in most text, "h" often follows "t", and so on.

### Vigenere cipher
The Vigenere cipher was invented in the 16th century, and for a few centuries was thought to be indecipherable. It uses a cycle of multiple Caesar shift ciphers based on a keyword. If the keyword is "lemon", the first letter would be shifted 12 letters ("l" is 12 letters beyond "a"), the second 4 letters, and so on, with the keyword repeating over and over.

The Vigenere cipher was eventually cracked by figuring out the keyword length. and then cracking each Caesar cipher one by one.

## Bibliography
Most of the information in these descriptions is from "The Code Book", written by Simon Singh and published in the year 2000, which is a great read for anyone interested in cryptography, history, or quality writing.
