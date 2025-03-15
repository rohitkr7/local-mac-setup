# SnLocalZboot

### Overview
SnLocalZboot is a repository that contains shell scripts and configuration files to facilitate the zbooting of local ServiceNow setups using database dumps. It also includes scripts for creating fresh dumps.

### Repository Structure
```
SnLocalZboot/
    ├── .zshrc
    ├── LICENSE
    ├── README.md
    ├── zboot.sh
```

### Files

#### .zshrc
This file contains various shell configurations and aliases to streamline your workflow. Key features include:
- Environment setup for `jenv` and `nvm`
- Custom shell prompt with Git branch information
- Useful Git aliases (`dev`, `master`, `gp`, `gs`, `gl`, `gd`)
- Java environment setup aliases (`java11`, `java17`)
- Maven build alias (`build`)
- Custom functions for Git operations (`gcb`, `gc`, `commit`, `push`, `reset`, `clean`)
- Alias to run the zboot.sh script (`zboot`)

#### LICENSE
This file contains the MIT License under which this repository is licensed.

#### README.md
This file provides an overview of the repository and instructions on how to use the zboot.sh script.

#### zboot.sh
This shell script is used to reset the database to its initial state. Key steps include:
- Dropping the existing database
- Recreating the database
- Applying the selected database dump

### Usage

1. **Download the zboot.sh file** and place it in your documents folder.
2. **Update your .zshrc file**:
   - Either place the provided .zshrc content into your existing .zshrc file.
   - Or add an alias to run the zboot.sh script.
3. **Start a new terminal session** and run the script using the alias (e.g., `zboot`).

### License
This repository is licensed under the MIT License. See the LICENSE file for more details.

---

Steps to follow to use this shell script
1. Download zboot.sh file and place it in your documents folder.
2. Place a respective alias to run the shell script in your .zshrc file or just copy paste the .zshrc content to existing one
3. Start a fresh terminal session and fire the script using the alias which you have given e.g. zboot
