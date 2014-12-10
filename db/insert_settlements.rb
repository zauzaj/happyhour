require "csv"

module InsertSettlements
	CSV.foreach("#{Rails.root}/db/data/settlements.csv") do |row|
		Settlement.create(name: row[1])
	end
end