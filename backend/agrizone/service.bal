import ballerina/http;

service /auth on new http:Listener(8080) {

    resource function post register(http:Caller caller, http:Request req) returns error? {
        json|error reqBody = req.getJsonPayload();

        if (reqBody is json) {
            map<anydata>|error jsonMap = reqBody.cloneWithType();

            if (jsonMap is map<anydata>) {
                string|error username = jsonMap.get("username").toString();
                string|error password = jsonMap.get("password").toString();

                if (username is error || password is error) {
                    check caller->respond({message: "Invalid username or password"});
                } else {
                    int userId = check registerUser(username, password);
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

    resource function post login(http:Caller caller, http:Request req) returns error? {
        json|error reqBody = req.getJsonPayload();

        if (reqBody is json) {
            map<anydata>|error jsonMap = reqBody.cloneWithType();

            if (jsonMap is map<anydata>) {
                string username = jsonMap.get("username").toString();
                string password = jsonMap.get("password").toString();
                string message = check loginUser(username, password);
                json response = {message: message}; 
                check caller->respond(response);
            } else {
                check caller->respond({message: "Invalid JSON structure"});
            }

        }
        else {
            check caller->respond({message: "Invalid payload"});
        }
    }

}
