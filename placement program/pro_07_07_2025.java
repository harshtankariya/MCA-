import java.util.Scanner;

public class pro_07_07_2025 {

    public static int[] merge(int[] a, int[] b) {
        int m = a.length, n = b.length;
        int[] merged = new int[m + n];
        int i = 0, j = 0, k = 0;

        while (i < m && j < n) {
            if (a[i] < b[j]) {
                merged[k++] = a[i++];
            } else {
                merged[k++] = b[j++];
            }
        }

        while (i < m) {
            merged[k++] = a[i++];
        }

        while (j < n) {
            merged[k++] = b[j++];
        }

        return merged;
    }

    public static int findk(int[] a, int[] b, int k) {
        int i = 0, j = 0, count = 0;

        while (i < a.length && j < b.length) {
            if (a[i] < b[j]) {
                count++;
                if (count == k) {
                    return a[i];
                }
                i++;
            } else {
                count++;
                if (count == k) {
                    return b[j];
                }
                j++;
            }
        }

        while (i < a.length) {
            count++;
            if (count == k) {
                return a[i];
            }
            i++;
        }

        while (j < b.length) {
            count++;
            if (count == k) {
                return b[j];
            }
            j++;
        }

        return -1;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);


        System.out.print("enter size of first array: ");
        int m = sc.nextInt();
        int[] a = new int[m];
        System.out.print("enter elements of first sorted array: ");
        for (int i = 0; i < m; i++) {
            a[i] = sc.nextInt();
        }


        System.out.print("enter size of second array: ");
        int n = sc.nextInt();
        int[] b = new int[n];
        System.out.print("enter elements of second sorted array: ");
        for (int i = 0; i < n; i++) {
            b[i] = sc.nextInt();
        }


        System.out.print("enter value of k: ");
        int k = sc.nextInt();

        int[] merged = merge(a, b);
        System.out.print("merge sorted array: ");
        for (int val : merged) {
            System.out.print(val + " ");
        }
        System.out.println();

        int result = findk(a, b, k);
        System.out.println("the " + k + "th element is: " + result);


    }
}
