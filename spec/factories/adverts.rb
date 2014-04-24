FactoryGirl.define do
	factory :active_advert, class: :advert do 
		title "Kokteli na snizenju"
		description "Svi kokteli posle 19h na snizenju od 10%-30%. Za najbrze posetioce 
								 sledi dodatni poklon. Subotom od 21h miss mokre majice !"
		address "Cara Dusana 12"
		location "Zemun"
		phone_number "11111111"
		status "active"
		commentable true
		user
		category 
		ignore do 
			comments_count 5
		end
		after(:create) do |active_advert, evaluator|
			create_list(:comment, evaluator.comments_count, advert: active_advert)
		end
	end  
	
	factory :inactive_advert, parent: :active_advert do
		status "inactive"
	end
	factory :uncommentable_advert, parent: :active_advert do
		commentable false
	end

end
