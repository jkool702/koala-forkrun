
install_dir=/opt/nmrpipe

download_dir=`mktemp -d /tmp/tmp_download.XXX`


URL_list="https://www.ibbr.umd.edu/nmrpipe/install.com \
  https://www.ibbr.umd.edu/nmrpipe/binval.com \
  https://www.ibbr.umd.edu/nmrpipe/NMRPipeX.tZ \
  https://www.ibbr.umd.edu/nmrpipe/s.tZ \
  https://www.ibbr.umd.edu/nmrpipe/dyn.tZ\
  https://www.ibbr.umd.edu/nmrpipe/talos.tZ \
  http://spin.niddk.nih.gov/bax/software/smile/plugin.smile.tZ"

for i in $URL_list; do
  echo downloading $i
  wget "--directory-prefix=$download_dir" --no-directories $i
done

sudo mkdir "$install_dir"
sudo find $download_dir -maxdepth 1 -mindepth 1 -type f -name '*.com' -exec cp {} "$install_dir" \;

sudo find "$install_dir" -maxdepth 1 -mindepth 1 -type f -name '*.com' -exec chmod 755 {} \;

# Note: i386 architecture and some Debian-specific packages not available on Fedora
# sudo sh -c "cd $install_dir ; ./install.com +src $download_dir option +type linux212_64"

sudo dnf install -y --skip-unavailable csh
sudo dnf install -y --skip-unavailable java-latest-openjdk
sudo dnf install -y --skip-unavailable java-latest-openjdk-headless
# i386 libraries not available on Fedora in same form
# sudo apt-get install -y libc6:i386
# sudo apt-get install -y libstdc++6:i386
# sudo apt-get install -y libx11-6:i386
# sudo apt-get install -y libxext6:i386
sudo dnf install -y --skip-unavailable mscore-fonts-all
sudo dnf install -y --skip-unavailable curl

