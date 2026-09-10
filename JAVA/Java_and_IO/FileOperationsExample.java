import java.nio.file.*;

public class FileOperationsExample {
    public static void main(String[] args) throws Exception {
        Path src = Path.of("original.txt");
        Files.writeString(src, "Some content");

        // Copy — REPLACE_EXISTING means overwrite if destination exists
        Path dest = Path.of("copy.txt");
        Files.copy(src, dest, StandardCopyOption.REPLACE_EXISTING);

        // Move / Rename
        Files.move(dest, Path.of("renamed.txt"), StandardCopyOption.REPLACE_EXISTING);

        // Delete safely — no error if file doesn't exist
        Files.deleteIfExists(Path.of("renamed.txt"));

        // Check file properties
        System.out.println(Files.exists(src));       // true
        System.out.println(Files.isReadable(src));   // true
        System.out.println(Files.size(src));         // size in bytes
        System.out.println(Files.isDirectory(src));  // false
    }
}