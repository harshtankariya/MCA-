import java.util.Arrays;
import java.util.Scanner;
public class pro_2_07_07_2025 {

    public static boolean areAnagrams(String s1, String s2) {

        s1 = s1.replaceAll("\\s", "").toLowerCase();
        s2 = s2.replaceAll("\\s", "").toLowerCase();


        if (s1.length() != s2.length()) {
            return false;
        }


        char[] arr1 = s1.toCharArray();
        char[] arr2 = s2.toCharArray();


        Arrays.sort(arr1);
        Arrays.sort(arr2);


        return Arrays.equals(arr1, arr2);
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("enter first string: ");
        String s1 = sc.nextLine();

        System.out.print("enter second string: ");
        String s2 = sc.nextLine();

        if (areAnagrams(s1, s2)) {
            System.out.println(" strings are anagrams.");
        } else {
            System.out.println(" strings are NOT anagrams.");
        }


    }
}
