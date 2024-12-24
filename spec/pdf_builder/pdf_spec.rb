require "tempfile"

RSpec.describe PdfBuilder::Pdf do
  subject { described_class.new }

  describe "#new" do
    it "has the expected defaults" do
      expect(subject).not_to be_nil
    end
  end

  describe "#save" do
    let(:tempfile) { Tempfile.new }

    around(:example) do |ex|
      tempfile
      ex.run
      tempfile.close
      tempfile.unlink
    end

    it "saves the pdf to a file" do
      subject.save(tempfile.path)

      data = File.read(tempfile.path)
      expect(data).to eq("")
    end
  end
end
