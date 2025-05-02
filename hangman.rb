class Hangman
  def initialize()
    @words = []
  end



  def read_file(file)
    File.open('words.txt', 'r') do |file|
      file.each_line do |line|
        if line.length < 5 && line.length < 13
          words << line
        end
      end
    end
  end

end

