import java.util.Scanner;

public class lab_4_pro_2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("enter days  : ");
        int totalDays = scanner.nextInt();

        int year = totalDays / 365;
        int vadhela = totalDays % 365;

        int week = vadhela / 7;
        int day = vadhela % 7;

        System.out.println(totalDays + " day = " + year + " year , " + week + " week , and " + day + " day");
    }
}
