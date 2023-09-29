class Shot
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def change_mark_to_score
    return 10 if mark == 'X'

    mark.to_i
  end

  def make_shot_instances
    input_marks = ARGV[0]
    add_0_after_markX = input_marks.gsub(/X/, 'X,0')
    modified_scores = add_0_after_markX.gsub(/(?<=.{19})X0/, 'X')
    modified_scores.split(",").map do |mark|
      Shot.new(mark).change_mark_to_score
    end
  end
end
