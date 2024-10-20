import ballerina/crypto;
import ballerina/io;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

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
    int item_quantity;
    int item_price;
    string item_category;
    string item_image;
    string location;
    string details;
|};

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new (
    host = HOST, user = USER, password = PASSWORD, port = PORT, database = DATABASE
);

isolated function createTables() returns error? {
    // Create Users table if not exists
    sql:ExecutionResult result_user = check dbClient->execute(`
        CREATE TABLE IF NOT EXISTS Users (
            user_id INT AUTO_INCREMENT PRIMARY KEY,
            firstname VARCHAR(100),
            lastname VARCHAR(100),
            email VARCHAR(100) UNIQUE,
            password VARCHAR(100)
        )
    `);
    io:println(result_user);

    // Create Items table if not exists
    sql:ExecutionResult result_items = check dbClient->execute(`
        CREATE TABLE IF NOT EXISTS Items (
            item_id INT AUTO_INCREMENT PRIMARY KEY,
            item_name VARCHAR(100),
            item_quantity INT,
            item_price INT,
            item_category VARCHAR(100),
            item_image VARCHAR(255),
            location VARCHAR(100),
            details TEXT
        )
    `);
    io:println(result_items);
}

public function main() returns error? {
    check createTables();
}

isolated function registerUser(string firstname, string lastname, string email, string password) returns int|error {
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
        return error("Invalid email or password");
    }
}

isolated function addItem(string item_name, int item_quantity, int item_price, string item_category, string item_image, string location, string details) returns int|error {

    sql:ExecutionResult result = check dbClient->execute(` 
        INSERT INTO Items (item_name, item_quantity, item_price, item_category , item_image ,location ,details)
        VALUES (${item_name}, ${item_quantity}, ${item_price} ,${item_category} , ${item_image} , ${location},${details})
    `);

    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to add item");
    }
}

function updateItemImagePath(int itemId, string imagePath) returns error? {

    sql:ParameterizedQuery updateQuery = `UPDATE items SET item_image = ${imagePath} WHERE item_id = ${itemId}`;

    _ = check dbClient->execute(updateQuery);
}

//get last item_id
isolated function getItemId() returns Item|error {
    Item item_id = check dbClient->queryRow(
        `SELECT item_id FROM items ORDER BY item_id DESC LIMIT 1`
    );
    return item_id;
}

//get all item_ids 
isolated function getItemIds() returns anydata[]|error {
    sql:ParameterizedQuery query = `SELECT item_id FROM items`;

    anydata[] itemIdArray = [];

    stream<record {}, sql:Error?> resultStream = dbClient->query(query);

    check from record {} item in resultStream
        do {
            itemIdArray.push(item);
        };

    return itemIdArray;
}

//get all item details
isolated function getItem() returns anydata[]|error {
    sql:ParameterizedQuery query = `SELECT * FROM items`;

    anydata[] detailsArray = [];

    stream<record {}, sql:Error?> resultStream = dbClient->query(query);

    check from record {} item in resultStream
        do {
            detailsArray.push(item);
        };

    return detailsArray;
}

