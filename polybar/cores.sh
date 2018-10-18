#!/usr/bin/env bash

cpu=$(($(cat /sys/class/hwmon/hwmon*/temp*_input 2>/dev/null |sort -nr |head -n1) /1000))
if command -v nvidia-smi &>/dev/null && nvidia-smi &>/dev/null
then
  gpu=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader 2>/dev/null)
else
  gpu=0
fi

[[ $cpu > $gpu ]] && max=$cpu || max=$gpu
[[ $max -lt 50 ]] && echo '' && exit 0

vals=(50 55 60 65)
cols=("#6bff49" "#ff8819" "#ff3205" "#f40202")

for temp in ${!vals[*]}; do
  [[ -z "$cpuCol" && $cpu -lt ${vals[$temp]} ]] && cpuCol="%{F${cols[$temp]}}";
  [[ -z $gpuCol && $gpu -lt ${vals[$temp]} ]] && gpuCol="%{F${cols[$temp]}}";

  [[ $cpuCol && $gpuCol ]] && break
done

echo " $cpuCol$cpu°C %{F#fff}  $gpuCol$gpu°C"
