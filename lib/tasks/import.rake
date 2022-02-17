namespace :import do
  task run: :environment do
    data = URI.open('https://raw.githubusercontent.com/TheEconomist/big-mac-data/master/output-data/big-mac-full-index.csv')

    ImportIndexesService.new(data).run
  end
end
