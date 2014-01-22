# Methods & Scope Lightning Talk by @rickarubio
# Overview:
# - Scope
# => Global Scope
# => Local Scope
# - Methods
# => Instance
# => Class
# => Public
# => Private


# ===== Scope =====
# Checkout this link for learning about Ruby scope:
# http://rubylearning.com/satishtalim/scope.html

# Scope is the term used to describe visibility.
# There is global scope and local scope.
# Global scope means visibility throughout your entire program.

# Demonstration of Global Scope:
class ConfidentialInformation
  $bobs_social_security_number = '321-55-7887'
  def initialize
  end
end

# Normally, I should not be able to see information such as bobs ssn.
# But since it was declared as a global variable inside of class ConfidentialInformation
# I can easily find it:

# lists out all global variables available to me
p global_variables

# Oh look, I see $bobs_social_security_number
puts "bobs ssn: #{$bobs_social_security_number}"

# Notice that I did not even have to create an instance of the class
# ConfidentialInformation to access the global variable. A global variable is
# available to the entire program, throughout the entire program.
# You should avoid global variables at all costs because they can easily be
# modified and break or circumvent your code.
$bobs_social_security_number = 'stolen_or_tampered_ssn'
puts "bobs ssn: #{$bobs_social_security_number}"

# The next type of scope to know about is local scope.
# think of local scope as scope that is visible within its containing space.
# For example, in the code below

can_be_seen_in_the_top_container = "Greetings!"

class XYZ
  # Notice that can_be_seen_in_the_top_container can't be seen inside
  # this class, which we can think of as another containing space
  def initialize
    # will print out nil
    p defined? can_be_seen_in_the_top_container
    super_cool_method
  end
  def super_cool_method
    # will print out nil
    p defined? can_be_seen_in_the_top_container
  end
end

XYZ.new

# This line can see the variable can_be_seen_in_the_top_container
puts can_be_seen_in_the_top_container

# Every block (method for example) has its own scope, even if nested:
nested_arr = [ ['a', 1], ['b', 2], ['c', 3] ]
nested_arr.each { |value| p value; value.each { |value| p value } } 
# Notice in the above that I was able to use the variable name value twice,
# yet value did not refer to the same thing in the outer each as in the inner each.
# This is because each block has its own scope.

puts "==========================================="
# ===== Methods =====
class PonziCoins
  @@price_per_coin_in_usd = 1.0
  def initialize
    double_price
  end

  # Both #display_motto and #self.display_current_price are public methods

  # This is an instance method, it can be called by any instance
  # of the class PonziCoins
  def display_motto
    puts "A LA LUNA!!!"
  end

  # This is a class method. It may only be called on the class PonziCoins
  def self.display_current_price
    "Price per PonziCoin in USD: $#{@@price_per_coin_in_usd}"
  end

  # All methods below the private keyword within this class are private methods
  private
  # A private instance method that may only be used within the scope of this
  # class
  def double_price
    @@price_per_coin_in_usd *= 2
  end
end

worlds_first_ponzi_coin = PonziCoins.new
p PonziCoins.display_current_price
worlds_second_ponzi_coin = PonziCoins.new
p PonziCoins.display_current_price