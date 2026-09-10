
import java.util.Map;
import java.util.TreeMap;

public class treeMap {
    public static void main(String[] args) {
        Map<String, Integer> treeMap = new TreeMap<>();
        treeMap.put("Abid", 20);
        treeMap.put("Farhan", 22);
        treeMap.put("Meet", 21);
        treeMap.put("Sinan", 23);

        System.out.println(treeMap.get("Abid"));
        System.out.println(treeMap.getClass());
        System.out.println(treeMap.getOrDefault("Farhan", 20));
        System.out.println(treeMap.getOrDefault("Vansh", 20));
        System.out.println(treeMap.isEmpty());
        System.out.println(treeMap.putIfAbsent("Abid", 20));
        System.out.println(treeMap.putIfAbsent("Vansh", 21));
        System.out.println(treeMap.remove("Vansh"));
        System.out.println(treeMap.remove("Sinan", 23));
        System.out.println(treeMap.replace("Farhan", 23));
        System.out.println(treeMap.replace("Farhan", 22, 23));
        System.out.println(treeMap.size());
        System.out.println(treeMap.keySet());
        System.out.println(treeMap.values()); 
    }
}