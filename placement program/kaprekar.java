public class kaprekar {
    public static void main(String[] args) {
        int num = 45;
        int square = num * num;

        int digit = 0;
        int temp = num;


        while (temp > 0) {
            digit++;
            temp /= 10;
        }

        int divisor = (int) Math.pow(10, digit);
        int leftPart = square / divisor;
        int rightPart = square % divisor;

        if (leftPart + rightPart == num) {
            System.out.println(num + " is a kaprekar number");
        } else {
            System.out.println(num + " is not kaprekar number");
        }
    }
}
