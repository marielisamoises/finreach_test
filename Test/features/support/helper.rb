require 'fileutils'

#Module of screenshots for the report#
module Helper
  def take_screenshot(file_name, result)
    timer_path = Time.now.strftime('%Y_%m_%d').to_s
    file_path = "results/screenshots/test_#{result}/run_#{timer_path}"
    screenshot = "#{file_path}/#{file_name}.png"
    page.save_screenshot(screenshot)
    embed(screenshot, 'image/png', 'Click here')
  end
end