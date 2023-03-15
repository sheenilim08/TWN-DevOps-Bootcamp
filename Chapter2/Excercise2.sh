#!/bin/bash

echo "Installing the JDK"
apt-get -y install default-jre
echo "Installation done."
echo ""

echo "Checking condition 1: whether java is installed at all"

#splits the result by ' ' character
readarray -d ' ' -t javaDirs <<< $(find /usr/lib/jvm/ -maxdepth 1 -mindepth 1 -type d -printf '%f\n')

if [[ ! -z "$javaDirs" ]]; then
    echo "Checking java version"
    java -version
    echo ""
    echo ""

    dirsCount=$(echo $javaDirs | wc -w)
    echo "There are $dirsCount java versions installed."
    for currentFolder in ${javaDirs[@]}
    do
        readarray -d ' ' -t versionLine <<< $(/usr/lib/jvm/$currentFolder/bin/java -version 2>&1 | grep "openjdk")
        cleanVersion=$(echo "${versionLine[2]}" | tr -d '\n' | tr -d '"' | sed 's/_[0-9]*$//')
        echo "Found Java Version - $cleanVersion"
    done
else
    echo "No Java is detected on the computer."
fi
