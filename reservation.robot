*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Suite Teardown    Close Browser
Resource    resources.txt


*** Test Cases ***
Test reserving a vaccine for a citizen
    Open Browser and maximize window
	Go to Reservation Page
	Input information and reserve a vaccine
	Check that reservation is successful
	Sleep    3s

Test cancelling a reservation for a citizen
    Open Browser and maximize window
	Go to Info Page
	Input citizen id and go to Citizen Info Page
	Cancel vaccine reservation for that citizen
	Input citizen id and go to Citizen Info Page
	Check that vaccine has been cancelled
	Sleep    3s


*** Keywords ***
# User-defined keywords (actions & expressions)
Open Browser and maximize window
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

Go to Reservation Page
    Wait Until Page Contains Element    xpath://*[@id="reserve__link"]
	Click Element    xpath://*[@id="reserve__link"]

Go to Info Page
    Wait Until Page Contains Element    id:nav__info__link
	Click Element    id:nav__info__link

Input information and reserve a vaccine
    Input Text    id:citizen_id    ${CITIZENID}
	Click Element   id:site_name
	Click Element    xpath://option[contains(.,'${SITE}')]
    Click Element    id:vaccine_name
	Click Element    xpath://option[contains(.,'${VACCINE}')]
	Click Button    id:reserve__btn
	
Check that reservation is successful
    #  check that the user is redirected to home page
	Wait Until Page Contains Element    xpath://*[@id="splash-img"]/div/div/h1



Input citizen id and go to Citizen Info Page
    Wait Until Page Contains Element    id:citizen_id
	Input Text    id:citizen_id    ${CITIZENID}
	Click Button    id:info__btn

Cancel vaccine reservation for that citizen
    Wait Until Page Contains Element   id:cancel__btn
	Click Button    id:cancel__btn
	
Check that vaccine has been cancelled
	Wait Until Page Contains Element   id:cancel__btn
    ${vaccine_name}=    Get Element Attribute    id:reserve_vaccine_value    innerHTML
	Should Be Equal As Strings    ${vaccine_name}    \






