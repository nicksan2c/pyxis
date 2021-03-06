#!/bin/bash

function log() {
    echo "${@}" >&2
}

function logf() {
    printf "${@}\n" >&2
}

function run_enroot() {
    log "+ enroot $@"
    run enroot "$@"

    log "${output}"

    echo "+ exit status: ${status}"
    [ "${status}" -eq 0 ]
}

function run_srun_unchecked() {
    log "+ srun -N1 --oversubscribe $@"
    run srun -N1 --oversubscribe "$@"

    log "${output}"

    echo "+ exit status: ${status}"
}

function run_srun() {
    run_srun_unchecked "$@"
    [ "${status}" -eq 0 ]
}
