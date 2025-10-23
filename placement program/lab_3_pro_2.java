import java.util.Scanner;

public class lab_3_pro_2 {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("enter hour (1-12): ");
        int hour = scanner.nextInt();

        System.out.print("enter minute (0-59): ");
        int minute = scanner.nextInt();

        hour = hour % 12;

        double hourAngle = (hour * 30) + (minute * 0.5);
        double minuteAngle = minute * 6;
        double angle = Math.abs(hourAngle - minuteAngle);
        angle = Math.min(angle, 360 - angle);

        System.out.println("angle between hour and minute hand: " + angle + " degree");
    }
}
