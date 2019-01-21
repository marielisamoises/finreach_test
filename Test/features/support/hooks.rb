require_relative 'helper.rb'

World(Helper)

# Choose where save the screenshot in case of error 
After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  scenario_name = scenario_name.delete(',', '')
  scenario_name = scenario_name.delete('(', '')
  scenario_name = scenario_name.delete(')', '')
  scenario_name = scenario_name.delete('#', '')

  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'failed')
  else
    take_screenshot(scenario_name.downcase!, 'passed')
  end
end