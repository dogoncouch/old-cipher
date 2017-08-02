# Historic Ciphers

# Options
    Usage: ./cipher.rb [options]
        --caesar SPACES              Use Caesar shift
        --vigenere WORD              Use Vigenere cipher
        --input FILE                 Set input file
        --output FILE                Set output file
        --reverse                    Set decipher mode
        --verbose                    Set verbose output
        --help                       Display usage

# Examples
    ./cipher.rb --caesar 5 "The beagle has landed!"
    ./cipher.rb --vigenere grapefruit --input memo.txt --output memo-code.txt
    ./cipher.rb --vigenere grapefruit --input memo.txt --output memo-code.txt --reverse

