public class date_11_08_java {
    public static void main(String[] args) {
        int n = 7;
        System.out.println(ugly(n));
    }

    public static boolean ugly(int num) {
        if (num <= 0) {
            return false;
        }

        while (num % 2 == 0) {
            num /= 2;
        }
        while (num % 3 == 0) {
            num /= 3;
        }
        while (num % 5 == 0) {
            num /= 5;
        }

        return num == 1;
    }
}
