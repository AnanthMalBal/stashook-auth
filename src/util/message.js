module.exports = {

    USER_LOGGED_IN_SUCCESSFULLY: { type: 'success', message: 'User Logged-In successfully.' },
    USER_NOT_FOUND: { type: 'error', message: 'User not found or In-active.' },
    USER_TOKEN_INVALID: { type: 'error', message: 'User Authentication Token is Invalid.' },
    USER_LOGGED_IN_FAILED: { type: 'error', message: 'Invalid Credentials. Please provide valid Username and Password.' },
    USER_PASSWORD_CHANGED_SUCCESSFULLY: { type: 'success', message: 'Password Has Been Changed Successfully.' },
    USER_PASSWORD_CHANGE_FAILED: { type: 'error', message: 'Invalid OTP Or OTP Expired. Please Try Forgot Password Again.'},
    USER_PASSWORD_TOKEN_SEND_TO_EMAIL_ID: { type: 'success', message: 'User Password Change Code Send To Your Email Id. OTP Valid For 120 Seconds.' },
    USER_PASSWORD_GENERATION_FAILED: { type: 'error', message: 'Invalid User. Unable To Generate OTP.' },
    USER_PASSWORD_UNABLE_SEND_EMAIL: { type: 'error', message: 'Unable To Send Email.'}
}