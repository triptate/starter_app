module TokenGenerator

  def self.new
    n = rand 18446744073709551615
    n.to_s(36).rjust(13, '0')
  end

end
