#!/bin/bash

set -o errexit

if [ -z $1 ]; then
  echo "Usage: $0 <TENANT NAME>"
  exit 1
fi

TENANT_NAME=$1
TEMPLATE="template"
REPO_ROOT=$(git rev-parse --show-toplevel)
TENANT_DIR="${REPO_ROOT}/tenants/${TENANT_NAME}/"

mkdir -p ${TENANT_DIR}

cp -r "${REPO_ROOT}/${TEMPLATE}/." ${TENANT_DIR}

for f in ${TENANT_DIR}*.yaml; do 
  echo "Modifying $f"
  if [[ "${OSTYPE}" == "darwin"* ]]; then
    sed -i '' "s/$TEMPLATE/$TENANT_NAME/g" ${f}
  else
    sed -i "s/$TEMPLATE/$TENANT_NAME/g" ${f}
  fi
done

echo "Modifying fluxcd patch.yaml"
if [[ "${OSTYPE}" == "darwin"* ]]; then
  sed -i '' "s/^.*--git-path.*/&,tenants\/$TENANT_NAME/" $REPO_ROOT/cluster/fluxcd/patch.yaml
else
  sed -i "s/^.*--git-path.*/&,tenants\/$TENANT_NAME/" $REPO_ROOT/cluster/fluxcd/patch.yaml
fi

echo "$TENANT_NAME created at ${TENANT_DIR}"
