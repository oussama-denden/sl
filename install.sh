#!/bin/bash
fin () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || fin "il faut indiquer un seul chemain d'installation du shared-lib"
[ -d "$1" ] || fin "le dossier $1 n'existe pas"
mvn clean install -Dtomcat.sharedlib.folder=$1
array=($(ls ./target/rpm/ot-sharedlib/RPMS/noarch))
rpm -Uvh /tmp/ot-sharedlib/target/rpm/ot-sharedlib/RPMS/noarch/$array