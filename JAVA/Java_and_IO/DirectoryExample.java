import java.nio.file.*;

public class DirectoryExample {
    public static void main(String[] args) throws Exception {
        // Create a single directory
        Files.createDirectory(Path.of("myFolder"));

        // Create full nested path in one shot — won't fail if already exists
        Files.createDirectories(Path.of("parent/child/grandchild"));

        // List only immediate children (one level deep)
        System.out.println("-- Direct children --");
        Files.list(Path.of("parent"))
             .forEach(System.out::println);    // prints: parent/child

        // Walk entire directory tree recursively
        System.out.println("-- All contents --");
        Files.walk(Path.of("parent"))
             .forEach(System.out::println);    // prints all levels

        // Filter while walking — find only .txt files
        Files.walk(Path.of("."))
             .filter(p -> p.toString().endsWith(".txt"))
             .forEach(System.out::println);
    }
}