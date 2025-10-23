import  java.util.*;

public class lab_4_pro_1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("enter second  hare : ");
        int second = scanner.nextInt();

        int hours = second / 3600;
        int minutes = (second % 3600) / 60;
        int seconds = second % 60;


        System.out.printf("%02d:%02d:%02d\n", hours, minutes, seconds);


    }
}
