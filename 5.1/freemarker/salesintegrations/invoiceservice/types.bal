import ballerina/http;

public type InvoiceResponse record {|
    *http:Ok;
    string body;
    "text/html" mediaType = "text/html";
    record {|
        (string|int|boolean|string[]|int[]|boolean[])...;
    |} headers?;
|};

public type ProductsItem record {|
    int id;
    string title;
    decimal price;
    int quantity;
    decimal total;
    decimal discountPercentage;
    decimal discountedTotal;
    string thumbnail;
|};

public type Products ProductsItem[];

public type Cart record {|
    int id;
    Products products;
    decimal total;
    decimal discountedTotal;
    int userId;
    int totalProducts;
    int totalQuantity;
|};
