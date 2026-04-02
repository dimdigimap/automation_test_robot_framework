*** Settings ***
Library     SeleniumLibrary
Resource    ../variables/global_variables.robot
Resource    ../locators/practice_form_locators.robot

*** Keywords ***
Open Practice Form
    Open Browser    ${BASE_URL}/automation-practice-form    ${BROWSER}
    Set Selenium Timeout    ${TIMEOUT}
    Wait Until Element Is Visible    ${LOC_FIRST_NAME}
    Execute JavaScript
    ...    document.getElementById('fixedban')?.remove();
    ...    document.querySelector('footer')?.remove();
    ...    document.getElementById('adplus-anchor')?.remove();
    ...    document.querySelectorAll('[class*="ad"]').forEach(e => e.remove());

Input Student Name
    [Arguments]    ${first_name}    ${last_name}
    Input Text    ${LOC_FIRST_NAME}    ${first_name}
    Input Text    ${LOC_LAST_NAME}    ${last_name}

Input Student Email
    [Arguments]    ${email}
    Input Text    ${LOC_EMAIL}    ${email}

Select Gender
    [Arguments]    ${gender}
    Click Element    xpath=//label[text()='${gender}']

Input Mobile Number
    [Arguments]    ${mobile}
    Input Text    ${LOC_MOBILE}    ${mobile}

Input Date Of Birth
    [Arguments]    ${date}
    Press Keys    ${LOC_DATE_OF_BIRTH}    CTRL+a
    Input Text    ${LOC_DATE_OF_BIRTH}    ${date}
    Press Keys    ${LOC_DATE_OF_BIRTH}    ENTER

Input Subjects
    [Arguments]    @{subjects}
    FOR    ${subject}    IN    @{subjects}
        Input Text    ${LOC_SUBJECTS}    ${subject}
        Sleep    0.5s
        Press Keys    ${LOC_SUBJECTS}    ENTER
    END

Select Hobbies
    [Arguments]    @{hobbies}
    FOR    ${hobby}    IN    @{hobbies}
        Click Element    xpath=//label[text()='${hobby}']
    END

Upload Picture
    [Arguments]    ${file_path}
    Choose File    ${LOC_UPLOAD_PICTURE}    ${file_path}

Input Current Address
    [Arguments]    ${address}
    Input Text    ${LOC_CURRENT_ADDRESS}    ${address}

Select State And City
    [Arguments]    ${state}    ${city}
    Scroll Element Into View    ${LOC_STATE}
    Click Element    ${LOC_STATE}
    Input Text    ${LOC_STATE_INPUT}    ${state}
    Sleep    0.5s
    Press Keys    ${LOC_STATE_INPUT}    ENTER
    Sleep    0.5s
    Click Element    ${LOC_CITY}
    Input Text    ${LOC_CITY_INPUT}    ${city}
    Sleep    0.5s
    Press Keys    ${LOC_CITY_INPUT}    ENTER

Submit Form
    Scroll Element Into View    ${LOC_SUBMIT}
    Click Button    ${LOC_SUBMIT}

Verify Form Submitted Successfully
    Wait Until Element Is Visible    ${LOC_SUCCESS_MODAL}    timeout=${TIMEOUT}
    Element Should Contain    ${LOC_SUCCESS_MODAL}    Thanks for submitting the form

Verify Modal Contains
    [Arguments]    ${expected_text}
    Page Should Contain    ${expected_text}

Close Success Modal
    Click Button    ${LOC_CLOSE_MODAL}

Fill Complete Form
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${gender}    ${mobile}    ${address}
    Input Student Name    ${first_name}    ${last_name}
    Input Student Email    ${email}
    Select Gender    ${gender}
    Input Mobile Number    ${mobile}
    Input Current Address    ${address}

Verify Field Is Valid
    [Arguments]    ${field_id}
    Sleep    0.5s
    ${is_valid}=    Execute JavaScript
    ...    return document.querySelector('\#${field_id}').validity.valid
    Should Be True    ${is_valid}

Verify Field Is Invalid
    [Arguments]    ${field_id}
    Sleep    0.5s
    ${is_invalid}=    Execute JavaScript
    ...    return !document.querySelector('\#${field_id}').validity.valid
    Should Be True    ${is_invalid}

Verify Field Max Length
    [Arguments]    ${field_id}    ${expected_max}
    ${maxlength}=    Execute JavaScript
    ...    return document.getElementById('${field_id}').getAttribute('maxlength')
    Should Be Equal    ${maxlength}    ${expected_max}

Verify Field Min Length
    [Arguments]    ${field_id}    ${expected_min}
    ${minlength}=    Execute JavaScript
    ...    return document.getElementById('${field_id}').getAttribute('minlength')
    Should Be Equal    ${minlength}    ${expected_min}

Verify Date Of Birth Value
    [Arguments]    ${expected_date}
    ${value}=    Execute JavaScript
    ...    return document.getElementById('dateOfBirthInput').value
    Should Be Equal    ${value}    ${expected_date}

Verify Date Of Birth Is Not Empty
    ${value}=    Execute JavaScript
    ...    return document.getElementById('dateOfBirthInput').value
    Should Not Be Empty    ${value}