require 'csv'

class ImportIndexesService
  attr_accessor :file, :imported

  def initialize(file)
    @file = file
    @imported = 0
  end

  def run
    CSV.foreach(@file, headers: true) do |row|
      attributes = row.to_hash
      index = BigMacIndex.find_or_create_by(attributes)
      
      if index.previously_new_record?
        @imported += 1
      else
        puts "#{row['date']} - #{row['iso_a3']} - #{index.errors.full_messages.join(',')}"
      end
    end
    puts "Imported #{imported} indexes."
  end
end
