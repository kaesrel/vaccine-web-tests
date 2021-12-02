# vaccine-web-tests

## How to Run:
- Install robot and selenium
```
$ pip install robotframework
$ pip install robotframework-seleniumlibrary
```
### Install webdriver

**Done automatically by using the webdrivermanager**
1. Install webdrivermanager
```
$ pip install webdrivermanager
```

2. Use webdrivermanager to install appropriate webdriver(s)
```
$ webdrivermanager <browser list> --linkpath <installation_path>
```
For example
```
$ webdrivermanager firefox chrome --linkpath ~/.local/bin
```
*Notes: In case of firefox, you might need to install geckodriver manually (see next step).*

**For manual installation, see below.**

1. Check browser version
- Google Chrome
```
$ google-chrome -version
```
- Firefox
```
$ firefox --version
```

2. Load appropriate webdriver version for your browser

- Google Chrome
Visit Chrome Driver Download Page (https://chromedriver.chromium.org/downloads)
and find the appropriate file based on browser-version, os and architecture.

  Load, extract and install to a suitable path.
Ex.
```
$ wget https://chromedriver.storage.googleapis.com/96.0.4664.45/chromedriver_linux64.zip
$ unzip chromedriver_linux64.zip
$ mv chromedriver ~/.local/bin
```

- Firefox
Visit Gecko Driver latest release page
(https://github.com/mozilla/geckodriver/releases/tag/v0.30.0)
and find the appropriate file based on os and architecture.

  Load, extract and install to a suitable path.
Ex.
```
$ wget https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz
$ tar -zxf geckodriver-v0.30.0-linux64.tar.gz
$ mv geckodriver ~/.local/bin
```

**Pre run. Modify some variables in resources.txt as needed**
Ex. Change browser to firefox`
```robot
${BROWSER} firefox
```

**Run Tests**

1. Registration Test (must be ran at least once)
```
$ robot register.robot
```
2. Reservation and Cancellation Test (can be ran as many times as wanted)
```
$ robot reservation
```
<br/>

## Answers to the Question:

*which do you think is a better framework for E2E testing of web applications or web services:  Robot Framework or Cucumber with Selenium/HTTP library and JUnit?*

The cucumber + others may have better testing potential than the robot framework. It is more tolerant to the change of flow implementation.
However it is more complex and may take more time to startup with than the robot framework.

Robot framework on the otherhand is simpler and may be quicker to create. However, the tests written must be changed whenever the flow implementation is changed.

In my opinion, I like the robot framework more. This may be due to my limited knowledge and programming skills.

<br/>

## Most Helpful Resources or Tutorials
1. Google search and StackOverflow
2. The <a href="https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html"> Robot Framework User Guide </a> is quite complete and contains good conventions. However, it is not a tutorial.
3. Tutorial Point's <a href="https://www.tutorialspoint.com/robot_framework/index.htm"> Robot Framework Tutorial </a> - good explanation and step by step explanation, however it is based on the RIDE (ride.py) editor. Moreover, the conventions (e.g. test cases are named like TC1, TC2, ...) are not so good.

