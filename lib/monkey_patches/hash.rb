class Hash
  # Return a key based on a search value. Returns nil if nothing found
  def key(search_value)
    self.each do |key, value|
      if value == search_value
        return key
      end
    end
    return nil
  end
end
