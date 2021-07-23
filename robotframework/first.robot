*** Settings ***
Documentation   First robotframework test case.
Library         OperatingSystem
Library         SeleniumLibrary
Library         String

*** Variables ***
${MESSAGE}      Hello World!

*** Test Cases ***
My Test
    [Documentation]     My first Test
    Log                 ${MESSAGE}
    Log                 ${CURDIR}
    My Keyword          ${CURDIR}

*** Keywords ***
My Keyword
    [Arguments]     ${path}
    Directory Should Exist  ${path}
