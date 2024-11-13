## Custom Ubuntu Server ISO Creator
This project was created to provide tooling to create a custom Ubuntu Server image that uses the autoinstall feature. Information for this project was provided by this [video](https://www.youtube.com/watch?v=ibvxiybT96M&t=43s).

### Steps
1. Download the most recent Ubuntu Server ISO from [here](https://ubuntu.com/download/server)
2. Cleanup any existing `source-files` and `BOOT` directories
3. Create the `source-files` directory
4. Install needed utilities using : `sudo apt install p7zip xorriso`
5. Extract the ISO files using : `7z -y x [ISO NAME] -osource-files`
6. Move the `[BOOT]` directory in the source-files to the parent directory and rename to `BOOT`
7. Copy the `autoinstall.yaml` file to source-files directory
8. Run `xorriso -indev [ISO NAME] -report_el_torito as_mkisofs` to get ISO meta-data
9. Update the `make-iso.sh` with any updated meta-data and run the script

### Reference Material
- [Autoinstall Configuration Reference Manual](https://canonical-subiquity.readthedocs-hosted.com/en/latest/reference/autoinstall-reference.html)
- [Netplan Configuration Manual](https://netplan.readthedocs.io/en/latest/netplan-yaml/)
- [xorriso Utility Manual](https://www.gnu.org/software/xorriso/man_1_xorriso.html)