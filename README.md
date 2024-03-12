# Sauce Demo Website Test Automation
This is a Robot Framework test automation project for the Sauce Demo website (https://www.saucedemo.com/). The project includes test cases covering various functionalities of the website, such as login, cart operations, and checkout process.

## Prerequisites
- Python 3.x (Robot Framework is Python-based)
- Robot Framework (Installation: ```pip install robotframework```)
- Robot Framework SeleniumLibrary (Installation: ```pip install --upgrade robotframework-seleniumlibrary```)

## Installation
1. Clone the repository:
```
git clone https://github.com/your-username/sauce-demo-tests.git
```

2. Navigate to the project directory:
```
cd sauce-demo-tests
```

3. Install the required Python libraries:
```
pip install -r requirements.txt
```

## Running Tests
To run the entire test suite, use the following command:

```
robot -d ./results ./tests
```

This will execute all the test cases and generate a report and log files in the results directory.

You can also run specific test cases or suites by providing their respective paths. For example:
```
robot -d ./results ./tests/login.robot
```

This will run only the test cases in the login_tests.robot file.

## Test Cases
The project includes the following test cases:

- login_tests.robot
- checkout_tests.robot
- checkout_info_test.robot
- add_to_cart_test.robot