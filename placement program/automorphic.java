public class automorphic {
    public static void main(String[] args) {
        int num = 24;
        System.out.println(auto(num));
    }

    public static boolean auto(int num) {
        int square = num * num;
        String numStr = String.valueOf(num);
        String squareStr = String.valueOf(square);

        return squareStr.endsWith(numStr);
    }
}
