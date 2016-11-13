class Position
  def initialize(hash = {})
    @chess_pieces = hash
  end

  def to_proc
    proc { |item| [item, @chess_pieces[item] || :empty] }
  end

  def occupied(chess = nil)
    if chess
      proc { |item| item if @chess_pieces[item].to_s.include?(chess.to_s) }
    else
      proc { |item| item if @chess_pieces.key?(item) }
    end
  end
end
