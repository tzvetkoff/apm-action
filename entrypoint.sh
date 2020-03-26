#!/bin/bash

[[ -z "${1}" ]] && set -- /home/node/.npm/bin/apm -v
/bin/sh -c "${@}"
