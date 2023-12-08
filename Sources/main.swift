import Foundation

// Function to print usage information
func printUsage() {
    let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
    print("Usage:")
    print("\(executableName) <paths-to-alias-file>")
    print("\nOptions:")
    print("-h, --help: Show help information")
}

// Check for help option
if CommandLine.arguments.contains("-h") || CommandLine.arguments.contains("--help") {
    printUsage()
    exit(0)
}

// Ensure that a path to an alias file is provided as a command-line argument
guard CommandLine.arguments.count > 1 else {
    print("Did not receive the path to alias as an argument.")
    printUsage()
    exit(1)
}

for path in CommandLine.arguments.dropFirst(1) {
    // Create an URL object from the provided path
    let aliasURL = URL(fileURLWithPath: path)
    
    do {
        
        print(aliasURL)
        
        // Check if the file at the specified path is an alias
        guard try aliasURL.resourceValues(forKeys: [.isAliasFileKey]).isAliasFile! else {
            print("Error: Original path is not an alias.")
            exit(2)
        }
        
        // Resolve the alias to obtain the actual source URL
        let sourceURL = try URL(resolvingAliasFileAt: aliasURL)
        
        print(sourceURL)
        
        // Remove the original alias file
        try FileManager.default.removeItem(at: aliasURL)
        
        // Copy the source file to the location of the original alias file
        try FileManager.default.copyItem(at: sourceURL, to: aliasURL)
        
        print("Alias resolved and updated successfully.")
    } catch {
        // If any errors occur during the process, terminate and print the error message
        print("Error: \(error.localizedDescription)")
        exit(3)
    }
}
