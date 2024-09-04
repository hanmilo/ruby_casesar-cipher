# > caesar_cipher("What a string!", 5)
# => "Bmfy f xywnsl!"

# Initial attempt
# def caesar_cipher(message, crypt_value)
#   alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
#   array_alphabet = alphabet.split("")
#   index_a = array_alphabet.index("a")
#   index_z = array_alphabet.index("z")
#   index_A = array_alphabet.index("A")
#   index_Z = array_alphabet.index("Z")

#   array_message = message.split("")
#   array_encrypted = []
#   array_message.each_with_index { |letter, index_letter| 
#     if array_alphabet.index(letter) then # filter non-alphabets out
#       index_alphabet = array_alphabet.index(letter)
#       if letter == letter.downcase then # filter upcase out
#         if index_alphabet + crypt_value < index_a then
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i + (index_z + 1) + crypt_value]
#         elsif index_alphabet + crypt_value > index_z then
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i - (index_z + 1) + crypt_value]
#         else
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i + crypt_value]
#         end
#       elsif letter == letter.upcase then # filter downcase out
#         if index_alphabet + crypt_value < index_A then
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i + (index_z + 1) + crypt_value]      
#         elsif index_alphabet + crypt_value > index_Z then
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i - (index_z + 1) + crypt_value]
#         else
#           array_encrypted[index_letter] = array_alphabet[index_alphabet.to_i + crypt_value]
#         end
#       end
#     else # filter alphabets out
#       array_encrypted[index_letter] = letter
#     end
#   }
#   return array_encrypted.join("")
# end

# Attempt after learning from karateel@github and added descriptives
def caesar_cipher(message, crypt_value)
  message_encrypted = message.chars.map do |char|  # ".chars" is used to turn a string into an array of characters
    ascii_base = char.ord < 91 ? 65 : 97  # find and record ASCII value of each character "char"; /a-z is 97-122; /A-Z is 65-90
    if char.match(/[A-Za-z]/)
      ascii_shifted = ((char.ord - ascii_base + crypt_value) % 26) + ascii_base  # "ascii_shifted" is an ASCII value
      ascii_shifted.chr # turn ASCII into character
    else
      char
    end
  end
  message_encrypted.join
end

puts caesar_cipher("What a string!", 5)
# puts caesar_cipher("What A string!", 5)
# puts caesar_cipher("what a string!", 5)
# puts caesar_cipher("What A string!", -5)