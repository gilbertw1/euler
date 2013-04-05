class Integer

  def ones
    case self
      when 1 then 'One'
      when 2 then 'Two'
      when 3 then 'Three'
      when 4 then 'Four'
      when 5 then 'Five'
      when 6 then 'Six'
      when 7 then 'Seven'
      when 8 then 'Eight'
      when 9 then 'Nine'
      when 10 then 'ten'
      when 11 then 'Eleven'
      when 12 then 'Twelve'
      when 13 then 'Thirteen'
      when 14 then 'Fourteen'
      when 15 then 'Fifteen'
      when 16 then 'Sixteen'
      when 17 then 'Seventeen'
      when 18 then 'Eighteen'
      when 19 then 'Nineteen'
      else ''
    end
  end

  def tens
    case self
      when 2 then 'Twenty'
      when 3 then 'Thirty'
      when 4 then 'Forty'
      when 5 then 'Fifty'
      when 6 then 'Sixty'
      when 7 then 'Seventy'
      when 8 then 'Eighty'
      when 9 then 'Ninety'
      else ''
    end
  end

  def hundreds
    if ones != ''
      ones + 'Hundred'
    else
      ''
    end
  end
end

def convert(x)
  ones,tens,hundreds = *x.to_s.reverse.split(//),'0','0'
  hundreds = hundreds.to_i.hundreds
  hundreds += 'and' if hundreds != '' && (tens != '0' || ones != '0')
  if tens == '1'
    hundreds + (tens + ones).to_i.ones
  else
    hundreds + tens.to_i.tens + ones.to_i.ones
  end
end

total_chars = 0

(1..999).each do |x|
  total_chars += convert(x).length
end

puts total_chars + 'OneThousand'.length