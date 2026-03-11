public class BadCodeAnalyzerExample2 {
    
    /**
     * Updates the names of Accounts based on provided Ids.
     * @param accountIds List of Account Ids to update
     * @param newName The new name to assign
     */
    public static void updateAccounts(List<Id> accountIds, String newName) {
        if (accountIds == null || accountIds.isEmpty() || String.isBlank(newName)) {
            return;
        }

        // Query all accounts in one go (no SOQL in loop, no hardcoded Ids)
        List<Account> accountsToUpdate = [
            SELECT Id, Name
            FROM Account
            WHERE Id IN :accountIds
        ];

        for (Account acc : accountsToUpdate) {
            acc.Name = newName;
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate; // Single DML outside loop
        }
    }
}