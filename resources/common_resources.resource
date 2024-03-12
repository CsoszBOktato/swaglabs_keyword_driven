*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# URLs
${HOMEPAGE}    https://www.saucedemo.com/

# Locators
${USERNAME_INPUT}    //input[@id='user-name']
${PASSWORD_INPUT}    //input[@id='password']
${LOGIN_BUTTON}    //input[@id='login-button']
${HAMBURGER_MENU}    //button[@id='react-burger-menu-btn']
${LOGOUT}    //a[@id='logout_sidebar_link']

# Other Variables
${BROWSER}    Chrome
${USERNAME_STANDARD}    standard_user
${PASSWORD}    secret_sauce

*** Keywords ***
Test Setup
    Open Browser    ${HOMEPAGE}    ${BROWSER}

Test Teardown
    Close All Browsers

Login Standard User
    Input Text    ${USERNAME_INPUT}    ${USERNAME_STANDARD}
    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}

Logout User
    Click Element    ${HAMBURGER_MENU}
    Click Element    ${LOGOUT}
    
    
    