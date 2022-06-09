Feature: Update certificate Subject Alternative Name
  Scenario: Add Subject Alternative Name
    Given I use a fixture named "legacy"
    When I successfully run `puppet-renew-certificate --ssldir ssldir --yes --subject-alternative-name puppet.example.com,another.example.com ssldir/ca/ca_crt.pem`
    Then the CA should be valid
    And the CA should be valid for "puppet.example.com"
    And the CA should be valid for "another.example.com"
