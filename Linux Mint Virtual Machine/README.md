# EXERCISE 1: Linux Mint Virtual Machine

## Creating a Linux Mint Virtual Machine using Oracle VirtualBox
### 1. Download Linux Mint ISO
- Visit the [Linux Mint website](https://linuxmint.com/) and download the ISO file for your preferred version of Linux Mint.
### 2. Open Oracle VirtualBox
- Launch VirtualBox on your computer.
### 3. Create a New Virtual Machine
- Click on the "New" button in VirtualBox.
- Enter a name for your VM (e.g., "Linux Mint").
- Choose "Linux" as the Type and select "Other Linux (64-bit)" as the Version.
### 4. Allocate Memory (RAM)
- Assign an appropriate amount of memory for the VM (e.g., at least 2GB for basic usage).
### 5. Create a Virtual Hard Disk
- Choose "Create a virtual hard disk now" and click "Create".
### 6. Set Hard Disk Size
- Allocate a suitable amount of hard disk space for the Linux Mint VM (e.g., minimum 20GB).

## Check Distribution
- __lsb_release -a__
- Distributor ID: Linuxmint
## Check Package Manager
- GUI: Synaptic Package Manager (which uses APT)
## Check which CLI editor it uses
- __sudo update-alternatives --config editor__
- nano is set as default CLI
## Check what software center/manager it uses
- GUI: Software Manager (it is also possible to perform software management task using apt in the CLI)
## Check which shell is configured for my user
- __echo $SHELL__
- in my case: bash
