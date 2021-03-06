#!/usr/bin/env bash

# https://drive.google.com/file/d/1L17JJWmcRXgFa-eJvksndSl1f2f0F1Vf/
echo "Downloading dataset"
FILE=codit-models.zip
if [[ -f "$FILE" ]]; then
    echo "$FILE exists, skipping download"
else
    fileid="1L17JJWmcRXgFa-eJvksndSl1f2f0F1Vf"
    curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
    curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${fileid}" -o ${FILE}
    rm ./cookie
    unzip ${FILE} && rm ${FILE}
fi

