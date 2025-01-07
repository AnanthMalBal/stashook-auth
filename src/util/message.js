module.exports = {

    USER_LOGGED_IN_SUCCESSFULLY: { type: 'success', info: 'User Logged-In successfully.' },
    USER_NOT_FOUND: { type: 'error', info: 'User not found or In-active.' },
    USER_TOKEN_INVALID: { type: 'error', info: 'User Authentication Token is Invalid.' },
    USER_LOGGED_IN_FAILED: { type: 'error', info: 'Invalid Credentials. Please provide valid Username and Password.' },
    USER_PASSWORD_CHANGED_SUCCESSFULLY: { type: 'success', info: 'Password Has Been Changed Successfully.' },
    UNABLE_TO_CHANGE_USER_PASSWORD: { type: 'error', info: 'Unable To Change Password. Please Contact Administrator.' },
    USER_PASSWORD_TOKEN_SEND_TO_EMAIL_ID: { type: 'success', info: 'User Password Change Code Send To Your Registered Email Id.' },
    UNABLE_TO_CHANGE_INVALID_EXPIRE_OTP: { type: 'error', info: 'Invalid OTP Or OTP Expired. Please Try Forgot Password Again.'},
    USER_PASSWORD_INVALID_USER: { type: 'error', info: 'Invalid User. Unable To Generate OTP.' },
    USER_PASSWORD_UNABLE_SEND_EMAIL: { type: 'error', info: 'Unable To Send Email.'}
}