import java.util.Scanner;

public class stud {
    public static void main(String[] args) {
        // Create a Scanner object for input
        Scanner scanner = new Scanner(System.in);

        // Create an array to store marks for 5 subjects
        int[] marks = new int[5];

        // Ask the user to input marks for 5 subjects
        System.out.println("Enter the marks obtained in 5 subjects:");
        int totalMarks = 0;
        for (int i = 0; i < 5; i++) {
            System.out.print("Subject " + (i + 1) + ": ");
            marks[i] = scanner.nextInt();
            totalMarks += marks[i];  // Calculate the total marks
        }

        // Calculate the percentage
        float percentage = (float) totalMarks / 5;

        // Display the percentage
        System.out.println("Percentage: " + percentage + "%");

        // Determine the division based on the percentage
        if (percentage >= 60) {
            System.out.println("Division: First");
        } else if (percentage >= 50 && percentage <= 59) {
            System.out.println("Division: Second");
        } else if (percentage >= 40 && percentage <= 49) {
            System.out.println("Division: Third");
        } else {
            System.out.println("Division: Fail");
        }

        // Close the scanner
        scanner.close();
    }
}
