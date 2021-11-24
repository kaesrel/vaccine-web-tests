*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser
Suite Teardown    Close Browser

*** Variables ***
# variable names can contain spaces
${BROWSER}		chrome
${URL}			https://service-taker.vercel.app/
${NAME}    		Chanathip
${SURNAME}    	Thumkanon
${CITIZENID}   	1104300360712
${BIRTHDATE} =  Convert Date 2001-01-21
${OCCUPPATION}  Student
${ADDRESS}    	72/243 Ramkamhaeng 178 rd. Minburi Bangkok Thailand
${EMAIL}    	chanathip.thu@ku.th
${PASSWORD}		nopassword


*** Test Cases ***
Test registering a user
	Open Browser and go to Register Page
	Input information and sign up

Test login
	Open Browser  ${URL}  ${BROWSER}
	Input information and login


*** Keywords ***
# User-defined keywords (actions & expressions)

Open Browser and go to Register Page
	Open Browser  ${URL}  ${BROWSER}
	Wait Until Page Contains Element  xpath://*[@id="signup-btn"]
	Click Element  xpath://*[@id="signup-btn"]

Input information and sign up
	Wait Until Page Contains Element  xpath:/html/body/div/div/form/input[1]

	Input Text  xpath:/html/body/div/div/form/input[1]  ${NAME}
	Input Text  xpath:/html/body/div/div/form/input[2]  ${SURNAME}
	Input Text  xpath:/html/body/div/div/form/input[3]  ${CITIZENID}
	Input Text  xpath:/html/body/div/div/form/input[4]  ${BIRTHDATE}
	Input Text  xpath:/html/body/div/div/form/input[5]  ${OCCUPPATION}
	Input Text  xpath:/html/body/div/div/form/input[6]  ${ADDRESS}
	Input Text  xpath:/html/body/div/div/form/input[7]  ${EMAIL}
	Input Text  xpath:/html/body/div/div/form/input[8]  ${PASSWORD}

	Click Element  xpath:/html/body/div/div/form/button[1]
	

Input information and login
	Wait Until Page Contains Element  id:email-input
	Input Text  id:email-input  ${EMAIL}
	Input Text  id:password-input  ${PASSWORD}
	Click Element  id:login-btn



#	
#	

# xpath:/html/body/div/div/form/input[1]




