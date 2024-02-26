@feature1
Feature: example karate scenarios

  Background:
    * url 'https://jsonplaceholder.typicode.com'

    Scenario: get all users
      Given path 'users'
      When method GET
      Then status 200
      * print "response all users:::", response
      * match response[*].name contains "Ervin Howell"

