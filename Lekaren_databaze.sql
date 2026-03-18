CREATE TABLE Product (
    product_id INT PRIMARY KEY, -- think about auto generation of id
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1024),
    price DECIMAL(10, 2) NOT NULL,
    size_of_package VARCHAR(255)
);

CREATE TABLE Repository (
    repositroy_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity VARCHAR(255)
);

CREATE TABLE Sell (
    transaction_id INT PRIMARY KEY,
    timestamp TIMESTAMP NOT NULL,
    pharmacist_name VARCHAR(255) NOT NULL,
    payment_method VARCHAR(255) NOT NULL
)

CREATE TABLE Statemnet (
    statement_id INT PRIMARY KEY,
    transaction_from DATETIME NOT NULL,
    transaction_to DATETIME NOT NULL,
    date_of_export DATETIME NOT NULL
)

CREATE TABlE Healt_insurance_company (
    number_of_company INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
)

CREATE TABLE Effect (
    name VARCHAR(255) PRIMARY KEY,
    type VARCHAR(255) NOT NULL,
    description VARCHAR(1024)
    
)

--inheritance
CREATE TABLE Medicine (
    method_of_disbursement VARCHAR(255) NOT NULL, -- if it is prescription or not
    Medicine_id foreign key references Product(Product_id)
    name foreign key references Product(name)
    description foreign key references Product(description)
    price foreign key references Product(price)
    size_of_package foreign key references Product(size_of_package)

)

CREATE TABLE Additional_goods (
    kategory_of_goods VARCHAR(255) NOT NULL,
    product_id foreign key references Product(Product_id)
    name foreign key references Product(name)
    description foreign key references Product(description)
    price foreign key references Product(price)
    size_of_package foreign key references Product(size_of_package)
)

CREATE TABLE Contribute_to (
    number_of_company foreign key references Healt_insurance_company(number_of_company)
    medicine_id foreign key references Medicine(Medicine_id)
    contribution_amount DECIMAL(10, 2) NOT NULL
    CHECK (contribution_amount >= 0)
    available_from DATE NOT NULL
    available_to DATE NOT NULL
)

CREATE TABLE Contains (
    product_id foreign key references Product(product_id)
    repository_id foreign key references Repository(repositroy_id)
    amount_on_repository INT NOT NULL
    date_of_supply DATE
    CHECK (amount_on_repository >= 0)
)