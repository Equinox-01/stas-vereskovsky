class ResumeValidator
  REQUIRED_FIELDS = ['name', 'specialization', 'avatar_path']
  CORRECT_RANGE = (0..10)

  def initialize(resume)
    @resume = resume
  end

  def valid?
    required_data_valid? && level_in_correct_range?
  end

  def required_data_valid?
    @resume.keys.include?(REQUIRED_FIELDS)
  end

  def level_in_correct_range?
    @resume.skills.all? { |skill| CORRECT_RANGE.member?(skill['level'].to_i) }
  end
end
