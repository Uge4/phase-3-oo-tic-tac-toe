require 'pry'

class TicTacToe
    
    WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2] ]

    attr_reader :board

    def initialize
        @board = [" "] * 9
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, token ="X")
        board[index] = token
    end

    def position_taken?(index)
        board[index] != " " ? true : false 
    end

    def valid_move?(index)
        if position_taken?(index) 
            false
        elsif
            index >= 0 && index <= 9
            true
        else
            false
        end
    end

    def turn_count
        board.filter {|x| x == "X" || x == "O" }.count
    end

    def current_player
        turn_count.odd? ? "O" : "X" 
    end



    def turn
        
        position = gets.chomp
        index = input_to_index(position)
        isValid = valid_move?(index)
        player = current_player

        while !isValid
            position = gets.chomp
            index = input_to_index(position)
            isValid = valid_move?(index)
        end

        move(index, player)
        display_board

        # isValid = true

        # while isValid

        #     position = gets.chomp
        #     index = input_to_index(position)
        #     isValid = valid_move?(index)
            
        #     binding.pry
            
        #     if isValid
        #         move(index, current_player)
        #         display_board
        #         puts isValid
        #         break
                
        #     else
        #         puts "invalid"
        #         puts isValid
        #     end
        # end
    end

    def won?        
        WIN_COMBINATIONS.each do |combo|
            if combo.all? {|x| board[x] == "X"} || combo.all? {|x| board[x] == "O"}
                return combo
            end
        end
        return false
    end

    def full?
        board.all? {|x| x == "X" || x == "O"}
    end

    def draw?
        if full? && !won?
            true
        else
            false
        end
    end

    def over?
        if full? && draw? || full? && won? 
            true
        else
            false
        end
    end

    def winner
        return nil unless won?
        won? && current_player == "X" ? "O" : "X" 
    end

    def play
        until over? || won?    
            turn    
            draw? ? break : nil
        end
        puts "Congratulations #{winner}!" if won?
        puts "Cat's Game!" if draw?
    end

end
