FactoryGirl.define do
	factory :active_advert, class: :advert do 
		title "Kokteli na snizenju"
		description "Svi kokteli posle 19h na snizenju od 10%-30%. Za najbrze posetioce 
								 sledi dodatni poklon. Subotom od 21h miss mokre majice !"
		address "Cara Dusana 12"
		location "Zemun"
		phone_number "11111111"
		status "active"
		user
		category 
	end  
	
	factory :inactive_advert, parent: :active_advert do
		status "inactive"
	end

end
