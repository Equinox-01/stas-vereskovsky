class ResumeService
  def initialize(data_path = 'config/data.json')
    parse_file(data_path)
    create_methods
  end

  private

  def create_methods
    @data.keys.each do |key|
      define_singleton_method(key) { @data[key] }
    end
  end

  def parse_file(data_path)
    file_data = IO.read(data_path)
    @data = JSON.parse(file_data)
  end
end
