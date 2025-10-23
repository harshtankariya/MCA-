// import java.util.Scanner;

// public class prime {
//     public static void main(String[] args) {
//         int number = new Scanner(System.in).nextInt(); // Input number from user
//         boolean isPrime = number > 1;

//         for (int i = 2; i <= Math.sqrt(number) && isPrime; i++) {
//             isPrime = number % i != 0;  // If divisible, not prime
//         }

//         System.out.println(number + (isPrime ? " is a prime number." : " is not a prime number."));
//     }
// }

import java.util.Scanner;

public class prime  {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Input range from user
        
        int start = scanner.nextInt();
        int  end = scanner.nextInt();

        // Loop through each number in the range
        for (int i = start; i <= end; i++) {
            if (i > 1) {  // Prime numbers are greater than 1
                boolean isPrime = true;
                
                // Check if the number is prime
                for (int j = 2; j <= Math.sqrt(i); j++) {
                    if (i % j == 0) {
                        isPrime = false;
                        break;
                    }
                }
                
                // Print prime numbers
                if (isPrime) System.out.println(i);
            }
        }

        scanner.close();
    }
}
