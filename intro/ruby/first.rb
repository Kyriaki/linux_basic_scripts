#!/usr/bin/env ruby
class MegaMaid
	attr_accessor :names

	#Object creation
	def initialize(names = "Kyri-sama")
		@names = names
	end

	#Greet everyone
	def greet
		if @names.nil?
			puts "... is there someone here?"
		elsif @names.respond_to?("each")
			# @names is a list, let's loop on it
			@names.each do |name|
				if name == "Kyri-sama"
					puts "Oh, it's you, #{name}! I'm so happy you're back <3"
				else
					puts "Good morning, #{name}. Do you want some tea?\n"
				end
			end
		else
			puts "Hello #{@names}!"
		end
	end

	#Say farewell to everyone
	def farewell
		if @names.nil?
			puts "... I am always alone..."
		elsif @names.respond_to?("join")
			puts "Oh you're all leaving? Aww... Well come back soon, #{@names.join(", ")}. I'll take good care of the place"
		else
			if @names == "Kyri-sama"
				puts "Please don't leave, #{@names}... Please be safe. I'll be waiting for you, precious #{@names}. <3"
			else
				puts "You're leaving already? I'll take good care of the place. See you soon, #{@names}."
			end
		end
	end

end

#main
if __FILE__ == $0
#__FILE__ => current filename
#$0 => name of the file use to start the program
	remram = MegaMaid.new
	remram.greet
	remram.farewell

	remram.names = "Subaru"
	remram.greet
	remram.farewell

	remram.names = ["Crusch", "Patricia", "Rom", "Felt"]
	remram.greet
	remram.farewell

	remram.names = nil
	remram.greet
	remram.farewell
end