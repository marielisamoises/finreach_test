Dir[File.join(File.dirname(__FILE__),
    '../pages/*_page.rb')].each { |file| require file }

#Module to call the instanced classes
module Pages
    def login
      Login.new
    end
  end