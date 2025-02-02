# cat command 

	The `cat` command in Linux is a versatile utility used primarily for displaying the contents of files, but it also has several other functionalities. The name "cat" is short for "concatenate," which reflects its ability to combine multiple files into one. Below are the primary uses and options for the `cat` command.

### Basic Usage

	1. **Display the Contents of a File**:
   
   cat filename.txt
  

	2. **Display Multiple Files**:
   You can display the contents of multiple files by listing them:
   
   cat file1.txt file2.txt
  

	3. **Concatenate Files**:
   You can concatenate multiple files into a new file using the redirection operator (`>`):
   
   cat file1.txt file2.txt > combined.txt
   

### Common Options

	1. **`-n` (Number Lines)**:
   This option numbers all output lines, which can be useful for reference.
   
   cat -n filename.txt
  

	2. **`-b` (Number Non-Empty Lines)**:
   Similar to `-n`, but only numbers non-empty lines.
   
   cat -b filename.txt
   

	3. **`-E` (Show End of Line)**:
   Displays a `$` at the end of each line, which can help visualize line endings.
   
   cat -E filename.txt
   

	4. **`-s` (Suppress Repeated Empty Lines)**:
   This option suppresses repeated empty lines, making the output cleaner.
   
   cat -s filename.txt
   

	5. **`-T` (Show Tabs as `^I`)**:
   Displays tab characters as `^I`, which can help identify tabbed spacing in files.
  
   cat -T filename.txt
   

	6. **`-v` (Show Non-Printable Characters)**:
   Displays non-printable characters in a visible format, which can be useful for debugging.
   
   cat -v filename.txt
   

### Examples

	1. **Display the contents of a file with line numbers**:
   
   cat -n filename.txt
  

	2. **Concatenate two files and save the output to a new file**:
   
   cat file1.txt file2.txt > merged.txt
   

	3. **Display the contents of a file while showing end-of-line characters**:
   
   cat -E filename.txt
   

	4. **Display the contents of a file, suppressing repeated empty lines**:
   
   cat -s filename.txt
   

### Conclusion

	The `cat` command is a powerful and flexible tool for working with text files in Linux. Whether you need to view file contents, combine files, or manipulate text output, `cat` provides a straightforward way to accomplish these tasks. Its various options allow for customization, making it a valuable command for both beginners and experienced users.