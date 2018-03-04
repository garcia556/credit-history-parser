#!/bin/bash

URL="http://chparser:8080/"
MIME="Content-Type: text/plain; charset=utf-8"

template="application.xml"
id="МСК_$(pwgen -1)"
tmp="${id}.xml"
cp ${template} "${tmp}"
gsed -i "s/__ID__/${id}/g" ${tmp}

curl --verbose --header "${MIME}" --data-binary "@${tmp}" ${URL}

echo
rm "${tmp}"

