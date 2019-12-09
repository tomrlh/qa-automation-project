Story: Withdraw in Cash Machine
    Being a client that is account holder from Ninja Bank
    I can withdraw money
    To buy in places that not accept debit or credit

Scenario: Withdraw in current account
    Given I have R$1000 in my current account
    When I perform a withdraw of R$200
    Then my final balance should be R$800

Scenario: Balance is empty
    Given I have R$0 in my current account
    When I perform a withdraw of R$100
    Then I see a message saying "Balance is insuficient"
    And my final balance should be R$0

Scenario: Not enough balance
    Given I have R$500 in my current account
    When I perform a withdraw of R$501
    Then I see a message saying "Balance is insuficient"
    And my final balance should be R$500

Scenario: Limit by withdraw
    Given I have R$1000 in my current account
    When I perform a withdraw of R$701
    Then I see a message saying "Transaction limit is R$700"
    And my final balance should be R$1000