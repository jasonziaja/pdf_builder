class PdfBuilder::Pdf
  attr_accessor :data

  def save(path)
    File.write(path, data)
  end
end
