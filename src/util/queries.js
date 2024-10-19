module.exports = {

    LoginAuthenticate : `SELECT U.employeeId, U.userId, U.userName, U.userPwd, U.producerId, U.userType, P.producerName FROM users U 
    JOIN usersmedia UM ON U.employeeId = UM.employeeId 
    JOIN producers P ON P.producerId = U.producerId 
    WHERE U.status = 1 AND (U.employeeId = ? OR UM.emailId = ? OR UM.mobileNo = ?)`,

    UserRolesSelect: `SELECT R.roleId, CAST(R.isAdmin AS UNSIGNED) AS isAdmin FROM Roles R JOIN usersroles UR ON R.roleId = UR.roleId WHERE R.status = 1 AND R.roleType = 'Role' AND UR.employeeId = ?`
}