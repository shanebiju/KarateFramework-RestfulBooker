Feature: Update Booking
  Background:
    * def responseOfCreateBooking = call read("classpath://feature//createBooking.feature")
    * def responseOfCreateToken = call read("classpath://feature//createToken.feature")
    * def body = read("classpath://json//update_booking.json")
  Scenario: Update Booking scenario
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/'+responseOfCreateBooking.response.bookingid
    And header Content-type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token='+responseOfCreateToken.response.token
    And request body
    And method put
    Then status 200
    And print response