Feature: Delete Booking
  Background:
    * def responseOfCreateBooking = call read("classpath://feature/createBooking.feature")
    * def responseOfCreateToken = call read("classpath://feature/createToken.feature")
  Scenario: Delete Booking scenario
    Given url 'https://restful-booker.herokuapp.com'
    And path '/booking/'+responseOfCreateBooking.response.bookingid
    And header Cookie = 'token='+responseOfCreateToken.response.token
    And method delete
    Then status 201
    And print response