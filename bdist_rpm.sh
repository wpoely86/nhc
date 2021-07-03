#!/bin/bash

PACKAGE=lbnl-nhc

export BDISTRPMBASEDIR=$(pwd)/rpmbuild
rm -Rf $BDISTRPMBASEDIR
mkdir -p $BDISTRPMBASEDIR/{BUILD,SPECS,RPMS,SRPMS,SOURCES}

./autogen.sh
./configure
make dist
cp -a lbnl-nhc-*.tar.gz "$BDISTRPMBASEDIR/SOURCES"

rpmbuild --define "_topdir $BDISTRPMBASEDIR" -ba "${PACKAGE}.spec"

rm -rf dist
mkdir -p dist

find $BDISTRPMBASEDIR -regex '.*/RPMS/.*rpm' |grep -v debuginfo |xargs -I '{}' cp -a '{}' dist
