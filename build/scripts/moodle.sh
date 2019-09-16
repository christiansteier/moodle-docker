echo "\n[i] Install Moodle\n"
cd /tmp
curl -LO https://download.moodle.org/stable${VERSION}${RELEASE}/moodle-latest-${VERSION}${RELEASE}.tgz
curl -LO https://download.moodle.org/stable${VERSION}${RELEASE}/moodle-latest-${VERSION}${RELEASE}.tgz.sha256
echo "[i] Verifying integrity..."
CHECKSUM_STATE=$(echo -n $(sha256sum -c moodle-latest-${VERSION}${RELEASE}.tgz.sha256) | tail -c 2)
if [ "${CHECKSUM_STATE}" != "OK" ]; then echo "[!!] Checksum does not match!" && exit 1; fi
echo "[i] All seems good, now unpacking moodle-latest-${VERSION}${RELEASE}.tgz"
tar zxvf moodle-latest-${VERSION}${RELEASE}.tgz -C /usr/src
rm moodle-latest-${VERSION}${RELEASE}.*
