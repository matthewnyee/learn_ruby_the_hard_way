class Lexicon

  TYPE = [['north', 'south', 'east', 'west'], ['go', 'kill', 'eat'],
    ['the', 'in', 'of'], ['bear', 'princess']]

  def self.integer?(input)
    begin
      Integer(input)
    rescue
      return false
    end
  end

  def self.scan(input_str)
    output = []
    input_str.split.each do |word|
      output << ['number', word.to_i] if Lexicon.integer?(word)
      output <<  ['direction', word] if TYPE[0].include?(word)
      output <<  ['verb', word] if TYPE[1].include?(word)
      output <<  ['stop', word] if TYPE[2].include?(word)
      output <<  ['noun', word] if TYPE[3].include?(word)
    end
    output
  end

  def self.scan(input_str)
    output = []
    input_str.split.each do |word|
      if Lexicon.integer?(word)
        output << ['number', word.to_i]
      elsif TYPE[0].include?(word)
        output << ['direction', word]
      elsif TYPE[1].include?(word)
        output << ['verb', word]
      elsif TYPE[2].include?(word)
        output << ['stop', word]
      elsif TYPE[3].include?(word)
        output << ['noun', word]
      else
        output << ['error', word]
      end
    end
    output
  end

end
