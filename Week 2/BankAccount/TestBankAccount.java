public class TestBankAccount {
    public static void main(String[] args) {
        BankAccount bankAccount1 = new BankAccount(250.45, 50.25);
        BankAccount bankAccount2 = new BankAccount(565.02, 322.78);

        System.out.println(bankAccount1.getAccountNumber());
        
        System.out.println(BankAccount.getNumberAccounts());
        System.out.println(BankAccount.getTotalMoney());
        System.out.println("-------------------");

        System.out.println(bankAccount2.getCheckingBalance());
        bankAccount2.depositChecking(164.25);
        System.out.println(bankAccount2.getCheckingBalance());
        System.out.println(BankAccount.getTotalMoney());
        System.out.println("-------------------");

        System.out.println(bankAccount1.getSavingsBalance());
        bankAccount1.depositSavings(96.33);
        System.out.println(bankAccount1.getSavingsBalance());
        System.out.println(BankAccount.getTotalMoney());
        System.out.println("-------------------");

        bankAccount1.withdrawChecking(345.22);
        System.out.println(bankAccount1.getCheckingBalance());
        System.out.println(BankAccount.getTotalMoney());
        System.out.println("-------------------");

        bankAccount2.withdrawSavings(83.59);
        System.out.println(bankAccount2.getSavingsBalance());
        System.out.println(BankAccount.getTotalMoney());
        System.out.println("-------------------");

    }
}
