module.exports = {

    LoginAuthenticate : `SELECT U.employeeId, U.userId, U.userName, U.userPwd, U.producerId, U.userType, P.producerName FROM users U 
    LEFT JOIN usersmedia UM ON U.employeeId = UM.employeeId 
    LEFT JOIN producers P ON P.producerId = U.producerId 
    WHERE U.status = 1 AND (U.userId = ? OR UM.emailId = ? OR UM.mobileNo = ?)`,

    UserRolesSelect: `SELECT R.roleId, CAST(R.isAdmin AS UNSIGNED) AS isAdmin FROM Roles R LEFT JOIN usersroles UR ON R.roleId = UR.roleId WHERE R.status = 1 
    AND R.roleType = 'Role' AND UR.employeeId = ?`, 

    MenuSelect: `SELECT M.* FROM menu M LEFT JOIN menurole MR ON MR.menuId = M.menuId WHERE MR.roleId IN (?) Order By M.level ASC`,

    ChangePassword: `UPDATE users SET userPwd = ?, userPwdModDate = ? WHERE userStatus = 'Activated' AND employeeId = ?`
}