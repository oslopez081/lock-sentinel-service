#!/bin/bash

readonly FILE_PATH="/home/oslopez081/Documentos/bash_course/tmp/transaction.lock"
contador=0

while [ -f $FILE_PATH ]; do
  contador=$((contador + 1))
  echo "$contador: El archivo existe - $(date)"

  if [ $contador -eq 15 ]; then
    echo "critical: forced unlock"
    rm "$FILE_PATH"
    exit 1
  fi
  sleep 2
done

echo "Recovery Detected"
exit 0
