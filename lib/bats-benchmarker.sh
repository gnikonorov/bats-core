#!/usr/bin/env bash

get_formatted_benchmark_time() {
  # for reference: https://stackoverflow.com/questions/8903239/how-to-calculate-time-difference-in-bash-script
  current_time=$(date +"%x %H:%M:%S.%N")
  current_time=$(date -u -d "$current_time" +"%s.%N")
  echo "$current_time"
}

print_time_report() {
  if [[ $# -lt 2 ]]; then
    >&2 echo "Incorrect arguments provided to print_time_report. Required:'start_time', 'end_time'"
    exit 1
  fi

  local start_time="$1"
  local end_time="$2"

  elapsed_time=($(date -u -d "2000/1/1 $end_time sec - $start_time sec" +"%j days %H:%M:%S.%2N hrs"))
  elapsed_time[0]=$((10#${elapsed_time[0]}-1))
  echo "Total elapsed time: ${elapsed_time[@]}"
}
