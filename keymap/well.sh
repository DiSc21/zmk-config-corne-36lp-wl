#!/usr/bin/env bash

#===================================================================================
#
# FILE: create_keymap_by_layer.sh
#
# USAGE: create_keymap_by_layer.sh [-a] [--fancy]
#
# DESCRIPTION: Create keymaps for corne zmk layouts.
#
# OPTIONS: see function ’usage’ below
#
# REQUIREMENTS: ---
# BUGS: ---
# NOTES: ---
#
# AUTHOR: TheDirkKnight
# VERSION: 0.0
# CREATED: 31.12.2024 - 12:36:50
#
#===================================================================================

set -o errexit
set -o pipefail
set -o nounset

# just for debugging
#set -o xtrace


SH_PATH="$(dirname "$0")"
readonly SH_PATH

base_layer="default"
readonly base_layer

declare -A layers

layers["${base_layer}"]="default"
layers["numbers"]="orange"
layers["braces"]="orangered"
layers["navigation"]="gold"

# Prints a greeting
# GLOBALS:
#   PREFIX
# ARGUMENTS:
#   Name as a String to use for greeting
# OUTPUTS:
#   Writes String to STDOUT
# RETURN:
#   0 if success, non-zero otherwise.
### FUNCTION END
#function () {
#  echo "${PREFIX}: $1!"
#}

#sed -i -e 's/abc/XYZ/g' /tmp/file.txt

for key in "${!layers[@]}"; do
  echo "Create ZMK keymap for layer ${key}"

  clr_name=""
  if [[ "${layers[$key]-}" ]]; then
    clr_name="${layers[$key]}"
  fi

  config_yaml="/tmp/zmk_draw_config_${key}.yaml"

  if [ "${key}" = "${base_layer}" ]; then
    cat "${SH_PATH}/configs/templ_draw_config_base.yaml" > "${config_yaml}"
  else
    cat "${SH_PATH}/configs/templ_draw_config_overlay.yaml" > "${config_yaml}"
    cat "${SH_PATH}/configs/templ_svg_style_overlay_head.yaml" | sed -e "s/fill: orange;/fill: ${clr_name};/g" >> "${config_yaml}"
    cat "${SH_PATH}/configs/templ_svg_style_overlay_body.yaml" >> "${config_yaml}"
  fi

  parse_config_templ="${SH_PATH}/configs/templ_parse_config"
  icon_style="fancy"
  if [[ -f "${parse_config_templ}_${icon_style}.yaml" ]]; then
    parse_config_templ="${parse_config_templ}_${icon_style}.yaml"
  else
    echo "No keymap config for style \"${icon_style}\" found! Use default config."
    parse_config_templ="${parse_config_templ}.yaml"
  fi

  cat "${parse_config_templ}" >> "${config_yaml}"

  cat "${config_yaml}"

  out_svg="${SH_PATH}/${icon_style}/corne_${key}.svg"
  out_yaml="${SH_PATH}/${icon_style}/corne_${key}.yaml"
  keymap -c "${config_yaml}" parse -c 10 -z ./config/corne.keymap >"${out_yaml}";
  keymap -c "${config_yaml}" draw "${out_yaml}" -s "${key}" >"${out_svg}";
done


icon_style="fancy"
config_yaml="/tmp/zmk_draw_config_${base_layer}.yaml"
out_svg="${SH_PATH}/${icon_style}/corne.svg"
out_yaml="${SH_PATH}/${icon_style}/corne.yaml"
keymap -c "${config_yaml}" parse -c 10 -z ./config/corne.keymap >"${out_yaml}";
keymap -c "${config_yaml}" draw "${out_yaml}" >"${out_svg}";

