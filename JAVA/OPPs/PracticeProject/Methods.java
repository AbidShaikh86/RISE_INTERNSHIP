
import java.time.LocalDate;
import java.util.Scanner;

interface coreMethods {

    public void WeekChecker();

    public void trafficLight(String color);

    public void textPrinter(int count, String content);

    public void BirthYearCalculator(int year);
}

public class Methods implements coreMethods {

    @Override
    public void WeekChecker() {
        Scanner s = new Scanner(System.in);
        System.out.println("Enter Week: ");
        int week = s.nextInt();

        switch (week) {
            case 1 ->
                System.out.println("Monday\n");
            case 2 ->
                System.out.println("Tuesday\n");
            case 3 ->
                System.out.println("Wednesday\n");
            case 4 ->
                System.out.println("Thursday\n");
            case 5 ->
                System.out.println("Friday\n");
            case 6 ->
                System.out.println("Saturday\n");
            case 7 ->
                System.out.println("Sunday\n");
            default -> {
                System.out.println("Invalid Week...");
            }
        }
    }

    @Override
    @SuppressWarnings("ConvertToStringSwitch")
    public void trafficLight(String color) {
        if (color.equals("Red") || color.equals("red") || color.equals("RED")) {
            System.out.println("Stop\n");
        } else if (color.equals("Yellow") || color.equals("yellow") || color.equals("YELLOW")) {
            System.out.println("Ready\n");
        } else if (color.equals("Green") || color.equals("green") || color.equals("GREEN")) {
            System.out.println("GO\n");
        } else {
            System.out.println("Enter Valid Color");
        }
    }

    @Override
    public void textPrinter(int count, String content) {
        String BOLD = "\033[1m";
        String RESET = "\033[0m";
        System.out.println("=======================");
        for (int i = 1; i <= count; i++) {
            System.out.println(BOLD + content + RESET);
        }
        System.out.println("=======================\n");
    }

    @Override
    public void BirthYearCalculator(int year) {
        System.out.println(LocalDate.now().getYear() - year + "\n");
    }
}
