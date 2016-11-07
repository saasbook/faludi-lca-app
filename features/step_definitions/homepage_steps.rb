def trigger(selector, name, options={})
  # if you return the default object capybara tries to parse the jquery object
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

Then(/^I choose "([^"]*)" from "([^"]*)"$/) do |menu_option, menu|
   within("td[id=#{menu}]") do
      find('.collapsible-header', :text => menu_option).click
   end

end

Then(/^I drag "([^"]*)" to "([^"]*)"$/) do |menu_option, drop_area|
   drop = false
   drag_xy = page.find('.collection-item', :text => menu_option).click
   # <li class="collection-item draggable ui-draggable ui-draggable-handle" data-type="material" data-id="4" data-name="Concrete">Concrete</li>
   drop_xy = page.find('ul', :id => drop_area).click
   puts "FIND STUFF HERE"

   puts drag_xy['position']['y']
   puts drop_xy

   trigger 'drag_element', :mousedown, {pageX: drag_xy['position']['x'], pageY: drag_xy['position']['y']}
   trigger 'drag_element', :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}
   trigger 'drag_element', :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y'] + 30}
   trigger 'drag_element', :mousemove, {pageX: drop_xy['position']['x'], pageY: drop_xy['position']['y']}

   if drop
      # use it for move element to children
      trigger 'drag_element', :mousemove, {pageX: drop_xy['x'] + 50, pageY: drop_xy['y']}
      trigger 'drag_element', :mousemove, {pageX: drop_xy['x'] + 150, pageY: drop_xy['y']}
   end
   trigger 'drag_element', :mouseup
end

Then(/^print html$/) do
  puts page.body
end
