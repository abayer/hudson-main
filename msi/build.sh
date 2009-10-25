#!/bin/bash -ex
rm -rf tmp || true
mkdir tmp || true
unzip -p hudson.war 'WEB-INF/lib/hudson-core-*.jar' > tmp/core.jar
unzip -p tmp/core.jar windows-service/hudson.exe > tmp/hudson.exe
unzip -p tmp/core.jar windows-service/hudson.xml > tmp/hudson.xm_
# replace executable name to the bundled JRE
sed -e 's|executable.*|executable>%BASE%\\jre\\bin\\java</executable>|' < tmp/hudson.xm_ > tmp/hudson.xml
