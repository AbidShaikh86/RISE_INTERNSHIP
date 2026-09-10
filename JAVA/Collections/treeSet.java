import java.util.Set;
import java.util.TreeSet;

public class treeSet {
    public static void main(String[] args) {
        Set<String> treeSet = new TreeSet<>();
        treeSet.add("Abid Shaikh");
        treeSet.add("Farhan Gheri");
        treeSet.add("Meet Rana");
        treeSet.add("Sinan Dudhwala");

        Set<String> treeSet2 = new TreeSet<>();
        treeSet.add("Gulamabid");
        treeSet.add("Aamir");
        treeSet.add("Vansh");
        treeSet.add("Sizen");

        System.out.println(treeSet.contains("Abid Shaikh"));
        System.out.println(treeSet);
        System.out.println(treeSet.getClass());
        System.out.println(treeSet.size());
        System.out.println(treeSet.isEmpty());
        System.out.println(treeSet.iterator()); // What is this? -> java.util.ArrayList$Itr@2b2fa4f7 
        System.out.println(treeSet.retainAll(treeSet2)); // what this is doing
        System.out.println(treeSet);
        // System.out.println(hashSet.removeIf());
        System.out.println(treeSet.remove("Sinan Dudhwala"));
    }
}