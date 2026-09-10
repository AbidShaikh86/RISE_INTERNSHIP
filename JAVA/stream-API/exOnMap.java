
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.OptionalDouble;
import java.util.stream.Collectors;

public class exOnMap {

    public static void main(String[] args) {
        Map<String, Integer> mathMarks = new HashMap<>();
        mathMarks.put("Abid", 85);
        mathMarks.put("Gulamabid", 92);
        mathMarks.put("Farhan", 34);
        mathMarks.put("Vansh", 92);
        mathMarks.put("Meet", 65);

        Map<String, Integer> passers = mathMarks.entrySet().stream()
                .filter(e -> e.getValue() >= 80)
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

        System.out.println(passers);

        List<String> names = mathMarks.keySet().stream()
                .sorted()
                .collect(Collectors.toList());

        System.out.println(names);

        int totalMarks = mathMarks.values().stream()
                .mapToInt(Integer::intValue)
                .sum();

        System.out.println(totalMarks);

        // what this do ?
        OptionalDouble avgMarks = mathMarks.values().stream()
                .mapToInt(Integer::intValue)
                .average();

        System.out.println(avgMarks);

        Map<String, Integer> sortedByMarks = mathMarks.entrySet().stream()
                .sorted(Map.Entry.<String, Integer>comparingByValue().reversed())
                .collect(Collectors.toMap(
                        Map.Entry::getKey, Map.Entry::getValue,
                        (e1, e2) -> e1, HashMap::new));
        
        System.out.println(sortedByMarks);

        List<String> words = Arrays.asList("ant", "bear", "cat", "ape", "dog", "bat");
        Map<Character, List<String>> grouped = words.stream()
                .collect(Collectors.groupingBy(w -> w.charAt(0)));

        System.out.println(grouped);

        Map<Character, Long> countPerLetter = words.stream()
                .collect(Collectors.groupingBy(w -> w.charAt(0), Collectors.counting()));

        System.out.println(countPerLetter);

        Map<String, Integer> boosted = mathMarks.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        e -> e.getValue() + 5
                ));

        System.out.println(boosted);
    }
}
