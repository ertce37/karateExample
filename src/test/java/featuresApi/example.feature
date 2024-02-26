Feature: example karate scenarios

  Background:
    Given url appUrl

  @feature1
Scenario: get all users and schema validation
    * def usersSchema = read('classpath:users/UsersSchema.json')
    Given path 'users'
    When method GET
    Then status 200
    * print "response all users:::", response
    * match each response == usersSchema


  @featureUserId
  Scenario: bring specific user id =5
    Given path 'users/5'
    When method GET
    Then status 200
    * print "response users id -> 5:::", response
    And match response.name == "Chelsey Dietrich"
    And match response.address.zipcode == "33263"
    And match response.company.name == "Keebler LLC"

    @createUser
    Scenario: create user
    Given path 'users'
    * def user = read('classpath:users/userRequest/createUserRequest.json')
    * set user.name = "Ertugrul"
    * set user.username = "QA Lead"
    * remove user.website
    * remove user.address.geo
    And request user
    When method POST
    Then status 201
    * print "response created user:::", response
    And match response.name == user.name
#    And match response == user
    And match response.id != null
    And match response.id == "#notnull"
    And match response.id == "#present"
    And match response.address.geo == "#notpresent"
#    And match response.website !contains {website:'#notnull'}




