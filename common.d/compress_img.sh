#!/usr/bin/env bash

if [ "${compress:=}" = xz ]; then
  log "Compressing file: $(tput sgr0) ${image_name}.img" white
  if [ "$(arch)" == 'x86_64' ] || [ "$(arch)" == 'aarch64' ]; then
    limit_cpu pixz -p "${num_cores:=}" "${image_dir}/${image_name}.img" # -p Nº cpu cores use
  else
    xz --memlimit-compress=50% -T "$num_cores" "${image_dir}/${image_name}.img" # -T Nº cpu cores use
  fi
fi

chmod 0644 "${image_dir}/${image_name}.img"*
