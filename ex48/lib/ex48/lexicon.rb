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
    input_str.split.each do |str|
      if Lexicon.integer?(str)
        output << ['number', str.to_i]
      elsif TYPE[0].include?(str.downcase)
        output << ['direction', str.downcase]
      elsif TYPE[1].include?(str.downcase)
        output << ['verb', str.downcase]
      elsif TYPE[2].include?(str.downcase)
        output << ['stop', str.downcase]
      elsif TYPE[3].include?(str.downcase)
        output << ['noun', str.downcase]
      else
        output << ['error', str]
      end
    end

    output
  end

end
