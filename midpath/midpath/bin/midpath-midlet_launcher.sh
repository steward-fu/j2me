#!/bin/sh
if [ $# -lt 2 ]; then
    echo "Usage :"
    echo "    $(basename $0) <classpath> <midlet-class> [midlet-name]" 
    echo "    $(basename $0) -jar <jar-file>"
    exit 1
fi

if [ ! $MIDPATH_HOME ]; then
    MIDPATH_HOME=$(pwd)/..
fi

CVM=$MIDPATH_HOME/../phoneme/cdc/build/linux-arm-generic/bin/cvm
CP=$MIDPATH_HOME/dist/midpath.jar:$MIDPATH_HOME/configuration:$MIDPATH_HOME/dist/kxml2-2.3.0.jar:$MIDPATH_HOME/dist/microbackend.jar:$MIDPATH_HOME/dist/jlayerme-cldc.jar:$MIDPATH_HOME/dist/jorbis-cldc.jar:$MIDPATH_HOME/dist/escher-cldc.jar:$MIDPATH_HOME/dist/sdljava-cldc.jar:$MIDPATH_HOME/dist/avetanabt-cldc.jar:$MIDPATH_HOME/dist/jsr172-jaxp.jar:$MIDPATH_HOME/dist/jsr172-jaxrpc.jar:$MIDPATH_HOME/dist/jsr179-location.jar:$MIDPATH_HOME/dist/jsr184-m3g.jar:$MIDPATH_HOME/dist/jsr205-messaging.jar:$MIDPATH_HOME/dist/jsr226-svg-core.jar:$MIDPATH_HOME/dist/jsr226-svg-midp2.jar:$MIDPATH_HOME/dist/jsr239-opengles-core.jar:$MIDPATH_HOME/dist/jsr239-opengles-jgl.jar:$MIDPATH_HOME/dist/jsr239-opengles-nio.jar:$MIDPATH_HOME/dist/jgl-cldc.jar:$MIDPATH_HOME/dist/nokia.jar:$MIDPATH_HOME/dist/cldc1.1.jar

if [ $1 = "-jar" ]; then
    CP=$CP:$2
    ARGS="$1 $2"
else
    CP=$CP:$1
    ARGS="$2 $3"
fi

JLP=$MIDPATH_HOME/dist
CLASS=org.thenesis.midpath.main.MIDletLauncherSE
$CVM -Dsun.boot.library.path=${JLP} -Xbootclasspath/p:${CP} -Xmx10M ${CLASS} ${ARGS}
