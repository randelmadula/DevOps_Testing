@isTest
public class BadCodeAnalyzerExample5Test {
    
    @isTest
    static void testUpdateAccounts() {
        // Create test data
        Account acc1 = new Account(Name = 'Test Account 1');
        Account acc2 = new Account(Name = 'Test Account 2');
        insert new List<Account>{ acc1, acc2 };

        // Call method under test
        Test.startTest();
        BadCodeAnalyzerExample5.updateAccounts(
            new List<Id>{ acc1.Id, acc2.Id }, 
            'Updated Name'
        );
        Test.stopTest();

        // Query updated records
        List<Account> updatedAccs = [
            SELECT Id, Name
            FROM Account
            WHERE Id IN :new List<Id>{ acc1.Id, acc2.Id }
        ];

        // Assertions
        for (Account acc : updatedAccs) {
            System.assertEquals('Updated Name', acc.Name, 'Account name should be updated');
        }
    }

    @isTest
    static void testEmptyInputs() {
        Test.startTest();
        BadCodeAnalyzerExample5.updateAccounts(new List<Id>(), 'New Name');
        BadCodeAnalyzerExample5.updateAccounts(null, 'New Name');
        BadCodeAnalyzerExample5.updateAccounts(new List<Id>(), null);
        Test.stopTest();

        // No exceptions should occur, nothing updated
        System.assert(true, 'Method should handle empty inputs gracefully');
    }
}