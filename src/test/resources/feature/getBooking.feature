Feature: Get Booking
  Background:
    * def responseOfCreateBooking = call read("classpath://feature/createBooking.feature")
  Scenario: Get booking scenario
    Given url host
    And path '/booking/'+responseOfCreateBooking.response.bookingid
    And header Content-type = "application/json"
    And header Accept = "application/json"
    And method get
    Then status 200
    And print response