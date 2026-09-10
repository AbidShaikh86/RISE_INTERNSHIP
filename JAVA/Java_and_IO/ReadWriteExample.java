import java.nio.file.*;
import java.util.List;

public class ReadWriteExample {
    public static void main(String[] args) throws Exception {
        Path path = Path.of("sample.txt");

        // Write all at once — simple and clean for small files
        Files.writeString(path, "Line 1\nLine 2\nLine 3");

        // Read entire file as one String — good for small files
        String all = Files.readString(path);
        System.out.println(all);

        // Read into a List — good when you need all lines in memory
        List<String> lines = Files.readAllLines(path);
        System.out.println(lines.get(0));   // Line 1

        // Read lazily line by line — best for large files, saves memory
        Files.lines(path).forEach(System.out::println);

        // Append to file instead of overwriting
        Files.writeString(path, "\nLine 4", StandardOpenOption.APPEND);
    }
}