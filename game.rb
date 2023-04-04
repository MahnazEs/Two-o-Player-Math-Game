class Game

  attr_reader     :which_round, :active_player
  attr_accessor   :qs

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
    @qs = 20
  end

  # starts the game 
  def run_game

    puts "Welcome to the game!"

    print "Player 1, please enter your name? "
    player1 = Player.new(gets.chomp)
    @players << player1

    print "Player 2, please enter your name? "
    player2 = Player.new(gets.chomp)
    @players << player2

    puts "Welcome, #{player1.name} and #{player2.name}!\n\n"

    @active_player = @players[rand(0..1)]

    while (@active_player.score > 0)
        run_round
    end

    end_game
  end

  def increment_round!
    @which_round += 1
  end

  # Checks the active player 
  def switch_player!
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  #game, reporting the winner
  def end_game
    puts "\n\n________ GAME OVER ________"
    puts "#{@active_player.name}, you've run out of lives.\nYou DEAD.\n\n"
    switch_player!
    puts "#{@active_player.name}, you had #{@active_player.score} #{(@active_player.score) == 1 ? "life" : "lives"} YOU WIN!\n\n"
  end

  # Runs through a standard round for the active player
  def run_round
        increment_round!
        switch_player!
        question = Question.new(@qs)
        puts "________ Question #{@which_round} ________"
        puts "#{@active_player.name}, you have #{@active_player.score} #{(@active_player.score) == 1 ? "life" : "lives"} remaining.\n"
        print "#{@active_player.name}, #{question.display_question} "
        answer = gets.chomp.to_i

        if question.correct?(answer)
          puts "Well done, #{@active_player.name}!  #{answer} you are correct.\n"
          @qs = (@qs*rand(1.0..2.5)).to_i
        else
          puts "#{answer}?!  Seriously? No! #{question.correct_answer}. \n\n"
          @active_player.loose_points
        end
    end
end