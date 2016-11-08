def trigger(selector, name, options={})
  # if you return the default object capybara tries to parse the jquery object
  # page.find('.collection-item', :text => menu_option)
  page.evaluate_script("$('#{selector}').trigger(jQuery.Event('#{name}', #{options.to_json})); undefined")
end

When(/^Given I am on the homepage$/) do
  visit root_path
end


Given(/^the following Materials exist:$/) do |table|
   table.hashes.each do |material|
     Material.create(material)
   end
end

Given(/^the following Processes exist:$/) do |table|
   table.hashes.each do |process|
     Procedure.create(process)
   end
end

Then(/^I choose "([^"]*)" from Library$/) do |menu_option|
   within("td[id=library]") do
      find('.collapsible-header', :text => menu_option).click
   end
end

When(/^I choose "([^"]*)" from "([^"]*)" submenu in Library$/) do |category, sub_menu|
   # sub_menu = Materials or Transport or Manufacturing
   # Category = Ceramic or Metal. Can also be Steel or such in processes.
   within("ul[id=#{sub_menu.downcase}-menu]") do
      find('.collapsible-header', :text => category).click
   end

end


# Drag and Drop Deprecated with double click
# Then(/^I drag "([^"]*)" to "([^"]*)"$/) do |menu_option, drop_area|
#    drop = true
#    # drag_element = page.find('.collection-item', :text => menu_option)
#    drag_element = page.find('.collection-item', :text => menu_option).id
#    drag_xy = page.find('.collection-item', :text => menu_option).click
#    # <li class="collection-item draggable ui-draggable ui-draggable-handle" data-type="material" data-id="4" data-name="Concrete">Concrete</li>
#    drop_xy = page.find('ul', :id => drop_area).click
#
#    puts "FIND STUFF HERE"
#    puts drag_xy['position']['y']
#    puts drop_xy
#    puts drag_element
#
#    trigger drag_element, :mousedown, {pageX: drag_xy['position']['x'], pageY: drag_xy['position']['y']}
#    trigger drag_element, :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}
#    trigger drag_element, :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y'] + 30}
#    trigger drag_element, :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}
#
#    #Drop element
#    trigger drag_element, :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}
#    trigger drag_element, :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}
#    trigger drag_element, :mouseup
# end

# drag = page.find('.collection-item', :text => menu_option).double_click

When(/^I move "([^"]*)" from "([^"]*)" to my Assembly$/) do |option, type|
   target_id = "draggable-" + type.downcase + "-" + option
   # find_by_id("draggable-#{menu_option}").drag_to(page.find('ul', :id => drop_area))
   find_by_id(target_id.to_s).double_click
end


Then(/^I should see "([^"]*)" instances of "([^"]*)"$/) do |amount, text|
  expect(page).to have_text(text, count: amount.to_i)
end

Then(/^print html$/) do
  puts page.body
end
