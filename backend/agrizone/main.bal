import ballerina/crypto;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerina/sql;

public type User record {| 
    int user_id?;
    string firstName;
    string lastname;
    string email;
    string password;
|};

public type Item record {| 
    int item_id?;
    string item_name;
    int item_quentity;
    int item_price;
    string item_category;
|};

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new(
    host=HOST, user=USER, password=PASSWORD, port=PORT, database="agrizone"
);

isolated function registerUser( string firstname , string lastname ,string email, string password) returns int|error {
    byte[] hashedPassword = crypto:hashMd5(password.toBytes());
    string passwordHash = hashedPassword.toBase16();

    sql:ExecutionResult result = check dbClient->execute(` 
        INSERT INTO Users (firstname,lastname,email,password)
        VALUES (${firstname},${lastname},${email},${passwordHash})
    `);
    
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to register user");
    }
}

isolated function loginUser(string email, string password) returns string|error {
    User user = check dbClient->queryRow(
        `SELECT * FROM Users WHERE email = ${email}`
    );

    byte[] hashedPassword = crypto:hashMd5(password.toBytes());
    string passwordHash = hashedPassword.toBase16();

    if user.password == passwordHash {
        return "Login successful for user: " + email;
    } else {
        return error("Invalid username or password");
    }
}


isolated function addItem(string item_name, int item_quantity , int item_price , string item_category) returns int|error {

    sql:ExecutionResult result = check dbClient->execute(` 
        INSERT INTO Items (item_name, item_quantity, item_price, item_category)
        VALUES (${item_name}, ${item_quantity}, ${item_price} ,${item_category})
    `);
    
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to register user");
    }
}