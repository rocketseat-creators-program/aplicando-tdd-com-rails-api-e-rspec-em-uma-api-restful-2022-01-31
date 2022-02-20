# == Schema Information
#
# Table name: big_mac_indices
#
#  id            :integer          not null, primary key
#  date          :date
#  iso_a3        :string(3)
#  currency_code :string(3)
#  name          :string
#  local_price   :decimal(, )
#  dollar_ex     :decimal(, )
#  dollar_price  :decimal(, )
#  USD_raw       :decimal(, )
#  EUR_raw       :decimal(, )
#  GBP_raw       :decimal(, )
#  JPY_raw       :decimal(, )
#  CNY_raw       :decimal(, )
#  GDP_dollar    :decimal(, )
#  adj_price     :decimal(, )
#  USD_adjusted  :decimal(, )
#  EUR_adjusted  :decimal(, )
#  GBP_adjusted  :decimal(, )
#  JPY_adjusted  :decimal(, )
#  CNY_adjusted  :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :big_mac_index do
    date { '2022-01-01' }
    iso_a3 { 'BRA' }
    currency_code { 'BRL' }
    name { 'Brazil' }
    local_price { '22.9' }
    dollar_ex { '5.31' }
    dollar_price { '4.31261770244821' }

    trait :argentina do
      iso_a3 { 'ARG' }
      currency_code { 'ARS' }
      name { 'Argentina' }
      local_price { '450.0' }
      dollar_ex { '105.0165' }
      dollar_price { '4.28504092214081' }
    end
  end
end
