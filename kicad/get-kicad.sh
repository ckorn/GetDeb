#!/bin/sh

echo "========== Getting the revision number ==================="
revision=$(bzr log lp:kicad/stable| head -n 2 | grep revno| awk '{print $2}')
version=0.$(date +%Y%m%d)+bzr$revision

package=kicad-$version
origpackage=$package.orig
origtargz=kicad_$version.orig.tar.gz

echo "========== Getting the stable core ======================="
bzr export $origpackage         lp:kicad/stable
echo "========== Getting the documents ========================="
bzr export $origpackage/doc     lp:~kicad-developers/kicad/doc
echo "========== Getting the libraries ========================="
bzr export $origpackage/library lp:~kicad-lib-committers/kicad/library

echo "========== Compressing the archive ======================="
tar czf $origtargz $origpackage
mv $origpackage $package

