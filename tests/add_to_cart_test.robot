*** Settings ***
Resource    ../resources/common_resources.resource

Test Setup    Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Add Product To Cart
    Login Standard User

    # Add first item to cart
    Click Element    ${FIRST_ITEM_ADD_TO_CART_BUTTON}

    # Validate badge number
    ${badge_text}    Get Text    ${SHOPPING_CART_BADGE}
    ${badge_number}    Convert To Integer    ${badge_text}
    Should Be Equal As Integers    ${badge_number}    1

    # Validate "Remove" buttons appears 1 times on the page
    ${remove_buttons}    Get WebElements    ${PAGE_REMOVE_BUTTONS}
    ${remove_buttons_lenght}    Get Length    ${remove_buttons}
    Should Be Equal As Integers    ${remove_buttons_lenght}    1
    
    # Store Item name
    ${first_item_name}    Get Text    ${FIRST_ITEM_NAME_LOCATION}
    # Store Item price
    ${first_item_price}    Get Text    ${FIRST_ITEM_PRICE_LOCATION}
    
    # Navigate to cart page
    Click Element    ${SHOPPING_CART}
    ${current_location}    Get Location
    Should Be Equal As Strings    ${current_location}    ${CART_PAGE_URL}
    
    # Check cart item name
    ${first_cart_item_name}    Get Text    ${FIRST_CART_ITEM_NAME_LOCATION}
    Should Be Equal As Strings    ${first_item_name}    ${first_cart_item_name}
    
    # Check cart item price
    ${first_cart_item_price}    Get Text    ${FIRST_CART_ITEM_PRICE_LOCATION}
    Should Be Equal As Strings    ${first_item_price}    ${first_cart_item_price}
    
    # Navigate back to inventory page
    Click Button    ${CONTINUE_SHOPPING_BUTTON}
    ${current_location}    Get Location
    Should Be Equal As Strings    ${current_location}    ${INVENTORY_PAGE_URL}

    # Add second and third item to cart
    FOR  ${items}    IN RANGE    2    4
        Click Button    //*[@class='inventory_item'][${items}]//button[text()='Add to cart']
    END

    # Validate "Remove" buttons appears 3 times on the page
    ${remove_buttons}    Get WebElements    ${PAGE_REMOVE_BUTTONS}
    ${remove_buttons_lenght}    Get Length    ${remove_buttons}
    Should Be Equal As Integers    ${remove_buttons_lenght}    3

    # Validate badge number
    ${badge_text}    Get Text    ${SHOPPING_CART_BADGE}
    ${badge_number}    Convert To Integer    ${badge_text}
    Should Be Equal As Integers    ${badge_number}    3

    # Navigate to cart page
    Click Element    ${SHOPPING_CART}
    ${cart_items}    Get WebElements    ${ITEMS_IN_CART}
    ${cart_items_lenght}    Get Length    ${cart_items}
    Should Be Equal As Integers    ${cart_items_lenght}    3

    # Remove 1 item and validate badge number
    Click Button    ${PAGE_REMOVE_BUTTONS}

    
    


