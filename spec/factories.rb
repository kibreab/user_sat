Factory.define :user do |f|
	f.name "KBSHA"
	f.age 32
	f.idnumber 23323
	f.sequence(:id) { |n| "#{15}" }
end