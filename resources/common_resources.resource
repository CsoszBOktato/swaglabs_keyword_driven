*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# URLs
${HOMEPAGE_URL}    https://www.saucedemo.com/
${INVENTORY_PAGE_URL}    https://www.saucedemo.com/inventory.html
${CART_PAGE_URL}    https://www.saucedemo.com/cart.html

# Locators
${USERNAME_INPUT}    //input[@id='user-name']
${PASSWORD_INPUT}    //input[@id='password']
${LOGIN_BUTTON}    //input[@id='login-button']
${HAMBURGER_MENU}    //button[@id='react-burger-menu-btn']
${LOGOUT}    //a[@id='logout_sidebar_link']

${FIRST_ITEM_ADD_TO_CART_BUTTON}    //*[@class='inventory_item'][1]//button[contains(text(), 'Add to cart')]    #explain XPath
${SHOPPING_CART_BADGE}    //span[@class='shopping_cart_badge']
${PAGE_REMOVE_BUTTONS}    //button[text()='Remove']

${FIRST_ITEM_NAME_LOCATION}    //*[@class="inventory_item"][1]//*[@class="inventory_item_name "]
${FIRST_ITEM_PRICE_LOCATION}    //*[@class="inventory_item"][1]//*[@class="inventory_item_price"]
${SHOPPING_CART}    //div[@id='shopping_cart_container']/a[1]
${FIRST_CART_ITEM_NAME_LOCATION}    //*[@class='inventory_item_name'][1]
${FIRST_CART_ITEM_PRICE_LOCATION}    //*[@class='inventory_item_price'][1]

${CONTINUE_SHOPPING_BUTTON}    //button[@id='continue-shopping']
${ITEMS_IN_CART}    //*[@class='cart_item']

# Error messages
${ERROR_MESSAGE_USERNAME}    Epic sadface: Username is required
${ERROR_MESSAGE_PASSWORD}    Epic sadface: Password is required
${ERROR_MESSAGE_WRONG_PASSWORD}    Epic sadface: Username and password do not match any user in this service
${ERROR_MESSAGE_LOGIN_REQUIRED}    Epic sadface: You can only access '/inventory.html' when you are logged in.

# Other Variables
${BROWSER}    Chrome
${USERNAME_STANDARD}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
Test Setup
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}
    Maximize Browser Window

Test Teardown
    Close All Browsers

Login Standard User
    Input Text    ${USERNAME_INPUT}    ${USERNAME_STANDARD}
    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}

Logout User
    Click Element    ${HAMBURGER_MENU}
    Wait Until Element Is Visible    ${LOGOUT}
    Click Element    ${LOGOUT}
    
    
    