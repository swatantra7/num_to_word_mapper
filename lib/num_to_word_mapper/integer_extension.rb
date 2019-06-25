class Integer

  def to_words
    NumToWordMapper::NumberMapper.new(self).to_words
  end

end