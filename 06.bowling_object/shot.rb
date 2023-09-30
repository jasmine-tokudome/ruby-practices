class Shot
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def change_1mark_to_1score
    return 10 if mark == 'X'

    mark.to_i
  end

  def convert_marks_to_scores
    input_marks = ARGV[0]
    add_0_after_markX = input_marks.gsub(/X/, 'X,0')
    modified_scores = add_0_after_markX.gsub(/(?<=.{18})X0/, 'X')
    modified_scores.split(",").map do |mark|
      Shot.new(mark).change_1mark_to_1score
    end
  end
end
