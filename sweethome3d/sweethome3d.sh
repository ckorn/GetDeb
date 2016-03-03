#!/bin/sh
#
#
BASEPATH=/usr/share/sweethome3d
JAVA_ARGS="-Djava.library.path=/usr/lib/jni \
 -Dcom.eteks.sweethome3d.applicationFolders=$HOME/.eteks/sweethome3d:/usr/share/sweethome3d"

. /usr/lib/java-wrappers/java-wrappers.sh

find_java_runtime java6

find_jars j3dcore j3dutils vecmath batik
find_jars sunflow itext janino freehep-util freehep-io freehep-xml
find_jars freehep-graphics2d freehep-graphicsio freehep-graphicsio-svg
find_jars /usr/share/sweethome3d/sweethome3d.jar
find_jars /usr/share/icedtea-web/netx.jar

cd $BASEPATH
run_java com.eteks.sweethome3d.SweetHome3D -open "$@"

