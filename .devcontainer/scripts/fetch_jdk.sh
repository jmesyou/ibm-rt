if [[ -z ${BOOT_JDK_ROOT} ]]; then
  return
fi

# Download and install boot JDKs.
cd /tmp

JDK_VERSIONS=(8 11 17 18)
for VERSION in ${JDK_VERSIONS[@]}; do
  FILE=jdk${VERSION}.tar.gz
  DEST=${BOOT_JDK_ROOT}/${FILE}
  mkdir -p {}
  wget -O ${FILE} "https://api.adoptopenjdk.net/v3/binary/latest/${VERSION}/ga/linux/x64/jdk/openj9/normal/adoptopenjdk"
  tar -xzf ${FILE} --directory=${DEST} --strip-components=1
done

# cleanup
rm -f jdk*.tar.gz