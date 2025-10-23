import java.util.Scanner;

public class pali {
    public static void main(String[] args) {
        // Create a Scanner object for input
        Scanner scanner = new Scanner(System.in);

        // Ask the user to input a number
        System.out.print("Enter a number: ");
        int number = scanner.nextInt();

        // Store the original number for later comparison
        int originalNumber = number;
        int reversedNumber = 0;

        // Reverse the number
        while (number != 0) {
            int digit = number % 10; // Extract the last digit
            reversedNumber = reversedNumber * 10 + digit; // Build the reversed number
            number /= 10; // Remove the last digit
        }

        // Check if the original number is equal to the reversed number
        if (originalNumber == reversedNumber) {
            System.out.println(originalNumber + " is a palindrome.");
        } else {
            System.out.println(originalNumber + " is not a palindrome.");
        }

        // Close the scanner
        scanner.close();
    }
}
