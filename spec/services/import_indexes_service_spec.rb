require 'rails_helper'

RSpec.describe ImportIndexesService do
  subject(:service) { described_class.new(file) }

  let(:file) { File.join(Rails.root, 'spec', 'fixtures', 'indexes.csv') }

  describe '#import' do
    it 'imports the indexes' do
      expect { service.run }.to change { BigMacIndex.count }.by(2)
      expect(BigMacIndex.last.name).to eq('Australia')
    end
  end
end
