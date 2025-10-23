
import java.util.Scanner;

public  class array{

    public static void main(String[] args) {
        
        // int arr[] = {10,20,30,40,50};

        // System.out.println(arr[0]);
        // System.out.println(arr[1]);
        // System.out.println(arr[2]);
        // System.out.println(arr[3]);
        // System.out.println(arr[4]);

        Scanner ss=new Scanner(System.in);

        System.out.print("enter number : ");
        int n = ss.nextInt();

        //create array to get number in this 

        int [] number = new int[n];

        //input values insert in array 

        System.out.println("enter" + n + "number ");    
        for(int i = 0 ; i<n; i++ ){
            number [i] = ss.nextInt();
            }

            // print the value to entre in  araay 

          int sum = 0;
        for (int i = 0; i < n; i++) {
            sum += number[i];  // Add each element to the sum
        }

        // Print the sum of the elements
        System.out.println("The sum of the elements is: " + sum);

    }
}