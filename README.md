# dirinit

 is a versatile command-line tool that creates directory structures from tree-like, indented, or path text representations.

## Installation

### Using Homebrew (recommended for macOS users)

```bash
brew tap yourusername/dirinit
brew install dirinit
```

### Manual Installation

1. Download the `dirinit` script from the [latest release](https://github.com/yourusername/dirinit/releases/latest).
2. Make it executable: `chmod +x dirinit`
3. Move it to a directory in your PATH, e.g., `sudo mv dirinit /usr/local/bin/`

## Usage

```
dirinit [options] [file]
Options:
  -h    Show help message
  -t    Use tree format (default if no format specified)
  -i    Use indented format
  -p    Use path format
  file  Optional input file (if not provided, will prompt for input)
```

Examples:
1. Using a file with tree format:
   ```
   dirinit -t structure.txt
   ```

2. Using a file with indented format:
   ```
   dirinit -i structure.txt
   ```

3. Using a file with path format:
   ```
   dirinit -p structure.txt
   ```

4. Without a file (will prompt for input):
   ```
   dirinit -t
   ```

5. Show help:
   ```
   dirinit -h
   ```

## Supported Input Formats

dirinit supports three input formats:

1. Tree-like format using │├└ characters (use -t):
   ```
   ├── dir1
   │   ├── file11.ext
   │   └── file12.ext
   └── dir2
       └── file21.ext
   ```

2. Simple indented format using spaces (use -i):
   ```
   dir1
     file11.ext
     file12.ext
   dir2
     file21.ext
   ```

3. Path format (use -p):
   ```
   dir1/file11.ext
   dir1/file12.ext
   dir2/file21.ext
   ```

## Dependencies

dirinit will automatically attempt to install its dependencies:
- On macOS: It uses Homebrew to install the `newt` package (which includes `whiptail`).
- On Linux: It uses `apt-get` or `yum` to install `whiptail`.

If the automatic installation fails, you may need to install these dependencies manually.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
