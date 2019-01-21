# encoding: utf-8

class Login < SitePrism::Page
    set_url '/login'
    element :username, 'input[ng-model="user.name"]'
    element :password, 'input[ng-model="user.password"]'
    element :loginBtn, '.main-button'


    def loginIn(user, pass)
        username.set user
        password.set pass
        loginBtn.click
    end

    def logOut 
    end
end
