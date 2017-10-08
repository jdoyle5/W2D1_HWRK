class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 1.00
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the pattern (b,r,g,...): "
    pattern = gets.chomp.split(",")
    @seq.each_with_index do |color, i|
      if color[0] != pattern[i]
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "Successful Round!"
  end

  def game_over_message
    puts "You fail. You memorized #{sequence_length} color patterns.."
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end

simon = Simon.new
simon.play
