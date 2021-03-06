#touch lab2.rb
#gedit lab2.rd
#nav to directory
#ruby lab2.rb

# Part1: Hello World
class HelloWorldClass
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
        puts "Hello #{@name}!"
    end
end
hello = HelloWorldClass.new("Heather Dykstra")
hello.sayHi

# Part 2 Strings
def palindrome?(string)
    string.downcase == string.downcase.reverse
end

p palindrome?("mom")


def count_words(string)
    result = Hash.new(0)
	string.downcase.scan(/\w+/).map{|word| result[word] = string.downcase.scan(/\b#{word}\b/).size}
	return result
end

p count_words("this is a test")

# Part 3: Rock Paper Sissors
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def lose?(mine, his)
    mine.upcase!; his.upcase!
    strategies = ['R', 'P', 'S']
    if(!strategies.include?(mine) or !strategies.include?(his))
        raise NoSuchStrategyError
    end
    ["RP", "PS", "SR"].include?(mine + his)
end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    if(lose?(game[0][1], game[1][1]))
        game[1]
    else
        game[0]
    end
end

#Part 4: Anagrams
def combine_anagrams(words)
     words.group_by{|w| w.downcase.chars.sort.to_s}.values
end
