public class BadCodeAnalyzerExample2 {

    public static void updateAccounts() {

        // PMD: Avoid hardcoding Ids
        Id accId = '001000000000001AAA';

        // PMD: SOQL query without LIMIT
        List<Account> accs = [
            SELECT Id, Name
            FROM Account
        ];

        // PMD: SOQL inside loop
        for (Account a : accs) {

            Account singleAcc = [
                SELECT Id, Name
                FROM Account
                WHERE Id = :accId
            ];

            // PMD: DML inside loop
            singleAcc.Name = 'Updated Name';
            update singleAcc;
        }

        try {
            Integer x = 1 / 0;
        } catch (Exception e) {
            // PMD: Empty catch block
        }
    }
}