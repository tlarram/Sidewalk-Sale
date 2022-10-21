# Sidewalk-Sale

# <Your-Project-Title>

## Welcome to Sidewalk Sale! 

We created a web application that caters to those who are looking for the good deals in their neighborhood. Inspired by the stooping phenomenon in Brooklyn,
we were able to digitize the process of looking for a good sidewalk sale. 

- Users can view, post, and save items that are listed in their neighborhood
- Grabbing the geolocation from the users IP address, with their permission, the home page will render a list of items that are available in their neighborgood
- Streamlines the process of endless hours driving around your neighborhood looking for a good find
- Users can contact the seller via javaMailSender about their item
- Gives new life to items that would otherwise be discarded 


## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Installation

Feel free to clone the project to implement your own digitial sidewalk sale. 
Clone the project

<h3>Geo Location</h3>
SAM - add a snippet of what to do to download the geolite and where to put it in the geoIP servicev <br>
-- using geoLite requires you to run on Java 11

<h3>JavaMailSender</h3>
This is only compatiable with GMAIL

In applicaiton.properties you'll need to add this snippet: <br>

spring.mail.host=smtp.gmail.com <br>
spring.mail.port=587 <br>
spring.mail.username= << YOUR GMAIL ADDRESS >> <br>
spring.mail.password= << YOUR GMAIL PASSWORD >> <br>
spring.mail.properties.mail.smtp.auth=true <br>
spring.mail.properties.mail.smtp.starttls.enable=true <br>

You may want to generate an app password from Google: <br>
<a href="https://support.google.com/mail/answer/185833?hl=en-GB">Google App Password</a>

<h3>Spring boot file upload</h3>
Add a static folder called image
Each item you create will store and image, and your model will generate a string with the correct file path to that image
You'll see the correct file path printed in the console 

## Usage

Provide instructions and examples for use. Include screenshots as needed.

To add a screenshot, create an `assets/images` folder in your repository and upload your screenshot to it. Then, using the relative filepath, add it to your README using the following syntax:

    ```md
    ![alt text](assets/images/screenshot.png)
    ```

## Credits

<h3>Collaborators</h3> <br>
<a href="https://github.com/tlarram">Timothy Larramore</a> <br>
<a href="https://github.com/cdejonge89">Lee DeJonge</a> <br>
Sam Slater -- need your github link<br>


javaMailSender resources:
<a href="https://www.baeldung.com/spring-email">Spring Email</a>
Image upload 
<a href="https://www.codejava.net/frameworks/spring-boot/spring-boot-file-upload-tutorial">Spring Boot File Upload</a>

## License

MIT License

Copyright (c) [2022] [Timothy Larramore, Lee DeJonge, Sam Slater]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## Badges

![badmath](https://img.shields.io/github/languages/top/lernantino/badmath)

## Features

- Spring Security
- javaMailSender
- Geolocation
- Spring BootF ile upload


