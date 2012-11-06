#!/bin/sh
#
#
BASEPATH=/usr/share/sweethome3d
JAVA_ARGS="-Djava.library.path=/usr/lib/jni"

. /usr/lib/java-wrappers/java-wrappers.sh

find_java_runtime java6

find_jars j3dcore j3dutils vecmath java3ds-fileloader batik
find_jars sunflow itext janino freehep-util freehep-io freehep-xml
find_jars freehep-graphics2d freehep-graphicsio freehep-graphicsio-svg
find_jars /usr/share/sweethome3d/sweethome3d.jar
find_jars /usr/share/icedtea-web/netx.jar
find_jars /usr/lib/jvm/java-6-sun/jre/lib/javaws.jar

cd $BASEPATH
run_java com.eteks.sweethome3d.SweetHome3D "$@"

