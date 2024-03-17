*** Settings ***
Resource    ../resources/common_resources.resource

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Login With A Valid Username And Password
    Input Text    ${USERNAME_INPUT}    ${USERNAME_STANDARD}
    ${user_name}    Get Element Attribute    ${USERNAME_INPUT}    value
    Should Be Equal As Strings    ${user_name}    ${USERNAME_STANDARD}

    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}
    ${password_type}    Get Element Attribute    ${PASSWORD_INPUT}    type
    Should Be Equal As Strings    ${password_type}    password
    
    Click Element    ${LOGIN_BUTTON}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    ${INVENTORY_PAGE_URL}
    Logout User

Login Attempt Without Username And Password
    ${user_name}    Get Element Attribute    ${USERNAME_INPUT}    value
    ${password}    Get Element Attribute    ${PASSWORD_INPUT}    value

    Should Be Equal As Strings    ${user_name}    ${EMPTY}
    Should Be Equal As Strings    ${password}   ${EMPTY}

    Click Element    ${LOGIN_BUTTON}
    ${current_url}    Get Location
    Should Not Be Equal As Strings    ${current_url}    ${INVENTORY_PAGE_URL}
    Page Should Contain    ${ERROR_MESSAGE_USERNAME}
    Input Text    ${USERNAME_INPUT}    ${USERNAME_STANDARD}
    Click Element    ${LOGIN_BUTTON}
    Page Should Contain    ${ERROR_MESSAGE_PASSWORD}

Login Attempt With Wrong Password
    Input Text    ${USERNAME_INPUT}    ${USERNAME_STANDARD}
    ${user_name}    Get Element Attribute    ${USERNAME_INPUT}    value
    Should Be Equal As Strings    ${user_name}    ${USERNAME_STANDARD}

    Input Password    ${PASSWORD_INPUT}    secret_sauce1
    ${password}    Get Element Attribute    ${PASSWORD_INPUT}    value
    Should Be Equal As Strings    ${password}    secret_sauce1

    Click Element    ${LOGIN_BUTTON}
    Page Should Contain    ${ERROR_MESSAGE_WRONG_PASSWORD}

Logs The User Out
    Login Standard User
    Logout User
    Go Back
    Page Should Contain    ${ERROR_MESSAGE_LOGIN_REQUIRED}
    ${current_url}    Get Location
    Should Be Equal As Strings    ${current_url}    ${HOMEPAGE_URL}
