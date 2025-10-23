import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // User input for the number of overs
        System.out.print("Enter the number of overs: ");
        int numOvers = scanner.nextInt();
        int totalBalls = numOvers * 6;
        scanner.nextLine();  // Consume the leftover newline

        // Declare array to represent balls in multiple overs
        String[] balls = new String[totalBalls + 100];  // Increased size to account for extra balls

        // Variable
        int totalRuns = 0;
        int totalWickets = 0;
        int totalNoBalls = 0;
        int totalWideBalls = 0;
        int totalExtraRuns = 0;
        int validBall = 0;
        boolean freeHit = false;

        // Loop through all balls until the number of validball  balls equals the total balls
        for (int i = 0; validBall < totalBalls; i++) {
            if (totalWickets >= 10) {
                System.out.println("Match is finished. All players is Out............................");
                break;
            }

            System.out.print("Ball " + (validBall + 1) + ": Enter Run (W for Wicket, N for No-ball, WB for Wide-ball, or runs 0-6): ");
            String input = scanner.next().toUpperCase();  // Convert input to uppercase

            // Validate input (W, N, WB, or numbers 0-6 for runs)
            while (!input.equals("W") && !input.equals("N") && !input.equals("WB") && !isValidRun(input)) {
                System.out.print("Invalid input. Please enter W (Wicket), N (No-ball), WB (Wide-ball), or a number between 0 and 6 for runs: ");
                input = scanner.next().toUpperCase();
            }

            // Store the result in the array
            balls[i] = input;

            // Update the counters based on input
            switch (input) {
                case "W":
                    if (freeHit) {
                        System.out.println("Free hit! Wicket not counted.");
                    } else {
                        totalWickets++;
                    }
                    validBall++;  // Wicket counts as a valide  ball
                    freeHit = false;  // Reset free hit after any ball
                    break;
                case "N":
                    totalNoBalls++;
                    totalRuns++;  // Add 1 extra run for no-ball
                    totalExtraRuns++;  // Count the extra run for no-ball
                    freeHit = true;  // Next ball will be a free hit
                    System.out.print("Enter the runs scored on this no-ball (0-6): ");
                    int noBallRuns = getValidRun(scanner);  // Ensure valid run input for no-ball
                    totalRuns += noBallRuns;  // Add the runs scored on the no-ball
                    totalExtraRuns += noBallRuns;  // Count the runs scored on the no-ball as extra runs
                    balls[i] = "N " + noBallRuns;  // Update the array with no-ball and its runs
                    break;  // No legitimate ball added for no-ball
                case "WB":
                    totalWideBalls++;
                    totalRuns++;  // Add 1 extra run for wide-ball
                    totalExtraRuns++;  // Count the extra run for wide-ball
                    System.out.print("Enter the runs scored on this wide-ball (0-6): ");
                    int wideBallRuns = getValidRun(scanner);  // Ensure valid run input for wide-ball
                    totalRuns += wideBallRuns;  // Add the runs scored on the wide-ball
                    totalExtraRuns += wideBallRuns;  // Count the runs scored on the wide-ball as extra runs
                    balls[i] = "WB " + wideBallRuns;  // Update the array with wide-ball and its runs
                    break;  // No legitimate ball added for wide-ball
                default:
                    totalRuns += Integer.parseInt(input);  // If it's a valid run, add to total runs
                    validBall++;  // Legitimate ball counts towards the total
                    freeHit = false;  // Reset free hit after any ball
            }

            // Check if the over is completed and print  over summary
            if (validBall % 6 == 0 && validBall != 0) {
                System.out.println("\nEnd of Over " + (validBall / 6) + " Summary:");
                int overRuns = 0;

                // Print the details for each ball in the over
                for (int j = validBall - 6; j < validBall; j++) {
                    String ballOutcome = balls[j];
                    System.out.println("Ball " + (j + 1) + ": " + ballOutcome);

                    // Calculate the runs for the ball (including no-balls and wide-balls)
                    if (ballOutcome.startsWith("WB") || ballOutcome.startsWith("N")) {
                        // Extract the runs after "WB" or "N"
                        overRuns += Integer.parseInt(ballOutcome.split(" ")[1]);
                    } else if (isValidRun(ballOutcome)) {
                        overRuns += Integer.parseInt(ballOutcome);  // Add normal ball runs
                    }
                }

                // Display the summary for the over
                System.out.println("Runs in this over: " + overRuns);
                System.out.println();
            }
        }

        // Output the overall match summary
        System.out.println("\nMatch Summary:");
        System.out.println("Total Wickets: " + totalWickets);
        System.out.println("Total No-balls: " + totalNoBalls);
        System.out.println("Total Wide-balls: " + totalWideBalls);
        System.out.println("Total Extra Runs: " + totalExtraRuns);  // Display total extra runs from no-balls and wide-balls
        System.out.println("Total Runs: " + totalRuns);
        //
    }

    //  method to check if the input is  run 0-6
    public static boolean isValidRun(String input) {
        try {
            int run = Integer.parseInt(input);  // Try to convert input to an integer
            return run >= 0 && run <= 6;        // Check  between 0 and 6
        } catch (NumberFormatException e) {
            return false;  // If input is not number to return false
        }
    }

    //  method to get valid run input 0-6
    public static int getValidRun(Scanner scanner) {
        int run = -1;
        while (run < 0 || run > 6) {  // Adjusted the condition to allow 0
            try {
                run = scanner.nextInt();  // Try to get the run as an integer
                if (run < 0 || run > 6) {
                    System.out.print("Invalid input. Enter a number between 0 and 6: ");
                }
            } catch (Exception e) {
                System.out.print("Invalid input. Enter a number between 0 and 6: ");
                scanner.next();  // Clear invalid input
            }
        }
        return run;  // Return the valid run input
    }
}
