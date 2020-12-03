#!/bin/bash

thisnam="$(basename "${0}")"; real_thisnam="$( basename "$(readlink -f "${0}" )" )"; #"
thisdir="$(dirname "${0}");" pushd . &>/dev/null; cd "${thisdir}"; thisdir=$(pwd); popd &>/dev/null

[ -r "${thisdir}/funs_logging" ] && . "${thisdir}/funs_logging"
[ -r "${thisdir}/funs_colors"  ] && . "${thisdir}/funs_colors"

# --- MAIN --- #

function main () {

  printf -- "${_normal_}\n"

  printf -- "${_normal_}   ${_faint_}${_italic_}${_reverse_} standard and high intesity color names ${_normal_}\n"
  declare -i i=0
  for a in ${_color_names_[@]}; do
    declare -n sa="_${a}_"
    printf -- "   %3d ${sa}${_reverse_}   ${_normal_} ${normal}%-9s" ${i} "${a}"
    (( ++i ))
    [[ $(( ${i} % 4 )) -eq 0 ]] && printf -- "\n"
  done
  [[ $(( ${i} % 4 )) -ne 0 ]] && printf -- "\n"

  printf -- "${_normal_}   ${_faint_}${_italic_}${_reverse_} set color and reverse it (standard and high intesity) ${_normal_}\n"
  for i in {0..15}; do
    printf -- "   %3d ${_ac_[${i}]}${_reverse_}   ${_normal_}" ${i}
    (( ++i ))
    [[ $(( ${i} % 8 )) -eq 0 ]] && printf -- "\n"
  done
  [[ $(( ${i} % 8 )) -ne 0 ]] && printf -- "\n"

  printf -- "${_normal_}   ${_faint_}${_italic_}${_reverse_} set backgroung color (standard and high intesity) ${_normal_}\n"
  for i in {0..15}; do
    printf -- "   %3d ${_ab_[${i}]}   ${_normal_}" ${i}
    (( ++i ))
    [[ $(( ${i} % 8 )) -eq 0 ]] && printf -- "\n"
  done
  [[ $(( ${i} % 8 )) -ne 0 ]] && printf -- "\n"

  printf -- "${_normal_}   ${_faint_}${_italic_}${_reverse_} 16-231:  6 × 6 × 6 cube (216 colors): 16 + 36 × r + 6 × g + b (0 ≤ r, g, b ≤ 5) ${_normal_}\n"
  for i in {16..231}; do
    printf -- "   %3d ${_ac_[${i}]}${_reverse_}   ${_normal_}" ${i}
    (( ++i ))
    [[ $(( ( ${i} - 16 ) % 12 )) -eq 0 ]] && printf -- "\n"
  done
  [[ $(( ( ${i} - 16 ) % 12 )) -ne 0 ]] && printf -- "\n"

  printf -- "${_normal_}   ${_faint_}${_italic_}${_reverse_} 232-255:  grayscale from black to white in 24 steps ${_normal_}\n"
  for i in {232..255}; do
    printf -- "   %3d ${_ac_[${i}]}${_reverse_}   ${_normal_}" ${i}
    (( ++i ))
    [[ $(( ( ${i} - 232 )  % 12 )) -eq 0 ]] && printf -- "\n"
  done
  [[ $(( ( ${i} - 232 )  % 12 )) -ne 0 ]] && printf -- "\n"

  printf -- "${_normal_}\n"

	_umsg_ " ${_normal_}${_bold_}${_italic_}${_ac_[208]}sample message (color 208)${_normal_} \n"

}

# --- RUN@ --- #

main "$@"
