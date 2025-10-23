//1 + 4 + 9 + 16 + 25 + 36
import java.util.*;
public class lab_8_pro_C1 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        System.out.print("enter value of n: ");
        int n = sc.nextInt();
        int sum =0 ;

        System.out.print("series: ");
        for (int i = 1; i <= n; i++) {
            int s = i * i;
            sum += s;


            if (i != n) {
                System.out.print(s + " + ");
            } else {
                System.out.print(s);
            }
        }

        System.out.println("\n sum of series: " + sum);
        }
}
