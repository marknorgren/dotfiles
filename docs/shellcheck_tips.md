# Shellcheck Tips and Best Practices

This document outlines best practices for shell scripting based on shellcheck recommendations.

## 1. Shebang and Shell Directives

Always start your shell scripts with a shebang:
```bash
#!/bin/bash  # For bash scripts
#!/bin/zsh   # For zsh scripts
```

This helps shellcheck identify the shell type and provide appropriate recommendations.

## 2. Variable Quoting and Expansion

### Use Double Quotes
```bash
# Good
path="${HOME}/scripts"
echo "${path}"

# Bad
path=$HOME/scripts
echo $path
```

### Array Expansions
```bash
# Good
array=("item1" "item2")
echo "${array[0]}"

# Bad
array=(item1 item2)
echo $array[0]
```

## 3. Command Substitution

Use `$()` instead of backticks:
```bash
# Good
output="$(command)"

# Bad
output=`command`
```

## 4. Source and Path References

### Properly Quote Source Paths
```bash
# Good
source "${HOME}/.bash_profile"

# Bad
source ~/.bash_profile
```

### Path Manipulation
```bash
# Good
export PATH="${HOME}/bin:${PATH}"

# Bad
export PATH=~/bin:$PATH
```

## 5. Conditional Checks

### File Tests
```bash
# Good
if [[ -f "${file}" ]]; then
    # ...
fi

# Bad
if [ -f "$file" ]; then
    # ...
fi
```

### String Comparisons
```bash
# Good
if [[ "${str}" == "value" ]]; then
    # ...
fi

# Bad
if [ "$str" = "value" ]; then
    # ...
fi
```

## 6. Error Handling

### CD with Error Checking
```bash
# Good
cd "${dir}" || exit 1

# Bad
cd ${dir}
```

### Pipefail
```bash
# Good - Ensures pipeline failures are caught
set -o pipefail
command | next_command

# Bad
command | next_command
```

## 7. Common Shellcheck Warnings

### SC2148: Missing Shebang
- Add appropriate shebang at the start of script

### SC2034: Unused Variables
- Export variables that are used by other scripts
- Remove truly unused variables

### SC1090: Can't Follow Non-constant Source
- Use explicit paths when sourcing files
- Add shellcheck directives if path is dynamic

### SC2086: Double Quote to Prevent Globbing
- Quote variables to prevent word splitting
- Use arrays for multiple values

## 8. Best Practices for Functions

```bash
# Good
my_function() {
    local input="${1}"
    echo "${input}"
}

# Bad
function my_function {
    input=$1
    echo $input
}
```

## 9. Debugging Tips

Add these at the start of your script for debugging:
```bash
set -x  # Print commands and arguments as they are executed
set -e  # Exit on error
set -u  # Exit on undefined variable
set -o pipefail  # Exit on pipe failures
```

## 10. Useful Shellcheck Directives

```bash
# Disable specific warning
# shellcheck disable=SC2034

# Specify external source
# shellcheck source=./lib/source.sh

# Specify shell dialect
# shellcheck shell=bash
```

## Running Shellcheck

To run shellcheck on your scripts:
```bash
# Check a single file
shellcheck script.sh

# Check multiple files
shellcheck script1.sh script2.sh

# Check with specific shell
shellcheck -s bash script.sh
```
