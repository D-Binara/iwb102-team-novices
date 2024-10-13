import ballerina/http;

listener http:Listener authListener = new (8080);

service / on authListener {

    // Auth functions
    resource function post auth/register(http:Caller caller, http:Request req) returns error? {
        json|error reqBody = req.getJsonPayload();

        if (reqBody is json) {
            map<anydata>|error jsonMap = reqBody.cloneWithType();

            if (jsonMap is map<anydata>) {
                string|error firstname = jsonMap.get("firstname").toString();
                string|error lastname = jsonMap.get("lastname").toString();
                string|error email = jsonMap.get("email").toString();
                string|error password = jsonMap.get("password").toString();

                if (firstname is error || lastname is error || email is error || password is error) {
                    check caller->respond({message: "Invalid username or password"});
                } else {
                    int userId = check registerUser(firstname, lastname , email, password);
                    json response = {message: "User registered successfully", user_id: userId};
                    check caller->respond(response);
                }
            } else {
                check caller->respond({message: "Invalid JSON structure"});
            }
        } else {
            check caller->respond({message: "Invalid JSON payload"});
        }
    }

    resource function post auth/login(http:Caller caller, http:Request req) returns error? {
        json|error reqBody = req.getJsonPayload();

        if (reqBody is json) {
            map<anydata>|error jsonMap = reqBody.cloneWithType();

            if (jsonMap is map<anydata>) {
                string email = jsonMap.get("email").toString();
                string password = jsonMap.get("password").toString();
                string message = check loginUser(email, password);
                json response = {message: message};
                check caller->respond(response);
            } else {
                check caller->respond({message: "Invalid JSON structure"});
            }

        } else {
            check caller->respond({message: "Invalid payload"});
        }
    }

    // Items functions
    resource function post items/add(http:Caller caller, http:Request req) returns error? {
        json|error reqBody = req.getJsonPayload();

        if (reqBody is json) {
            map<anydata>|error jsonMap = reqBody.cloneWithType();

            if (jsonMap is map<anydata>) {
                string|error item_name = jsonMap.get("item_name").toString();
                int|error item_quantity = jsonMap.get("item_quantity").count();
                int|error item_price = jsonMap.get("item_price").count();
                string|error item_category = jsonMap.get("item_category").toString();

                if (item_name is error || item_quantity is error || item_price is error || item_category is error) {
                    check caller->respond({message: "Please enter valid details"});
                } else {
                    int itemId = check addItem(item_name, item_quantity, item_price, item_category);
                    json response = {message: "Add item successfully", item_id: itemId};
                    check caller->respond(response);
                }
            } else {
                check caller->respond({message: "Invalid JSON structure"});
            }
        } else {
            check caller->respond({message: "Invalid JSON payload"});
        }
    }
}
