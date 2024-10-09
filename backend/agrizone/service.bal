import ballerina/http;

service /auth on new http:Listener(8080) {

    resource function post register(http:Caller caller, http:Request req) returns error?  {
        // Get the request body as JSON
        json|error reqBody = req.getJsonPayload();
        
        if (reqBody is json) {
            string|error username = reqBody.toString();
            string|error password = reqBody.toString();
            
            // Handle possible errors while extracting fields
            if (username is error || password is error) {
                check caller->respond({message: "Invalid username or password"});
            } else {
                // Assuming registerUser returns an int or error
                int userId = check registerUser(username, password);
                json response = {message: "User registered successfully", user_id: userId};
                check caller->respond(response);
            }
        } else {
            check caller->respond({message: "Invalid JSON payload"});
        }
    }


    // resource function post login(http:Caller caller, http:Request req) returns int|error? {
    //     json|error reqBody = req.getJsonPayload();
    //     if reqBody is json {
    //         string username = check reqBody.username.toString();
    //         string password = check reqBody.password.toString();
    //         string message = check loginUser(username, password); // Adjusted to reflect no token
    //         json response = {message: message}; // Changed to return the message directly
    //         check caller->respond(response);
    //     } else {
    //         check caller->respond({message: "Invalid payload"});
    //     }
    // }

}
