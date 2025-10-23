//        - Basic Salary >= 10000 : HRA = 20% of basic, DA = 80% of basic
//        - Basic Salary >= 20000 : HRA = 25% of basic, DA = 90% of basic
//        - Basic Salary >= 30000 : HRA = 30% of basic, DA = 95% of basic
import java.util.Scanner;
public class lab_5_pro_1 {
    public static void main(String[] args) {
        Scanner myObj = new Scanner(System.in);
        System.out.println("enter salary ");
        int salary = myObj.nextInt();
        if (salary >= 10000) {
            double total_salary = salary * 0.20;
            double da = salary * 0.80;
            double final_salary =salary+total_salary+da;
            System.out.println("Total salary : " +final_salary);
        }
        else if (salary >= 20000) {
            double total_salary = salary * 0.25;
            double da = salary * 0.90;
            double final_salary =salary+total_salary+da;
            System.out.println("Total salary : " +final_salary);
          }
        else if (salary >= 30000) {
            double total_salary = salary * 0.30;
            double da = salary * 0.95;
            double final_salary =salary+total_salary+da;
            System.out.println("Total salary : " +final_salary);

        }

        else {
            System.out.println("else part ");
        }
    }
}
