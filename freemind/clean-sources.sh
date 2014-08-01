#!/bin/sh -x

PACKAGE="freemind"

if [ $# -ne 3 ] || [ $1 != '--upstream-version' ]
then
	echo "Call: $0 --upstream-version <version> <file>" >&2
	echo "Example: $0 --upstream-version 0.9.0~rc7 ../freemind-src-0.9.0_RC_7.tar.gz" >&2
	echo "See manpage USCAN(1) for more details" >&2
	exit 2
fi

version="$2"
file="$3"

basedir=$(dirname "$file")
packdir="${basedir}/${PACKAGE}-${version}"

if [ -d ../tarballs ]
then # structure of svn-buildpackage
	origtar="../tarballs/${PACKAGE}_${version}+dfsg.orig.tar.gz"
else
	origtar="${basedir}/${PACKAGE}_${version}+dfsg.orig.tar.gz"
fi

if [ -d "${packdir}" ]
then
	rm -rI "${packdir}"
fi

mkdir "${packdir}"
tar xzf "${file}" -C "${packdir}" || exit 1
find "${packdir}" -name \*.zip -o -name \*.jar -o -name \*.class | xargs rm -vf
rm -vfr ${packdir}/freemind/windows-launcher
tar czf "${origtar}" -C "${basedir}" $(basename "${packdir}") || exit 1

echo "Original source file saved to '${origtar}'."

rm -rf "${packdir}"
