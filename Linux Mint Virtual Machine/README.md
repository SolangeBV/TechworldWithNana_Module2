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
- Select "VDI (VirtualBox Disk Image)" as the hard disk file type.
- Choose "Dynamically allocated" for storage on the physical hard disk.

### 6. Set Hard Disk Size
- Allocate a suitable amount of hard disk space for the Linux Mint VM (e.g., minimum 20GB).

### 7. Configure Settings
- In the VM settings, go to the "Storage" section.
- Select the empty disk under "Controller: IDE" and choose the Linux Mint ISO file you downloaded.

### 8. Start the Linux Mint Installation
- Start the VM and it will boot from the Linux Mint ISO.
- Follow the on-screen instructions to install Linux Mint on the VM.

### 9. Complete Installation and Reboot
- Once installation finishes, remove the ISO file when prompted and restart the VM.
- Linux Mint should now boot from the virtual hard disk.

### 10. Install VirtualBox Guest Additions (Optional)
- After installing Linux Mint, consider installing VirtualBox Guest Additions for better integration and performance.
