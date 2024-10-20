import ballerina/http;
import ballerina/io;
import ballerina/mime;

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
                    int userId = check registerUser(firstname, lastname, email, password);
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
                json message = check loginUser(email, password);
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
                string|error item_quantity = jsonMap.get("item_quantity").toString();
                string|error item_price = jsonMap.get("item_price").toString();
                string|error item_category = jsonMap.get("item_category").toString();
                string|error item_image = jsonMap.get("item_image").toString();
                string|error location = jsonMap.get("location").toString();
                string|error details = jsonMap.get("details").toString();

                if (item_name is error || item_quantity is error || item_price is error || item_category is error || item_image is error || location is error || details is error) {
                    check caller->respond({message: "Please enter valid details"});
                } else {
                    int|error quantity = int:fromString(item_quantity);
                    int|error price = int:fromString(item_price);

                    if (item_name is string && quantity is int && price is int && item_category is string && item_image is string && location is string && details is string) {
                        int itemId = check addItem(item_name, quantity, price, item_category, item_image, location, details);

                        if item_image == "" {
                            item_image = ".files/" + itemId.toString() + ".png";
                        }

                        check updateItemImagePath(itemId, check item_image);

                        json response = {message: "Add item successfully", item_id: itemId};
                        check caller->respond(response);
                    } else {
                        check caller->respond({message: "Please enter valid details"});
                    }
                }
            } else {
                check caller->respond({message: "Invalid JSON structure"});
            }
        } else {
            check caller->respond({message: "Invalid JSON payload"});
        }
    }

    resource function post item/image(http:Request req) returns string|error {

        mime:Entity[] parts = check req.getBodyParts();

        Item|error response = getItemId();

        if (response is Item) {
            int? itemId = response.item_id;

            foreach var part in parts {
                string filePath = "./files/" + itemId.toString() + ".png";

                check io:fileWriteBytes(filePath, check part.getByteArray());

                return "Image Received!";
            }
        } else {
            return response;
        }
        return "No file found in the request.";
    }

    resource function get item/get(http:Request req) returns anydata[]|error {
        anydata[]|error item = getItem();
        return item;
    }

    resource function get item/serveImage(http:Caller caller, http:Request req) returns error? {
        string? imagePath = req.getQueryParamValue("image_path");

        if imagePath is string {
            string fullImagePath = "./files/" + imagePath;

            (byte[] & readonly)|io:Error imageBytes = io:fileReadBytes(fullImagePath);

            if imageBytes is byte[] {
                mime:Entity mediaEntity = new;
                mediaEntity.setByteArray(imageBytes);

                mime:InvalidContentTypeError? contentType = mediaEntity.setContentType(mime:IMAGE_PNG);

                http:Response res = new;
                res.setEntity(mediaEntity);

                check caller->respond(res);
            } else {
                http:Response res = new;
                res.statusCode = 404;
                res.setPayload("Image not found");
                check caller->respond(res);
            }
        } else {
            http:Response res = new;
            res.statusCode = 400;
            res.setPayload("Image path not provided");
            check caller->respond(res);
        }
    }

    //itemID
    resource function get items/serveImage(http:Request req) returns anydata[]|error {
        anydata[]|error item = getItemIds();
        return item;
    }

    resource function get items/serveImages(http:Caller caller, http:Request req) returns error? {
        anydata[]|error items = getItemIds();

        map<string[]> imagePath = req.getQueryParams();

        if items is error {
            http:Response res = new;
            res.statusCode = 500;
            res.setPayload("Failed to retrieve item IDs");
            check caller->respond(res);
            return;
        }
        io:print(imagePath);
        mime:Entity[] bodyParts = [];

        foreach var fileName in imagePath.keys() {
            io:print("File name from query params: " + fileName);

            foreach var item in items {
                if item is map<anydata> && item.hasKey("item_id") {
                    var itemId = item["item_id"];
                    if itemId is int || itemId is string {
                        string fullImagePath = "./files/" + fileName;

                        (byte[] & readonly)|io:Error imageBytes = io:fileReadBytes(fullImagePath);

                        if imageBytes is byte[] {
                            mime:Entity mediaEntity = new;
                            mediaEntity.setByteArray(imageBytes);
                            mime:InvalidContentTypeError? contentType = mediaEntity.setContentType(mime:IMAGE_PNG);
                            http:Response res = new;
                            res.setEntity(mediaEntity);

                            check caller->respond(res);
                        } else {
                            // Handle case where the image is not found
                            json errorJson = {item_id: itemId, errors: "Image not found"};
                            mime:Entity errorEntity = new;
                            errorEntity.setJson(errorJson);
                            bodyParts.push(errorEntity);
                        }
                    }
                }
            }
        }

    }
}
