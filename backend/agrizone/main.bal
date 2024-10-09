import ballerina/crypto;
import ballerinax/mysql;
import ballerinax/mysql.driver as _; // For MySQL driver
import ballerina/sql;

public type User record {| 
    int user_id?;
    string username;
    string password;
|};

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="agrizone"
);

isolated function registerUser(string username, string password) returns int|error {
    byte[] hashedPassword = crypto:hashMd5(password.toBytes());
    string passwordHash = hashedPassword.toBase16();

    sql:ExecutionResult result = check dbClient->execute(` 
        INSERT INTO Users (username, password)
        VALUES (${username}, ${passwordHash})
    `);
    
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to register user");
    }
}

isolated function loginUser(string username, string password) returns string|error {
    User user = check dbClient->queryRow(
        `SELECT * FROM Users WHERE username = ${username}`
    );

    // Hash the provided password to compare with the stored hash
    byte[] hashedPassword = crypto:hashMd5(password.toBytes());
    string passwordHash = hashedPassword.toBase16();

    if user.password == passwordHash {
        return "Login successful for user: " + username;
    } else {
        return error("Invalid username or password");
    }
}
