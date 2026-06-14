pkgs='imagemagick'
if ! rpm -q $pkgs >/dev/null 2>&1; then
  sudo dnf install -y --skip-unavailable $pkgs
fi
