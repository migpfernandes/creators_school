class Game

	def initialize
		@playScore = []
	end

	def roll(hit)
		@playScore << hit
	end

	def score
		valorTotal = 0
		primeirajogada = 1

		@playScore.each_with_index do | pins,i |
			if pins == 10 
				if primeirajogada == 1
					valorTotal += pins + @playScore[i+1] + @playScore[i+2]	
				else
					valorTotal += pins + @playScore[i+1]
					primeirajogada = 1
				end
			elsif primeirajogada == 0 && (@playScore[i-1]+pins) == 10
				valorTotal += pins + @playScore[i+1]
				primeirajogada = 1
			elsif primeirajogada == 0
				valorTotal += pins
				primeirajogada = 1
			else
				valorTotal += pins
				primeirajogada = 0
			end
		end
		valorTotal
	end
end

teste = Game.new
teste.roll 1
teste.roll 4
#p teste.score

teste.roll 4
teste.roll 5
#p teste.score

teste.roll 6
teste.roll 4
#p teste.score

teste.roll 5
teste.roll 5
#p teste.score

teste.roll 10
#p teste.score

teste.roll 0
teste.roll 1
p teste.score

teste.roll 7
teste.roll 3
#p teste.score

teste.roll 6
teste.roll 4
#p teste.score

teste.roll 10
#p teste.score

teste.roll 2
teste.roll 8
teste.roll 6
p teste.score



#p teste.score