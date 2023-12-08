# Alias Replacer

A Swift tool to replace macOS alias files or symbolic links with their original content.

## Usage

1. **Prerequisites:** Ensure Swift is installed on your macOS system.

2. **Run the tool:**
    ```bash
    swift run ReplaceAlias /paths/to/your/alias/file
    ```
    Replace `/paths/to/your/alias/file` with your alias file's actual path.
    
    Or use a glob:
    
    ```bash
    swift run ReplaceAlias *.pdf
    ```

3. The tool resolves the aliases and replaces them with the originals.

## Contributing

Feel free to contribute by submitting issues or pull requests.

## License

This script is provided under the [MIT License](LICENSE).
