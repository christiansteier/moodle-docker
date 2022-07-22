echo "\n[i] Install s6-overlay\n"
$minimal_apt_get_install curl
S6OVERLAY=$(curl -s https://api.github.com/repos/just-containers/s6-overlay/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') 
if [ $(uname -m) = "armv6l" ] || [ $(uname -m) = "armv7l" ]; then ARCHTAG=armhf ; elif [ $(uname -m) = "aarch64" ]; then ARCHTAG=aarch64 ; elif [ $(uname -m) = "x86_64" ]; then ARCHTAG=x86_64 ; fi 
curl -o /tmp/s6-overlay-${ARCHTAG}.tar.xz -L https://github.com/just-containers/s6-overlay/releases/download/${S6OVERLAY}/s6-overlay-${ARCHTAG}.tar.xz 
curl -o /tmp/s6-overlay-${ARCHTAG}.tar.xz.sha256 -L https://github.com/just-containers/s6-overlay/releases/download/${S6OVERLAY}/s6-overlay-${ARCHTAG}.tar.xz.sha256
echo "[i] Verifying integrity..." 
cd /tmp
CHECKSUM_STATE=$(echo -n $(sha256sum -c s6-overlay-${ARCHTAG}.tar.xz.sha256) | tail -c 2) 
if [ "${CHECKSUM_STATE}" != "OK" ]; then echo "[!!] Checksum does not match!" && exit 1; fi 
echo "[i] All seems good, now unpacking s6-overlay.tar.xz"
tar xf /tmp/s6-overlay-${ARCHTAG}.tar.xz -C /
rm /tmp/s6-overlay*
