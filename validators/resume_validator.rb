# frozen_string_literal: true

class ResumeValidator
  REQUIRED_FIELDS = %w[name specialization avatar_path].freeze
  CORRECT_RANGE = (0..10).freeze

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
