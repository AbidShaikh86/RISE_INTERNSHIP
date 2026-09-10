
import java.util.LinkedList;
import java.util.List;

public class linkedList {
    public static void main(String[] args) {
        List<String> linkedList = new LinkedList<>();
        linkedList.add("Gulamabid");
        linkedList.add("Farhan");
        linkedList.add("Meet");
        linkedList.add("Sinan");

        System.out.println(linkedList.contains("Gulamabid"));
        // System.out.println(linkedList.equals("Mango"));
        System.out.println(linkedList.get(2));
        System.out.println(linkedList.getClass());
        System.out.println(linkedList.getFirst());
        System.out.println(linkedList.getLast());
        System.out.println(linkedList.indexOf(2)); // why this is showing -1
        System.out.println(linkedList.isEmpty());
        System.out.println(linkedList.iterator()); // What is this? -> java.util.ArrayList$Itr@2b2fa4f7 
        System.out.println(linkedList.remove(2));
        System.out.println(linkedList.removeAll(linkedList));
    }
}