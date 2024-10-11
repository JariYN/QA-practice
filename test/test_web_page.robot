*** Settings ***
Library    Browser


*** Variables ***
${page_url}    https://testautomationpractice.blogspot.com/
${page_title}  Automation Testing Practice


*** Test Cases ***
Test Page Has Title
    New Page    ${page_url}
    Get Title    equals    ${page_title}

