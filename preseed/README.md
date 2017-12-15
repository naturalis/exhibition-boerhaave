# Preseed

Alle interactives run on Ubuntu 16.04.3, which is installed by a [preseed file](https://github.com/naturalis/exhibition-boerhaave/tree/master/preseed) that we make.

## Steps

- Download iso and mount it:

  ```shell
  mkdir ~/Desktop/preseed && cd ~/Desktop/preseed
  wget http://releases.ubuntu.com/16.04/ubuntu-16.04.3-server-amd64.iso
  mkdir ubuntu_iso
  sudo mount -r -o loop ubuntu-16.04.3-server-amd64.iso ubuntu_iso
  ```

- Change permissions: (dont forget to change user)

  ```shell
  mkdir ubuntu_files
  rsync -a ubuntu_iso/ ubuntu_files/
  sudo chown user:user ubuntu_files
  sudo chmod 755 ubuntu_files
  sudo umount ubuntu_iso
  ```

- Copy files from this repo and change permissions:

  ```shell
  cp ks.cfg,ubuntu-auto.seed ubuntu_files
  chmod 644 ubuntu_files/ks.cfg ubuntu_files/ubuntu-auto.seed
  chmod 755 ubuntu_files/isolinux ubuntu_files/isolinux/txt.cfg ubuntu_files/isolinux/isolinux.cfg
  ```

- Change txt.cfg:

  ```shell
  cp txt.cfg ubuntu_files/isolinux/txt.cfg
  ```

- Change the timout, so the image starts without delay:

  ```shell
  sed -i -r 's/timeout\s+[0-9]+/timeout 3/g' ubuntu_files/isolinux/isolinux.cfg
  ```

- Change back the permissions:

  ```shell
  chmod 555 ubuntu_files/isolinux
  chmod 444 ubuntu_files/isolinux/txt.cfg ubuntu_files/isolinux/isolinux.cfg
  ```

- Create new .iso:

  ```shell
  sudo mkisofs -D -r -V "ubuntu-auto" -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -input-charset utf-8 -cache-inodes -quiet -o ubuntu-auto.iso ubuntu_files/
  ```

- Create bootable usb

  ```shell
  sudo apt-get install syslinux-utils
  sudo isohybrid ubuntu-auto.iso
  lsblk
  sudo umount /dev/sdb1
  sudo dd if=ubuntu-auto.iso of=/dev/sdb bs=4M && sync
  ```
