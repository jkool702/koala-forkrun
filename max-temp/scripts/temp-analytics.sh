#!/bin/bash

source "$(git rev-parse --show-toplevel)/frun.bash"

[[ -n "$input_file" ]] || { echo "script was not provided with \$input_file"; exit 1; }
[[ -n "$statistics_dir" ]] || { echo "script was not provided with \$statistics_dir"; exit 1; }

export input_file
export statistics_dir

process_max() {
    sort -rn | head -n1
}

process_min() {
    sort -n | head -n1
}

process_average() {
    awk '{ total += $1; count++ } END { print total/count }'
}

export FORKRUN_EXTRA_FUNCS="process_max process_min process_average"

cat "${input_file}" | cut -c 89-92 | grep -v 999 | {
    read -r data
    printf '%s\n' "$data" "$data" "$data" | frun -j3 eval \
        "process_max > ${statistics_dir}/max.txt" \
        "process_min > ${statistics_dir}/min.txt" \
        "process_average > ${statistics_dir}/average.txt"
}
