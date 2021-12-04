-- 21 Different SQL queries to demonstrate the completeness of the database schema and knowledge of SQL

-- add a DUPLICATE user account - the “emailaddress” attribute in the user_account table is unique so this should fail to prevent a user duplicating their account by mistake. 
START TRANSACTION; 
    INSERT INTO `address` (`AddressID`, `AddressTypeId`, `AddressLine1`, `AddressLine2`, `Town/City`, `County`, `CountryID`, `Postcode`) VALUES (NULL, 1, '12 esquina', NULL, 'Barcelona', 'Carrer de la Fusteria', 6, '08002'); 

    SET @last_id_in_address = LAST_INSERT_ID(); 
    INSERT INTO `user_account` (`UserAccountID`, `TitleID`, `UserFirstName`, `UserLastName`, `EmailAddress`, `AccountPassword`, `AddressID`, `PrimaryPhoneNumber`, `AlternatePhoneNumber`, `InternationalDialCode`, `EJOffers`, `PartnerOffers`, `EJPlusNumber`) VALUES (NULL, 3, 'Maria', 'Garcia', 'm.garcia23@outlook.com', AES_ENCRYPT('iHateWork2020','mySecretKey1'), @last_id_in_address, '933151554', '393496843', 9, 1, 0, NULL);
COMMIT; 

-- add a new user account with a unique email address as a transaction 
START TRANSACTION;
    INSERT INTO `address` (`AddressID`, `AddressTypeId`, `AddressLine1`, `AddressLine2`, `Town/City`, `County`, `CountryID`, `Postcode`) VALUES (NULL, 1, '374 Lethal street', NULL, 'South Belfast', 'Belfast', 6, 'BT88 123'); 

    SET @last_id_in_address = LAST_INSERT_ID(); 

    INSERT INTO `user_account` (`UserAccountID`, `TitleID`, `UserFirstName`, `UserLastName`, `EmailAddress`, `AccountPassword`, `AddressID`, `PrimaryPhoneNumber`, `AlternatePhoneNumber`, `InternationalDialCode`, `EJOffers`, `PartnerOffers`, `EJPlusNumber`) VALUES (NULL, 1, 'Seamus', 'Heaney', 'seamus@gmail.com', AES_ENCRYPT('iLovePoems2020','mySecretKey1'), @last_id_in_address, '2890445324', NULL, 9, '1', '1', NULL);
COMMIT; 

-- Show account information with its password decrypted - only to showcase encryption (hash + salt + pepper preferred)
SELECT UserFirstName AS `First Name`, UserLastName as `Surname`, `AccountPassword` AS `Encrypted password`, AES_DECRYPT(AccountPassword, 'mySecretKey1') AS `Password` from user_account WHERE `UserAccountID` = 35; 

-- select all departure locations 
SELECT DISTINCT AirportName AS `Departure Airport` FROM airport Right JOIN flight_route ON airport.AirportID = flight_route.DepartureAirportID; 

-- find an outgoing flight date; 
SELECT DepartureDate AS `Outgoing flight Available Dates` FROM `flight_schedule` WHERE `FlightRouteID` = 1; 

-- find a return flight date; 
SELECT DepartureDate AS `Return flight Available Dates` FROM `flight_schedule` WHERE `FlightRouteID` = 2; 

-- get the departure date, times and costs from the flight schedule table for outgoing flight 
SELECT `DepartureDate`,`DepartureTime`,`ArrivalTime`,`Cost` FROM flight_schedule WHERE  `FlightRouteID` = 1; 

-- get the departure date, times and costs from the flight schedule table for return flight 
SELECT `DepartureDate`,`DepartureTime`,`ArrivalTime`, `Cost` FROM flight_schedule WHERE  `FlightRouteID` = 2; 

-- get the departure date, times and costs from the flight schedule table. 
SELECT `DepartureDate`,`DepartureTime`,`ArrivalTime`,`Cost` FROM flight_schedule WHERE  `FlightRouteID` = 1 LIMIT 3; 

-- get departure date, times and costs from the flight schedule for the return leg of the journey 
SELECT `DepartureDate`,`DepartureTime`,`ArrivalTime`, `Cost` FROM flight_schedule WHERE  `FlightRouteID` = 2 LIMIT 3; 

-- query hold luggage and online pricing only (not airport pricing). 
SELECT BaggageTypeName AS `Hold Luggage Types`, OnlineMinUnitPrice AS `Price` FROM baggage_type WHERE BaggageTypeName LIKE 'hold_%'; 

-- query sports luggage and online pricing only (not airport pricing). 
SELECT BaggageTypeName AS `Sports Luggage Types`, OnlineMinUnitPrice AS `Price` FROM baggage_type WHERE BaggageTypeName LIKE 'sports_%'; 

