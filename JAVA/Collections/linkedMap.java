
import java.util.LinkedHashMap;
import java.util.Map;

public class linkedMap {
    public static void main(String[] args) {
        Map<String, Integer> linkedMap = new LinkedHashMap<>();
        linkedMap.put("Abid", 20);
        linkedMap.put("Farhan", 22);
        linkedMap.put("Meet", 21);
        linkedMap.put("Sinan", 23);

        System.out.println(linkedMap.get("Abid"));
        System.out.println(linkedMap.getClass());
        System.out.println(linkedMap.getOrDefault("Farhan", 20));
        System.out.println(linkedMap.getOrDefault("Vansh", 20));
        System.out.println(linkedMap.isEmpty());
        System.out.println(linkedMap.keySet());
        System.out.println(linkedMap.putIfAbsent("Abid", 24));
        System.out.println(linkedMap.putIfAbsent("Vansh", 21));
        System.out.println(linkedMap);
        System.out.println(linkedMap.remove("Vansh"));
        System.out.println(linkedMap.remove("Sinan", 76));
        System.out.println(linkedMap.replace("Farhan", 23));
        System.out.println(linkedMap);
        System.out.println(linkedMap.replace("Farhan", 22, 23));
        System.out.println(linkedMap);
        System.out.println(linkedMap.size());
        System.out.println(linkedMap.values());  
    }
}