*** Settings ***
Documentation    Testing a web service using Robot Framework
...              Test cases check that JSON data is returned from web service as expected.
Library    Collections
Library    RequestsLibrary
Library    ../resources/parse_json.py


*** Variables ***
${service_url}    https://jsonplaceholder.typicode.com/users
${expected_users_count}    10
${test_user_id}    ${10}


*** Test Cases ***
Test Response From Web Service - all expected users in data
    [Documentation]    Test that the expected data is received from API response.
    ...                Checks that expected amount of users are received in JSON.
    ${response}    GET    ${service_url}    expected_status=200
    ${users_count}  Count Users  ${response.json()}
    Should Be Equal As Integers  ${users_count}  10

Test Response From Web Service - user specific data correct
    [Documentation]    Test that the expected data is received from API response.
    ...                Checks that given user id has expected data in JSON.
    ${response}    GET    ${service_url}    expected_status=200    
    ${user_data}  Get User By Id  ${response.json()}  ${test_user_id}
    ${user_name}    Get From Dictionary    ${user_data}    name
    Should Be Equal As Strings    ${user_name}    Clementina DuBuque
    ${user_usrname}    Get From Dictionary    ${user_data}    username
    Should Be Equal As Strings    ${user_usrname}    Moriah.Stanton
    ${user_email}    Get From Dictionary    ${user_data}    email
    Should Be Equal As Strings    ${user_email}    Rey.Padberg@karina.biz
