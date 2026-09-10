
import java.util.HashSet;
import java.util.Set;

public class hashSet {
    public static void main(String[] args) {
        Set<String> hashSet = new HashSet<>();
        hashSet.add("Abid Shaikh");
        hashSet.add("Farhan Gheri");
        hashSet.add("Meet Rana");
        hashSet.add("Sinan Dudhwala");

        // System.out.println(hashSet.contains("Abid Shaikh"));
        // // System.out.println(linkedList.equals("Mango"));
        // System.out.println(hashSet.getClass());
        // System.out.println(hashSet.size());
        // System.out.println(hashSet.isEmpty());
        // System.out.println(hashSet.iterator()); // What is this? -> java.util.ArrayList$Itr@2b2fa4f7 
        // // System.out.println(hashSet.removeIf(filter));
        // System.out.println(hashSet.remove("Sinan Dudhwala"));
        System.out.println(hashSet);
    }
}