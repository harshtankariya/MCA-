import java.util.Arrays;

public class lab_8_pro_B2 {
    public static void main(String[] args) {
        System.out.println("numbers divisible 7 but not  5 between 100 and 200:");

        for (int i = 101; i < 200; i++) {

            if (i % 7 == 0 && i % 5 != 0) {

                System.out.println(i);
            }

        }


        int num = 1;

        System.out.println("50 number in series :--> " );

        for(int i = 1 ; i <= 50 ; i++){
            System.out.println(num+ " ");
            num += 3;
        }


    }
}
