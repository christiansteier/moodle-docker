
echo "\n[i] Install Moodle\n"
cd /tmp
curl -LO https://download.moodle.org/stable${VERSION}${RELEASE}/moodle-${VERSION}.${RELEASE}.9.tgz
curl -LO https://download.moodle.org/stable${VERSION}${RELEASE}/moodle-${VERSION}.${RELEASE}.9.tgz.sha256
echo "[i] Verifying integrity..."
CHECKSUM_STATE=$(echo -n $(sha256sum -c moodle-${VERSION}.${RELEASE}.9.tgz.sha256) | tail -c 2)
if [ "${CHECKSUM_STATE}" != "OK" ]; then echo "[!!] Checksum does not match!" && exit 1; fi
echo "[i] All seems good, now unpacking moodle-${VERSION}.${RELEASE}.9.tgz"
tar zxvf moodle-${VERSION}.${RELEASE}.9.tgz -C /usr/src
rm moodle-${VERSION}.${RELEASE}.*
