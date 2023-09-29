class Frame
  attr_reader :first_shot, :second_shot, :third_shot
  attr_accessor :frame_number

  @index_counter = 0

  def initialize(first_shot, second_shot, third_shot = nil)
    @first_shot = Shot.new(first_shot)
    @second_shot = Shot.new(second_shot)
    @third_shot = Shot.new(third_shot)
    @frame_number = self.class.next_index
  end

  def calculate_1frame_score
    [first_shot.mark,second_shot.mark,third_shot.mark].compact.sum
  end

  def self.next_index
    @index_counter += 1
  end
end
