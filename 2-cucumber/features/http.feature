Feature: Web redirects

  Scenario Outline:
    Given the http URL "<http_url>"

    When a request is made
    Then the response http_code should be "<http_code>"
    And I should be redirected to "<redirect_url>"

    Examples:

      | http_url                           | http_code | redirect_url           |
      | http://www.scredible.com/          | 302       | https://scredible.com/ |
      | https://www.scredible.com/         | 302       | https://scredible.com/ |
      | http://scredible.com/              | 302       | https://scredible.com/ |
      | https://scredible.com/             | 200       | <nowhere>              |