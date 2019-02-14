*** Settings ***
Library    SeleniumLibrary

Suite Setup    Log    Test de Suite Setup
Suite Teardown    Log    Test de Suite Teardown
Test Setup    Log    Test de Test Setup
Test Teardown    Log    Test de Test Teardown

Default Tags    robotframework          

*** Test Cases ***
MyFirstTest
    Log    Hello World...
    
FirstSeleniumTest
    Open Browser    https://www.google.fr    firefox
    Set Browser Implicit Wait    5
    Input Text    name=q    robot framework
    Press Keys    name=q    ENTER
    # Click Button    name=btnK
    Sleep    2
    Close Browser
    Log    Test terminé
    
SampleLoginTest
    [Documentation]    Il s'agit d'un simple test
    Open Browser        ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element     id=welcome
    Click Element     link=Logout
    Close Browser
    Log               Test terminé

*** Variables ***
${URL}     https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINDATA}[password]
    Click Button      id=btnLogin