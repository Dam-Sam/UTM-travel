CREATE TYPE customer_status AS ENUM ('Non-Member', 'Bronze', 'Silver', 'Gold');
CREATE TYPE paymentMethod AS ENUM ('cash', 'debit', 'credit', 'gift card');
CREATE TYPE staff_role AS ENUM ('Pilot', 'Flight Attendant', 'Baggage Handler', 'Kiosk Staff', 'Manager');

CREATE TABLE AirlineAirports (
    AirportCode CHAR (3) NOT NULL,
    AirlineCode CHAR (10) NOT NULL,
    CONSTRAINT PK_AirlineAirports PRIMARY KEY (AirportCode,AirlineCode)
);


CREATE TABLE Airlines (
    Code CHAR (10)     NOT NULL,
    Name VARCHAR (250) NOT NULL,
    CONSTRAINT PK_Airlines PRIMARY KEY (Code)
);



CREATE TABLE Airplanes (
    Id                 SERIAL          NOT NULL,
    Type               CHAR (10)       NOT NULL,
    RegistrationNumber CHAR (10)       NOT NULL,
    MaxPassengers      INT             NOT NULL,
    MacCarCapacity     INT             NOT NULL,
    YearsInService     INT             NOT NULL,
    OwningAirline      CHAR (10)       NOT NULL,
    CONSTRAINT PK_Airplanes PRIMARY KEY (Id)
);


CREATE TABLE Airports (
    Code        CHAR (3) NOT NULL,
    Description TEXT      NOT NULL,
    Runways     INT        NOT NULL,
    CONSTRAINT PK_Airports PRIMARY KEY (Code)
);



CREATE TABLE Customers (
    Id     SERIAL             NOT NULL,
    Status customer_status    NOT NULL,
    CONSTRAINT PK_Customers PRIMARY KEY (Id)
);

CREATE TABLE Flights (
    Number           CHAR (10) NOT NULL,
    DepartingAirport CHAR (3) NOT NULL,
    ArrivingAirport  CHAR (3) NOT NULL,
    CONSTRAINT PK_Flights PRIMARY KEY (Number)
);

CREATE TABLE FlightCargo (
    ScheduledFlightId           INT NOT NULL,
    TotalCargo                  INT NOT NULL,
    CONSTRAINT PK_FlightCargo PRIMARY KEY (ScheduledFlightId)
);


CREATE TABLE Licenses (
    Id        SERIAL           NOT NULL,
    Type      VARCHAR (50)     NOT NULL,
    StaffName VARCHAR (100)    NOT NULL,
    IssuedOn  TIMESTAMP        NOT NULL,
    ExpiresOn TIMESTAMP        NOT NULL,
    IssuedTo  INT              NOT NULL,
    CONSTRAINT PK_Licenses PRIMARY KEY (Id)
);


CREATE TABLE Person (
    Id        SERIAL          NOT NULL,
    FirstName VARCHAR (50)    NOT NULL,
    LastName  VARCHAR (50)    NOT NULL,
    Info      TEXT            NOT NULL,
    CONSTRAINT PK_Person PRIMARY KEY (Id)
);


CREATE TABLE Receipts (
    Number             SERIAL           NOT NULL,
    AmountPaid         MONEY            NOT NULL,
    ParchaseDateTime   TIMESTAMP        NOT NULL,
    PaymentMethod      VARCHAR (50)     NOT NULL,
    IssuedToCustomerId INT              NOT NULL,
    ForAirlineId       CHAR (10)        NOT NULL,
    CONSTRAINT PK_Receipts PRIMARY KEY (Number)
);


CREATE TABLE ScheduledFlights (
    ScheduleId              SERIAL          NOT NULL,
    Number           CHAR (10)       NOT NULL,
    AirlineCode      CHAR (10)       NOT NULL,
    AssignedAirplane INT             NOT NULL,
    DepartureTime    TIMESTAMP       NOT NULL,
    ArrivalTime      TIMESTAMP       NOT NULL,
    CONSTRAINT PK_ScheduledFlights PRIMARY KEY (ScheduleId),
    UNIQUE (Number, AirlineCode, AssignedAirplane, DepartureTime)
);

CREATE TABLE ScheduledFlightCrew (
    ScheduledFlightId     INT   NOT NULL,
    StaffId INT    NOT NULL,
    CONSTRAINT PK_FlightCrew PRIMARY KEY (ScheduledFlightId, StaffId)
);

