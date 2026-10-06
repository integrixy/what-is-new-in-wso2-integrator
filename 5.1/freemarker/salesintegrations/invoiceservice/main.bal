import ballerina/http;
import ballerinax/freemarker;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /cart on httpDefaultListener {
    resource function get invoice/[int id]() returns InvoiceResponse|error {
        do {
            Cart cartResponse = check httpClient->get(string `/carts/${id}`);
            string htmlResult = check freemarker:renderFromFile(string `${templateFile}`, cartResponse);
            InvoiceResponse res = {
                body: htmlResult
            };
            return res;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}
