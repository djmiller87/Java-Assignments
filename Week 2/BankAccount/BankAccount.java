import java.util.ArrayList;
import java.util.Random;


class BankAccount{
    private double checkingBalance = 0.0;
    private double savingsBalance = 0.0;
    private ArrayList<Integer> accountNumber;
    public static int numberAccounts = 0;
    public static double totalMoney = 0.0;
    public BankAccount(double checking, double savings){
        checkingBalance = checking;
        savingsBalance = savings;
        accountNumber = createAccountNumber();
        numberAccounts++;
        totalMoney += checking += savings;
    }
    private ArrayList<Integer> createAccountNumber(){
        Random randomNumber = new Random();
        ArrayList<Integer> bankAccounNumber = new ArrayList<Integer>();
        for(int i = 1; i <= 10; i++){
            int num = randomNumber.nextInt(10);
            bankAccounNumber.add(num);
        }
        return bankAccounNumber;
    }
    public String getAccountNumber(){
        String number = "";
        for(int i : accountNumber){
            number = number + String.valueOf(i);
        }
        return number;
    }
    public static int getNumberAccounts(){
        return numberAccounts;
    }
    public static double getTotalMoney(){
        return totalMoney;
    }
    public static void addTotalMoney(double money){
        totalMoney += money;
    }
    public static void subtractTotalMoney(double money){
        totalMoney -= money;
    }
    public double getCheckingBalance(){
        return checkingBalance;
    }
    public double getSavingsBalance(){
        return savingsBalance; 
    }
    public void depositChecking(double deposit){
        checkingBalance += deposit;
        addTotalMoney(deposit);;
    }
    public void depositSavings(double deposit){
        savingsBalance += deposit;
        addTotalMoney(deposit);;
    }
    public void withdrawChecking(double withdrawal){
        if((checkingBalance - withdrawal) > 0.0){
            checkingBalance -= withdrawal;
            subtractTotalMoney(withdrawal);
        }
        else{
            System.out.println("Not enough funds!Cannot complete transaction.");
        }
    }
    public void withdrawSavings(double withdrawal){
        if((savingsBalance - withdrawal) > 0.0){
            savingsBalance -= withdrawal;
            subtractTotalMoney(withdrawal);
        }
        else{
            System.out.println("Not enough funds!Cannot complete transaction.");
        }
    }
}