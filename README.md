# MDBot

**MDBot**, as its name suggests, is a delicate program designed for automating the molecular dynamics simulation workflow. It preserves the commands that carry out each separated tasks. If organized well, a one-for-all utility can be set up. But for dynamics simulation, I hope you can take every step seriously, and entirely automate it only when it is guaranteed to be foolproof. With it, you will be freed from the tedious repetitive tasks, and can easily carry out a large amount of molecular dynamics simulations together.

- Author: Haoyu Lin
- E-mail: [vileoy@pku.edu.cn](mailto:vileoy@pku.edu.cn)
- Repo: [vileoy/MDBot](https://github.com/vileoy/MDBot)

## 1 Installation

This program is organized by shell scripts. Though it is capable of doing many kinds of things,  some dependencies are needs for specific functions.

### 1.1 Dependencies

If you want to use MDBot, please provide the necessary dependencies:

- GROMACS 2021
- Python Packages
  - Python 3.7
  - NetworkX 2.3
  - MODELLER 10.1
- Perl 5

Here only presents the tested version, and other versions may be also applicable. 

### 1.2 MDBot Installation

Next execute the following commands to install it.

```shell
$ git clone https://github.com/vileoy/MDBot.git
$ cd MDBot
$ chmod +x install.sh
$ ./install.sh
```

The default installation directory is `$HOME/.local/mdbot`. If you prefer to install MDBot to a non-standard location, please open the `install.sh` file and change the value of `MDBOTHOME`.

## 2 Usage

MDBot contains all commands corresponding to the each step of simulation process. And all of these tools are essentially modules of a binary named "mdbot" and possess a `-d` option that allows you to specify the working directory (default: pwd). Here are some instants show the details:

```shell
$ # 1. Initialize
$ mdbot init -u BIOLOGICAL_UNIT -s SYSTEM -l LIGAND
```

>Note: To run the initial subroutine, the structure files are necessary. You can download the structure  files we have well-compiled from [here](https://disk.pku.edu.cn:443/link/549B17DAE9520DAF9140D5A3EDE7B155) and move the decompressed files to the `$MDBOTHOME/share/assets` directory, or use the file provided by yourself.

```shell
$ # 2. Build Complex
$ mdbot build_complex -u BIOLOGICAL_UNIT -s SYSTEM
```

```shell
$ # 3. Define unit cell, fill it with water, and add ions
$ mdbot cell_solv_ions -s SYSTEM
```

```shell
$ # 4. Minimize energy
$ mdbot em -s SYSTEM
```

```shell
$ # 5. Equilibrate system (NVT)
$ mdbot nvt_equi -u BIOLOGICAL_UNIT -s SYSTEM
```

```shell
$ # 6. Equilibrate system (NPT)
$ mdbot npt_equi -u BIOLOGICAL_UNIT -s SYSTEM
```

```shell
$ # 7. Run production MD
$ mdbot prod_md -u BIOLOGICAL_UNIT -s SYSTEM
```

---

Except the above commands, it also has some commands to sanitize ligands and proteins, implemented as follows:

```shell
$ # Sanitize ligand
$ mdbot ons -f LIGAND_FILE -n MOLECULAR_NAME
```

```shell
$ # Fill missing residues of a protein
$ mdbot fmr -s SYSTEM
```

