import java.util.Scanner;

public class looping {
    public static void main(String[] args) {
        Scanner sss = new Scanner(System.in);

        // Prompt user for input
        System.out.println("Enter number of rows: ");
        int row = sss.nextInt();

        // Loop for each row
        for (int i = 1; i <= row; i++) {

            // Print spaces before stars
            for (int j = i; j < row; j++) {
                System.out.print(" ");  // Use print instead of println to stay on the same line
            }

            // Print stars
            for (int j = 1; j <= (2 * i - 1); j++) {
                System.out.print("*");  // Print stars in the same row
            }

            // Move to the next line after printing stars
            System.out.println();
        }

        sss.close();  // Close the scanner
    }
}
