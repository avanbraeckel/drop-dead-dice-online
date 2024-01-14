# **CIS*3260 Assignment 2**
### **DropDeadDice Game - Rails**
##### Austin Van Braeckel - avanbrae@uoguelph.ca - 1085829

<br>

## **Description**
The web application provides a simple user interface that allows users to sign-up to create a new login or sign-in to an existing login, and then be able to access the main part of the application. They will be able to select some game options (number of players, number of dice, and number of sides per die) for DropDeadDice and see the results of a game played by computer-controlled players. There is an option to play the game again with the same settings, go back to change the settings, or to go back to the home/user page. They also have the ability to look at the Game History page, which will allow the user to view any past games played.


*(`35016` is the port that was assigned to me for this project)*

## **Instructions**
The web application will already be runningat the time of grading, but if not, it can be run by installing the project dependencies and running the rails server:

#### **Starting Server Manually**
None of the dependencies will be installed at first, so you will have to run all of the bundle install commands first, and then start the server:

    bundle config --local disable_platform_warnings true
    bundle install --path vendor/bundle
    rails webpacker:install
    rails server -d -p 35016 -b 0.0.0.0

### **When it is running:**
When it is running, you will be able to access the web application at the following url:

`http://cis3260.socs.uoguelph.ca:35016`

It will immediately bring you to the login/sign-in page to begin.

### ***Notes:***
- The User page is implemented, for bonus marks
- The Game History page is *not* implemented, as it is only for bonus marks, and there was a lack of time to complete it
