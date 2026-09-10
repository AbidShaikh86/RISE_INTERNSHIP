import java.nio.file.*;

public class LinksExample {
    public static void main(String[] args) throws Exception {
        Path original = Path.of("original.txt");
        Files.writeString(original, "I am the original file");

        // Hard Link — second path to the SAME data on disk
        // Deleting original won't destroy the data
        Path hardLink = Path.of("hardlink.txt");
        Files.createLink(hardLink, original);

        // Symbolic Link — stores the PATH to original
        // If original is deleted, this link breaks
        Path symLink = Path.of("symlink.txt");
        Files.createSymbolicLink(symLink, original.toAbsolutePath());

        // Checking link types
        System.out.println(Files.isSymbolicLink(symLink));   // true
        System.out.println(Files.isSymbolicLink(hardLink));  // false

        // See where the symlink is pointing
        System.out.println(Files.readSymbolicLink(symLink)); // path to original
    }
}