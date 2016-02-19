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