CREATE TABLE Staff (
    Id                   SERIAL      NOT NULL,
    HasSecurityClearance BOOLEAN     NOT NULL,
    Role                 staff_role  NOT NULL,
    CONSTRAINT PK_Staff PRIMARY KEY (Id)
);


CREATE TABLE Tickets (
    Id            SERIAL          NOT NULL,
    BasePrice     FLOAT (53)      NOT NULL,
    FlightNumber  CHAR (10)       NOT NULL,
    ScheduledFlightId INT       NOT NULL,
    Seat          CHAR (10)       NOT NULL,
    CustomerId    INT             NOT NULL,
    ReceiptNumber INT             NOT NULL,
    CONSTRAINT PK_Tickets PRIMARY KEY (Id)
);


ALTER TABLE FlightCargo ADD CONSTRAINT FK_FlightCargo_ScheduledFlight
FOREIGN KEY (ScheduledFlightId) REFERENCES ScheduledFlights (ScheduleId);

ALTER TABLE ScheduledFlightCrew ADD CONSTRAINT FK_ScheduledFlightCrew_ScheduledFlight
FOREIGN KEY (ScheduledFlightId) REFERENCES ScheduledFlights (ScheduleId);

ALTER TABLE ScheduledFlightCrew ADD CONSTRAINT FK_ScheduledFlightCrew_Staff
FOREIGN KEY (StaffId) REFERENCES Staff (Id);

ALTER TABLE AirlineAirports ADD CONSTRAINT FK_AirlineAirports_Airports
FOREIGN KEY (AirportCode) REFERENCES Airports (Code);

ALTER TABLE AirlineAirports ADD CONSTRAINT FK_AirlineAirports_Airlines
FOREIGN KEY (AirlineCode) REFERENCES Airlines (Code);

ALTER TABLE Airplanes ADD CONSTRAINT FK_Airplanes_Airlines
FOREIGN KEY (OwningAirline) REFERENCES Airlines (Code);

ALTER TABLE Customers ADD CONSTRAINT FK_Customers_Persons
FOREIGN KEY (Id) REFERENCES Person (Id);

ALTER TABLE Flights ADD CONSTRAINT FK_Flights_Airports
FOREIGN KEY (DepartingAirport) REFERENCES Airports (Code);

ALTER TABLE Flights ADD CONSTRAINT FK_Flights_Airports1
FOREIGN KEY (ArrivingAirport) REFERENCES Airports (Code);

ALTER TABLE Licenses ADD CONSTRAINT FK_Licenses_Staff
FOREIGN KEY (IssuedTo) REFERENCES Staff (Id);

ALTER TABLE Receipts ADD CONSTRAINT FK_Receipts_Customers
FOREIGN KEY (IssuedToCustomerId) REFERENCES Customers (Id);

ALTER TABLE Receipts ADD CONSTRAINT FK_Receipts_Airlines
FOREIGN KEY (ForAirlineId) REFERENCES Airlines (Code);

ALTER TABLE ScheduledFlights ADD CONSTRAINT FK_ScheduledFlights_Flights
FOREIGN KEY (Number) REFERENCES Flights (Number);

ALTER TABLE ScheduledFlights ADD CONSTRAINT FK_ScheduledFlights_Airlines
FOREIGN KEY (AirlineCode) REFERENCES Airlines (Code);

ALTER TABLE ScheduledFlights ADD CONSTRAINT FK_ScheduledFlights_Airplanes
FOREIGN KEY (AssignedAirplane) REFERENCES Airplanes (Id);

ALTER TABLE Staff ADD CONSTRAINT FK_Staff_Persons
FOREIGN KEY (Id) REFERENCES Person (Id);

ALTER TABLE Tickets ADD CONSTRAINT FK_Tickets_Customers
FOREIGN KEY (CustomerId) REFERENCES Customers (Id);

ALTER TABLE Tickets ADD CONSTRAINT FK_Tickets_Receipts
FOREIGN KEY (ReceiptNumber) REFERENCES Receipts (Number);

ALTER TABLE Tickets ADD CONSTRAINT FK_Tickets_ShceduledFlights
FOREIGN KEY (ScheduledFlightId) REFERENCES ScheduledFlights (ScheduleId);


