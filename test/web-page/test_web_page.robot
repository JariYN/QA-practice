*** Settings ***
Documentation    Testing a web page using Robot Framework and Browser library
...              Test cases are run using the Browser library.
Library    Browser
Suite Setup    Run Keywords  New Browser
...            AND  New Page  ${page_url}
Suite Teardown    Close Browser


*** Variables ***
${page_url}    https://testautomationpractice.blogspot.com/
${page_title}  Automation Testing Practice
${expected_h1}  Automation Testing Practice
${expected_name}  Enter Name
${expected_email}  Enter Email
${expected_phone}  Enter Phone


*** Test Cases ***
Test Correct Page Is Open
    [Documentation]    Test that the expected url is open in browser
    Get Url  equals    ${page_url}

Test Page Has Expected Title
    [Documentation]    Test that the expected title is found on page
    Get Title    equals    ${page_title}

Test Page Has Expected Heading Text
    [Documentation]    Test that the expected heading on page is correct
    Get Text    //h1    equals    ${expected_h1}

Test Page Has Expected Name Text Field
    [Documentation]    Test that the expected text field is on page with correct placeholder
    ${name_field}    Get Element    id=name
    Get Attribute    id=name    placeholder    equals    ${expected_name}

Test Page Has Expected Email Text Field
    [Documentation]    Test that the expected text field is on page with correct placeholder
    ${email_field}    Get Element    id=email
    Get Attribute    id=email    placeholder    equals    ${expected_email}

Test Page Has Expected Phone Text Field
    [Documentation]    Test that the expected text field is on page with correct placeholder
    ${phone_field}    Get Element    id=phone
    Get Attribute    id=phone    placeholder    equals    ${expected_phone}
