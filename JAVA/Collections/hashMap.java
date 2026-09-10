
import java.util.HashMap;
import java.util.Map;

public class hashMap {
    public static void main(String[] args) {
        Map<String, Integer> hashMap = new HashMap<>();
        
        hashMap.put("Abid Shaikh", 20);
        hashMap.put("Farhan Gheri", 22);
        hashMap.put("Meet Rana", 21);

        System.out.println(hashMap.get("Abid"));
        System.out.println(hashMap.getClass());
        System.out.println(hashMap.getOrDefault("Farhan", 20));
        System.out.println(hashMap.getOrDefault("Vansh", 20));
        System.out.println(hashMap.isEmpty());
        System.out.println(hashMap.putIfAbsent("Abid", 20));
        System.out.println(hashMap.putIfAbsent("Vansh", 21));
        System.out.println(hashMap.remove("Vansh"));
        System.out.println(hashMap.remove("Sinan", 23));
        System.out.println(hashMap.replace("Farhan", 23));
        System.out.println(hashMap.replace("Farhan", 22, 23));
        System.out.println(hashMap.size());
        System.out.println(hashMap.keySet());
        System.out.println(hashMap.values());
    }
}