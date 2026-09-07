
import java.util.Scanner;

public class Menu {
    public int Menu(){
        int ch;
        Scanner s = new Scanner(System.in);
        System.out.println("1. Week Checker");
        System.out.println("2. Traffic light Checker");
        System.out.println("3. Birth year calculator");
        System.out.println("4. text printer");
        System.out.println("5. Exit");
        System.out.println("Enter your Choice...");
        ch = s.nextInt();

        return ch;
    }
}