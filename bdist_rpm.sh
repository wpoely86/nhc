#!/bin/bash

PACKAGE=lbnl-nhc

mkdir -p BUILD SOURCES SPECS RPMS BUILDROOT

./autogen.sh
./configure
make dist
cp lbnl-nhc-*.tar.gz SOURCES
cp ${PACKAGE}.spec "SPECS"
rpmbuild --define "_topdir $PWD" -ba SPECS/${PACKAGE}.spec
rm -rf BUILD SOURCES BUILDROOT SPECS
