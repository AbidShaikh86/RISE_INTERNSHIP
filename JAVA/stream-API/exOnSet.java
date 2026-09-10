
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class exOnSet {
    public static void main(String[] args) {
        Set<Integer> numbers = new HashSet<>();
        numbers.add(5);
        numbers.add(3);
        numbers.add(8);
        numbers.add(1);
        numbers.add(9);
        numbers.add(2);
        numbers.add(7);


        System.out.println(
            numbers.stream()
                .filter(n -> n % 2 == 0)
                .toList()
        );
        System.out.println(
            numbers.stream()
                .sorted()
                .toList()
        );
        System.out.println(
            numbers.stream()
                .map(n -> "Num = " + n)
                .collect(Collectors.toList())
        );

        // How this Works?
        // System.out.println(
        //     numbers.stream()
        //         .mapToDouble(numbers)
        // );
        // mapToInt(), mapToLong()
        // .collect()
    }
}