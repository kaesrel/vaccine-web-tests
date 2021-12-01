*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Suite Teardown    Close Browser
Resource    resources.txt


*** Test Cases ***
Test registering a citizen
    Open Browser and go to Register Page
	Input information and sign up
	Check that registration is successful
	Sleep    3s 


*** Keywords ***
# User-defined keywords (actions & expressions)
Open Browser and go to Register Page
    Open Browser  ${URL}  ${BROWSER}
    Wait Until Page Contains Element    xpath://*[@id="register__link"]
	Click Element    xpath://*[@id="register__link"]

Input information and sign up
	Wait Until Page Contains Element    id:citizen_id     
	Input Text    id:citizen_id    ${CITIZENID}
	Input Text    id:name    ${NAME}
	Input Text    id:surname    ${SURNAME} 
	Input Text    id:birth_date   ${BIRTHDATE}
	Input Text    id:occupation   ${OCCUPPATION}
	Input Text    id:phone_number   ${PHONENUMBER}
	Input Text    id:address   ${ADDRESS}
	Click Button    id:register__btn
	
Check that registration is successful
    #  check that the user is redirected to home page
	Wait Until Page Contains Element    xpath://*[@id="splash-img"]/div/div/h1
	Click Element    id:nav__info__link
    Wait Until Page Contains Element    id:citizen_id
	Input Text    id:citizen_id    ${CITIZENID}
	Click Button    id:info__btn
	Wait Until Page Contains Element    xpath://html/body/div[2]/div/div[2]/div[1]/div/div/div[3]/div[2]/div[2]
	${citizen_id}=    Get Element Attribute    xpath://html/body/div[2]/div/div[2]/div[1]/div/div/div[3]/div[2]/div[2]    innerHTML    
	Should Be Equal As Strings    ${citizen_id}    ${CITIZENID}

