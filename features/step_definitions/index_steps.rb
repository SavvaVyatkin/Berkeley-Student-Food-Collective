Given /there exist (.*) tags of type (.*)/ do |num, type|
	i = 0
	num.to_i.times do
		FactoryBot.create("original_#{type}", name: "Original #{type.capitalize} Name " + i.to_words)
		i += 1
	end
end

Given /there are (.*) (.*)/ do |num, type|
	i = 0
	num.to_i.times do
		FactoryBot.create(type[0..type.length - 2].to_sym, :name => i.to_words)
		i += 1
	end
end

And /I click the "(.*)" element/ do |element_text|
	element = find("button", :text => element_text)
	click()
end

Then /I should see (.*) (.*) on the (.*)-facing page/ do |num, type, page|
	#expect(find('td', :class => type, count: 3)).not_to be nil
	expect(page).to have_selector("td", :class => type, count: num.to_i)
end



