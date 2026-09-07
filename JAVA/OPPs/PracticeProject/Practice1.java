
import java.util.Scanner;

public class Practice1 {

    public static void main(String[] args) {
        Menu menu = new Menu();
        Methods methods = new Methods();
        Scanner s = new Scanner(System.in);

        while (true) {
            int choice = menu.Menu();
            switch (choice) {
                case 1:
                    try {
                        if (choice < 1 || choice > 7) {
                            System.out.println("Enter Valid Week");
                        }
                        methods.WeekChecker();
                    } catch (Exception e) {
                        System.out.println("Internal Error");
                    }
                    break;
                case 2:
                    try {
                        System.out.println("Enter color for Traffic light: ");
                        String color = s.next();
                        methods.trafficLight(color);
                    } catch (Exception e) {
                        System.out.println("Internal Error");
                    }
                    break;
                case 3:
                    try {
                        System.out.println("Enter your birth year: ");
                        int year = s.nextInt();
                        methods.BirthYearCalculator(year);
                    } catch (Exception e) {
                        System.out.println("Internal Error");
                    }
                    break;
                case 4:
                    try {
                        System.out.println("Enter how many time you want print: ");
                        int count = s.nextInt();
                        s.nextLine();
                        System.out.println("Enter Content You want to print: ");
                        String content = s.nextLine();
                        methods.textPrinter(count, content);
                        
                    } catch (Exception e) {
                        System.out.println("Internal Error");
                    }
                    break;
                case 5:
                    System.exit(0);
                default:
                    return;
            }
        }
    }
}
