require 'csv'

class ImportIndexesService
  def initialize(file)
    @file = file
  end

  def run
    CSV.foreach(@file, headers: true) do |row|
      binding.pry
      # BigMacIndex.create!(row.to_hash)
    end
  end
end