-- Update an entire booking details in one transaction.  This assumes the payment confirmation is received from an external vendor.  We want the entire booking updated in the database in one transaction, not bits and pieces of data here and there – 9 total tables updated in one transaction. 
START TRANSACTION; 

    -- ADD PAYMENT INFO into payment table 
    INSERT INTO `payment` (`PaymentID`, `PaymentTypeID`, `PaymentDateTime`, `PaymentVendorReference`, `CurrencyID`, `UserCurrencyCost`) VALUES (NULL, 6, NOW(), 'MC4553-4542', 2, '280.94'); 

    SET @last_id_in_payment = LAST_INSERT_ID();  

    -- derive user_Account information and store in variables for re-use based on the email address within the user account as this is a unique parameter. 

    SET @user_title = (SELECT TitleID FROM user_account WHERE user_account.EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_first_name = (SELECT user_account.UserFirstName FROM user_account WHERE EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_last_name = (SELECT user_account.UserLastName FROM user_account WHERE EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_account_address = (SELECT user_account.addressID FROM user_account LEFT JOIN address ON address.AddressID = user_account.AddressID WHERE EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_telephone_number = (SELECT user_account.PrimaryPhoneNumber FROM user_account WHERE EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_international_dial_code = (SELECT InternationalDialCode FROM user_account WHERE user_account.EmailAddress = 'm.garcia23@outlook.com'); 
    SET @user_easyjetPlus_number = (SELECT EJPlusNumber FROM user_account WHERE user_account.EmailAddress = 'm.garcia23@outlook.com'); 

    -- insert a bookers details into the booking table: 
    INSERT INTO `booker` (`BookerID`, `TitleID`, `BookerFirstName`, `BookerLastName`, `EmailAddress`, `AddressID`, `TelephoneNumber`, `InternationalDialCode`, `EJPlusNumber`) VALUES (NULL, @user_title, @user_first_name, @user_last_name, 'maria.garcia@work.co.esp', @user_account_address, @user_telephone_number, @user_international_dial_code, @user_easyjetPlus_number); 

    SET @last_booker_id = LAST_INSERT_ID(); 

    --  INSERT A BOOKINGS DETAILS into booking table: 
    INSERT INTO `booking` (`BookingID`, `BookingReference`, `BookingDateTime`, `BookerID`) VALUES (NULL, 'GS4JGDN', NOW(), @last_booker_id); 

    -- Save the booking reference into a var to insert into line item table  
    SET @last_booking_id = LAST_INSERT_ID(); 

    -- record all purchased items into the transaction line items table, AND the revenue table (to record) prices in the transaction line item table - for receipts and invoices. this is done per line item, alternating between tables to keep using the same variable name throughout the query 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Flight - Belfast to Barcelona - 1 Adult', '86.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '86.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Flight - Belfast to Barcelona - 1 Infant', '25.00', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '25.00'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Flight - Barcelona to Belfast - 1 Adult', '56.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '56.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Flight - Barcelona to Belfast - 1 Infant', '25.00', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '25.00'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Luggage - hold bag 15kg', '15.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '15.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Luggage - hold bag 15kg', '15.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '15.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Luggage - hold bag 23kg', '23.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '23.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Luggage - hold bag 23kg', '23.99', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID(); 

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '23.99'); 

    INSERT INTO `transaction_line_items` (`TransactionLineItemID`, `BookingID`, `ItemDescription`, `UserCurrencyCost`, `CurrencyID`, `PaymentID`) VALUES (NULL, @last_booking_id, 'Food Voucher - Large - Belfast to Barcelona', '7.00', 2, @last_id_in_payment); 

    SET @last_transaction_line_item = LAST_INSERT_ID();

    INSERT INTO `revenue` (`RevenueID`, `TransactionLineItemID`, `RevenueInEuro`) VALUES (NULL, @last_transaction_line_item, '7.00'); 

    -- insert all passengers (1 passenger = 1 person on 1 schedule & route): 

    INSERT INTO `passenger` (`PassengerID`, `TitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerAgeID`, `PassengerTypeID`, `ReasonForTravel`, `BookingID`, `PassportID`, `CheckedIn`, `SeatID`, `EJPlusNumber`, `IsFlexiFare`) VALUES (NULL, 3, 'Anna', 'McKay', 18, 1, 'Leisure', @last_booking_id, NULL, 0, 27, NULL, 0); 

    SET @passenger_first_leg = LAST_INSERT_ID(); 

    INSERT INTO `passenger` (`PassengerID`, `TitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerAgeID`, `PassengerTypeID`, `ReasonForTravel`, `BookingID`, `PassportID`, `CheckedIn`, `SeatID`, `EJPlusNumber`, `IsFlexiFare`) VALUES (NULL, 3, 'Katie', 'McKay', 1, 3, 'Leisure', @last_booking_id, NULL, 0, 27, NULL, 0);  

    INSERT INTO `passenger` (`PassengerID`, `TitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerAgeID`, `PassengerTypeID`, `ReasonForTravel`, `BookingID`, `PassportID`, `CheckedIn`, `SeatID`, `EJPlusNumber`, `IsFlexiFare`)  VALUES (NULL, 3, 'Anna', 'McKay', 18, 1, 'Leisure', @last_booking_id, NULL, 0, 28, NULL, 0); 

    SET @passenger_return_leg = LAST_INSERT_ID(); 

    INSERT INTO `passenger` (`PassengerID`, `TitleID`, `PassengerFirstName`, `PassengerLastName`, `PassengerAgeID`, `PassengerTypeID`, `ReasonForTravel`, `BookingID`, `PassportID`, `CheckedIn`, `SeatID`, `EJPlusNumber`, `IsFlexiFare`)  

    VALUES (NULL, 3, 'Katie', 'McKay', 1, 3, 'Leisure', @last_booking_id, NULL, 0, 28, NULL, 0);  

    -- update passenger baggage table 
    INSERT INTO `passenger_baggage` (`PassengerBaggageId`, `BaggageTypeID`, `PassengerID`) VALUES (NULL, 1, @passenger_first_leg), (NULL, 2, @passenger_first_leg), (NULL, 1, @passenger_return_leg), (NULL, 2, @passenger_return_leg); 

    -- Update the passenger food table 
    INSERT INTO `passenger_food` (`PassengerFoodID`, `PassengerID`, `FoodID`) VALUES (NULL, @passenger_first_leg, 1); 

    -- update special assistance table with nut allergy 
    INSERT INTO `passenger_special_assistance` (`PassengerSpecialAssistanceID`, `PassengerID`, `SpecialAssistanceID`) VALUES (NULL, @passenger_first_leg, 6), (NULL, @passenger_return_leg, 6); 
COMMIT;


-- check in all passengers on a booking using a transaction to ensure either all passengers are checked in, or none are.
START TRANSACTION; 
    -- find the passengers seat for a particular scheduled flight and store into a variable. 
    SET @seat_id_outbound_flight_passenger1 = (SELECT seat.SeatID FROM passenger INNER JOIN seat ON passenger.SeatID = seat.SeatID 

    INNER JOIN flight_schedule ON flight_schedule.FlightScheduleID = seat.FlightScheduleID WHERE flight_schedule.FlightScheduleID = "10" AND PassengerFirstName = "Anna"); 

    SET @seat_id_outbound_flight_passenger2 = (SELECT seat.SeatID FROM passenger INNER JOIN seat ON passenger.SeatID = seat.SeatID 

    INNER JOIN flight_schedule ON flight_schedule.FlightScheduleID = seat.FlightScheduleID WHERE flight_schedule.FlightScheduleID = "10" AND PassengerFirstName = "Katie"); 

    SET @seat_id_return_flight_passenger1 = (SELECT seat.SeatID FROM passenger INNER JOIN seat ON passenger.SeatID = seat.SeatID 

    INNER JOIN flight_schedule ON flight_schedule.FlightScheduleID = seat.FlightScheduleID WHERE flight_schedule.FlightScheduleID = "21" AND PassengerFirstName = "Anna"); 

    SET @seat_id_return_flight_passenger2 = (SELECT seat.SeatID FROM passenger INNER JOIN seat ON passenger.SeatID = seat.SeatID 

    INNER JOIN flight_schedule ON flight_schedule.FlightScheduleID = seat.FlightScheduleID WHERE flight_schedule.FlightScheduleID = "21" AND PassengerFirstName = "Katie"); 

    -- find all unique passenger IDs for all legs of the journey based on their seatIDs set in variables above 
    SET @passenger1_route1 = (SELECT PassengerID from passenger INNER JOIN booking on passenger.BookingID = booking.BookingID  WHERE booking.BookingReference = "GS4JGDN" AND passenger.PassengerFirstName = "Anna" AND passenger.SeatID = @seat_id_outbound_flight_passenger1); 

    SET @passenger2_route1 = (SELECT PassengerID from passenger INNER JOIN booking on passenger.BookingID = booking.BookingID  WHERE booking.BookingReference = "GS4JGDN" AND passenger.PassengerFirstName = "Katie" AND passenger.SeatID = @seat_id_outbound_flight_passenger2); 

    SET @passenger1_route2 = (SELECT PassengerID from passenger INNER JOIN booking on passenger.BookingID = booking.BookingID  WHERE booking.BookingReference = "GS4JGDN" AND passenger.PassengerFirstName = "Anna" AND passenger.SeatID = @seat_id_return_flight_passenger1); 

    SET @passenger2_route2 = (SELECT PassengerID from passenger INNER JOIN booking on passenger.BookingID = booking.BookingID  
    WHERE booking.BookingReference = "GS4JGDN" AND passenger.PassengerFirstName = "Katie" AND passenger.SeatID = @seat_id_return_flight_passenger2); 

    -- update all passenger ID's to be checked in 
    UPDATE `passenger` SET `CheckedIn` = '1' WHERE `passenger`.`PassengerID` = @passenger1_route1; 
    UPDATE `passenger` SET `CheckedIn` = '1' WHERE `passenger`.`PassengerID` = @passenger2_route1; 
    UPDATE `passenger` SET `CheckedIn` = '1' WHERE `passenger`.`PassengerID` = @passenger1_route2; 
    UPDATE `passenger` SET `CheckedIn` = '1' WHERE `passenger`.`PassengerID` = @passenger2_route2; 

COMMIT; 

-- show a passenger the key details of their travel from one booking reference 
SELECT booking.BookingReference, passenger.PassengerFirstName AS `First Name`, passenger.PassengerLastName AS `Last Name`, seat.SeatNumber AS `Seat Number`, flight_schedule.DepartureDate, flight_schedule.DepartureTime,flight_route.RouteName, flight_route.EstimatedDuration 
FROM booking INNER JOIN passenger on passenger.BookingID = booking.BookingID INNER JOIN seat ON passenger.SeatID = seat.SeatID INNER JOIN flight_schedule ON seat.FlightScheduleID = flight_schedule.FlightScheduleID INNER JOIN flight_route ON flight_route.FlightRouteID = flight_schedule.FlightRouteID WHERE booking.BookingReference = "AX3TVEC"; 

-- show a booker all items they purchased for one booking reference 
SELECT ItemDescription AS `Item`, UserCurrencyCost AS `Cost` FROM transaction_line_items INNER JOIN booking ON transaction_line_items.BookingID = booking.BookingID WHERE booking.BookingReference = "GS4JGDN";  

-- show a booker the total amount paid in their own currency for one booking 
SELECT SUM(UserCurrencyCost) AS `Total Cost` FROM transaction_line_items INNER JOIN booking ON transaction_line_items.BookingID = booking.BookingID WHERE booking.BookingReference = "GS4JGDN";  

-- show a booker the card type that they used for the payment 
SELECT DISTINCT payment_type.PaymentType  
FROM payment_type INNER JOIN payment ON payment_type.PaymentTypeID = payment.PaymentTypeID  
INNER JOIN transaction_line_items ON transaction_line_items.PaymentID = payment.PaymentID 
INNER JOIN booking ON transaction_line_items.BookingID = booking.BookingID 
WHERE booking.BookingReference = "GS4JGDN"; 

-- show a booker all their FUTURE bookings, along with the route, passengers, date, time and booking reference. 
SELECT passenger.PassengerFirstName AS `First Name`, passenger.PassengerLastName AS `Surname`, flight_route.RouteName, flight_schedule.DepartureDate, flight_schedule.DepartureTime, booking.BookingReference 
FROM booker INNER JOIN booking ON booker.BookerID = booking.BookerID  
INNER JOIN passenger ON passenger.BookingID = booking.BookingID 
INNER JOIN seat ON seat.SeatID = passenger.SeatID  
INNER JOIN flight_schedule ON flight_schedule.FlightScheduleID = seat.FlightScheduleID 
INNER JOIN flight_route ON flight_route.FlightRouteID = flight_schedule.FlightScheduleID 
WHERE flight_schedule.DepartureDate > NOW()  
AND booker.EmailAddress = "weedavy42@gmail.co.uk"  
ORDER BY flight_schedule.DepartureDate ASC; 

-- query totals seats available on a flight based on the aircraft allocated to that route 
Select TotalSeats from aircraft INNER JOIN flight_route on aircraft.AircraftID = flight_route.FlightRouteID 
INNER JOIN flight_schedule ON flight_schedule.FlightRouteID = flight_route.FlightRouteID 
WHERE flight_schedule.FlightScheduleID = 7; 

-- find out total seats sold by querying total number of passengers who are not infants (as infants must seat share with an adult as per easyjet policy) 
SELECT COUNT(PassengerID) AS `Total Seats Sold` FROM passenger INNER join seat ON passenger.SeatID = seat.SeatID 
INNER JOIN flight_schedule on seat.FlightScheduleID = flight_schedule.FlightScheduleID 
WHERE flight_schedule.FlightScheduleID = 7 AND passenger.PassengerAgeID > 1; 