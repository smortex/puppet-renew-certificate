Feature: Renew certifitate
  Scenario: Renew for 5 years
    Given I use a fixture named "legacy"
    When I successfully run `puppet-renew-certificate --ssldir ssldir --yes ssldir/ca/ca_crt.pem`
    Then the CA should be valid
    And the serial should be 53
