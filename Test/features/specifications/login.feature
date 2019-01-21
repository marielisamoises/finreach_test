Feature: Login

Background: Visit login page
    Given I visit login page

Scenario Outline: Login with Sucess 
    Given I'm on login page
    When I try to login with user <username> and password <password>
    Then I can see the welcome page
    Examples:
        | username | password    |
        | "Luke"   | "Skywalker" |

Scenario Outline: Login with invalid credentials
    Given I'm on login page
    When I try to login with user <username> and password <password>
    Then I should see the error message <message>
    Examples:
        | username  | password       |message                          |
        | "Luke"    | "iGotThePower" | "Invalid username or password!" |

