import java.nio.file.*;

public class FileIOExample {
    public static void main(String[] args) throws Exception {
        Path path = Path.of("notes.txt");

        // Write content to file (creates file if it doesn't exist)
        Files.writeString(path, "Hello from modern Java NIO!");

        // Read entire file as a single String
        String content = Files.readString(path);
        System.out.println(content);   // Hello from modern Java NIO!

        // Read file as a list of lines
        Files.readAllLines(path).forEach(System.out::println);
    }
}