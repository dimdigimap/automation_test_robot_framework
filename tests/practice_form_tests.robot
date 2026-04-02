*** Settings ***
Library     SeleniumLibrary
Resource    ../resources/keywords/practice_form_keywords.robot
Resource    ../resources/variables/global_variables.robot

Suite Teardown    Close All Browsers
Test Teardown     Run Keyword If Test Failed    Capture Page Screenshot

*** Test Cases ***
TC-001 Submit form male
    [Documentation]    Verify form all mandatory fields 
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad    Tester
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Math
    Select Hobbies    Sports
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Select State And City    NCR    Noida
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Thanks for submitting the form
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Math
    Verify Modal Contains    Sports
    [Teardown]    Close Browser

TC-002 Submit form female
    [Documentation]    Verify form all mandatory fields 
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad    Tester
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Female
    Input Mobile Number    0812345678
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Select State And City    Haryana    Panipat
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Thanks for submitting the form
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Accounting
    Verify Modal Contains    Reading
    [Teardown]    Close Browser

TC-003 Submit form others
    [Documentation]    Verify form all mandatory fields 
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad    Tester
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Social
    Select Hobbies    Music
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Select State And City    Rajasthan    Jaipur
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Thanks for submitting the form
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Social
    Verify Modal Contains    Music
    [Teardown]    Close Browser

TC-004 Submit form lastname null
    [Documentation]    Verify field last name couldnt be null
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad    ${EMPTY}
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Social
    Select Hobbies    Music
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Select State And City    Rajasthan    Jaipur
    Submit Form
    Verify Field Is Invalid    lastName
    [Teardown]    Close Browser

TC-005 Submit form lastname lenght 101 char
    [Documentation]    Verify field last name max 100 char
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad  abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv  
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Social
    Select Hobbies    Music
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Select State And City    Haryana    Panipat
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Social
    Verify Modal Contains    Music
    [Teardown]    Close Browser

TC-006 Submit form lastname contains number
    [Documentation]    Verify field lastname couldnt contain number
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad  abcdef012345ghijklm  
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Accounting
    Verify Modal Contains    Reading
    [Teardown]    Close Browser

TC-007 Submit form lastname contains special char
    [Documentation]    Verify field lastname couldnt contain special char ('.,)
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    Arsyad  abcdef'ghi.jk,lm  
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Accounting
    Verify Modal Contains    Reading
    [Teardown]    Close Browser


TC-008 Submit form first name null
    [Documentation]    Verify field first name couldnt be null 
    [Tags]    smoke    positive
    Log    CSS_FIRST_NAME = ${CSS_FIRST_NAME}
    Open Practice Form
    Input Student Name     ${EMPTY}   Arsyad  
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Field Is Invalid    ${CSS_FIRST_NAME}
    [Teardown]    Close Browser

TC-009 Submit form firstname lenght 101 char
    [Documentation]    Verify field firstname max 100 char 
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv   Arsyad 
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    [Teardown]    Close Browser

TC-010 Submit form firstname contains number
    [Documentation]    Verify field firstname couldnt contains number
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    abcdef012345ghijklm   Arsyad 
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Math
    Select Hobbies    Sports
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Math
    Verify Modal Contains    Sports
    [Teardown]    Close Browser

TC-011 Submit form firstname contains special char
    [Documentation]    Verify field firstname couldnt contain special char ('.,)
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name    abcdef'ghi.jk,lm   Arsyad 
    Input Student Email    arsyad@gmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Math
    Select Hobbies    Sports
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Math
    Verify Modal Contains    Sports
    [Teardown]    Close Browser

TC-012 Submit form email null
    [Documentation]    Verify field email couldnt be null
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name       Arsyad    Tester  
    Input Student Email    ${EMPTY}
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Field Is Invalid    ${CSS_EMAIL}
    [Teardown]    Close Browser

TC-013 Submit form email doesnt contain @
    [Documentation]    Verify field email must contain @
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name       Arsyad    Tester  
    Input Student Email    arsyadgmail.co.id
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    [Teardown]    Close Browser

TC-014 Submit form email wrong format
    [Documentation]    Verify field email must be email format
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name       Arsyad    Tester  
    Input Student Email    arsyad@gmailcoid
    Select Gender    Male
    Input Mobile Number    0812345678
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Form Submitted Successfully
    Verify Modal Contains    Arsyad
    Verify Modal Contains    arsyad@gmail.co.id
    Verify Modal Contains    Accounting
    Verify Modal Contains    Reading
    [Teardown]    Close Browser

TC-015 Submit form phone number null
    [Documentation]    Verify field phone number couldnt be null
    [Tags]    smoke    positive
    Open Practice Form
    Input Student Name       Arsyad    Tester  
    Input Student Email    arsyad@gmailcoid
    Select Gender    Male
    Input Mobile Number    ${EMPTY}
    Input Subjects    Accounting
    Select Hobbies    Reading
    Input Current Address    Jl. Prof. DR. Satrio No.Kav 3, RT.17/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940
    Submit Form
    Verify Field Is Invalid    ${CSS_MOBILE}
    [Teardown]    Close Browser