import java.util.*;
//Input electricity unit charge and calculate the total electricity bill according to the given
//condition:
//        - For ƒrst 50 units Rs. 0.50/unit
//- For next 100 units Rs. 0.75/unit
//- For next 100 units Rs. 1.20/unit
//- For unit above 250 Rs. 1.50/unit
//- An additional surcharge of 20% is added to the billimport  java.util.*;

public class lab_3_pro_1 {
    public static void main(String[] args) {
        Scanner myObj = new Scanner(System.in);
        System.out.println("Enter electricity unit");

        int unit = myObj.nextInt();
        if (unit <= 50) {
            double rupee = unit * 0.50;
            double charge = rupee * 0.20;
            double final_biil =charge+rupee;
            System.out.println("Total bill: " +final_biil);
        }
        else if (unit > 50 && unit <=100) {

            double rupee = 50 * 0.50 ;
            double unit_50_up = unit - 50;
            double final_rupee = rupee+unit_50_up * 0.75;
            double charge = final_rupee * 0.20;
            double final_biil =charge+final_rupee;
            System.out.println("Total bill: " +final_biil);
            System.out.println("else if first  " );
        }
        else if (unit > 100 && unit<=200) {
            double rupee = 50 * 0.50 ;
            double unit_50_up = unit - 100;
            double final_rupee = rupee+unit_50_up * 1.20;
            double charge = final_rupee * 0.20;
            double final_biil =charge+final_rupee;
            System.out.println("Total bill: " +final_biil);
            System.out.println("else if second  " );

        }
        else if ( unit>250) {
            double rupee = 50 * 0.50 ;
            double unit_50_up = unit - 200;
            double final_rupee = rupee+unit_50_up * 1.50;
            double charge = final_rupee * 0.20;
            double final_biil =charge+final_rupee;
            System.out.println("Total bill: " +final_biil);
            System.out.println("else if 3  " );

        }
        else {
            System.out.println("else part ");
        }
    }

}