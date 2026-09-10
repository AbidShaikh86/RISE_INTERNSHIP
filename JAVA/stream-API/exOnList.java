
import java.util.*;

public class exOnList {
    public static void main(String[] args) {
        List<String> fruits = new ArrayList<>();

        fruits.add("Apple");
        fruits.add("Banana");
        fruits.add("Cherry");
        fruits.add("Avocado");
        fruits.add("Blueberry");
        fruits.add("Mango");

        List<String> names = List.of(
                "John.java",
                "Test.java",
                "Demo.java",
                "Hello.txt",
                "World.java"
        );

        names.stream()
                .dropWhile(name -> name.endsWith(".java"))
                .forEach(System.out::println);

        System.out.println(
            fruits.stream()
                .filter(s -> s.startsWith("A"))
                .toList()
        );
        System.out.println(
            fruits.stream()
                .map(String::toUpperCase)
                .toList()
        );
        System.out.println(
            fruits.stream()
                .toList()
        );
        String fruitName = fruits
            .stream()
            .reduce("", (initialString, partialString) -> initialString + " - " + partialString);

        System.out.println(fruitName);

        System.out.println(
            fruits.stream()
                .anyMatch(element -> element.startsWith("M"))
        );
        System.out.println(
            fruits.stream()
                .allMatch(element -> element.length() > 3)
        );
        System.out.println(
            fruits.stream()
                .noneMatch(element -> element.startsWith("Z"))
        );

        List<Integer> nums = new ArrayList<>();
        nums.add(1);
        nums.add(2);
        nums.add(3);
        nums.add(4);
        nums.add(5);

        int even = nums.stream()
            .reduce(1, (init, number) -> number % 2 == 0 ? number : init);

//        System.out.println(
//            nums.stream()
//            .filter(n -> n % 2 == 0)
//            .toList()
//        );

        System.out.println(even);

        int sum = nums.stream()
            .reduce(0, Integer::sum);
        System.out.println(sum);
    }
}