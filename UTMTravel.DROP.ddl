ALTER TABLE AirlineAirports DROP CONSTRAINT FK_AirlineAirports_Airports;
ALTER TABLE AirlineAirports DROP CONSTRAINT FK_AirlineAirports_Airlines;
ALTER TABLE Airplanes DROP CONSTRAINT FK_Airplanes_Airlines;
ALTER TABLE Customers DROP CONSTRAINT FK_Customers_Persons;
ALTER TABLE Flights DROP CONSTRAINT FK_Flights_Airports;
ALTER TABLE Flights DROP CONSTRAINT FK_Flights_Airports1;
ALTER TABLE Licenses DROP CONSTRAINT FK_Licenses_Staff;
ALTER TABLE Receipts DROP CONSTRAINT FK_Receipts_Customers;
ALTER TABLE Receipts DROP CONSTRAINT FK_Receipts_Airlines;
ALTER TABLE ScheduledFlights DROP CONSTRAINT FK_ScheduledFlights_Flights;
ALTER TABLE ScheduledFlights DROP CONSTRAINT FK_ScheduledFlights_Airlines;
ALTER TABLE ScheduledFlights DROP CONSTRAINT FK_ScheduledFlights_Airplanes;
ALTER TABLE Staff DROP CONSTRAINT FK_Staff_Persons;
ALTER TABLE Tickets DROP CONSTRAINT FK_Tickets_Customers;
ALTER TABLE Tickets DROP CONSTRAINT FK_Tickets_Receipts;
ALTER TABLE ScheduledFlightCrew DROP CONSTRAINT FK_ScheduledFlightCrew_ScheduledFlight;
ALTER TABLE ScheduledFlightCrew DROP CONSTRAINT FK_ScheduledFlightCrew_Staff;
ALTER TABLE FlightCargo DROP CONSTRAINT FK_FlightCargo_ScheduledFlight;

DROP TABLE AirlineAirports,Airlines,Airplanes,Airports,Customers,Flights,FlightCargo,Licenses,Person,Receipts,ScheduledFlights,ScheduledFlightCrew,Staff,Tickets;

DROP TYPE customer_status;
DROP TYPE paymentMethod;
DROP TYPE staff_role;