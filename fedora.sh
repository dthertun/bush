#########################################
# Static Variables and Common Functions #
#########################################
c0="\033[0m" # Reset Text
bold="\033[1m" # Bold Text
underline="\033[4m" # Underline Text
display_index=0

# User options
gtk_2line="no"

# Static Color Definitions
colorize () {
	printf "\033[38;5;$1m"
}
getColor() {
	if [[ -n "$1" ]]; then
		if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
			if [[ ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -gt 1 ]] || [[ ${BASH_VERSINFO[0]} -gt 4 ]]; then
				tmp_color=${1,,}
			else
				tmp_color="$(tr '[:upper:]' '[:lower:]' <<< ${1})"
			fi
		else
			tmp_color="$(tr '[:upper:]' '[:lower:]' <<< ${1})"
		fi
		case "${tmp_color}" in
			'black')		color_ret='\033[0m\033[30m';;
			'red')			color_ret='\033[0m\033[31m';;
			'green')		color_ret='\033[0m\033[32m';;
			'brown')		color_ret='\033[0m\033[33m';;
			'blue')			color_ret='\033[0m\033[34m';;
			'purple')		color_ret='\033[0m\033[35m';;
			'cyan')			color_ret='\033[0m\033[36m';;
			'light grey')	color_ret='\033[0m\033[37m';;
			'dark grey')	color_ret='\033[0m\033[1;30m';;
			'light red')	color_ret='\033[0m\033[1;31m';;
			'light green')	color_ret='\033[0m\033[1;32m';;
			'yellow')		color_ret='\033[0m\033[1;33m';;
			'light blue')	color_ret='\033[0m\033[1;34m';;
			'light purple')	color_ret='\033[0m\033[1;35m';;
			'light cyan')	color_ret='\033[0m\033[1;36m';;
			'white')		color_ret='\033[0m\033[1;37m';;
			# Some 256 colors
			'orange') color_ret="$(colorize '202')";;
			# HaikuOS
			'black_haiku') color_ret="$(colorize '7')";;
		esac
		[[ -n "${color_ret}" ]] && echo "${color_ret}"
	else
		:
	fi
}

verboseOut() {
	if [[ "$verbosity" -eq "1" ]]; then
		printf "\033[1;31m:: \033[0m$1\n"
	fi
}

errorOut() {
	printf "\033[1;37m[[ \033[1;31m! \033[1;37m]] \033[0m$1\n"
}
stderrOut() {
	while IFS='' read -r line; do printf "\033[1;37m[[ \033[1;31m! \033[1;37m]] \033[0m${line}\n"; done
}


####################
#  Color Defines
####################

colorNumberToCode() {
	number="$1"
	if [[ "${number}" == "na" ]]; then
		unset code
	elif [[ $(tput colors) -eq "256" ]]; then
		code=$(colorize "${number}")
	else
		case "$number" in
			0|00) code=$(getColor 'black');;
			1|01) code=$(getColor 'red');;
			2|02) code=$(getColor 'green');;
			3|03) code=$(getColor 'brown');;
			4|04) code=$(getColor 'blue');;
			5|05) code=$(getColor 'purple');;
			6|06) code=$(getColor 'cyan');;
			7|07) code=$(getColor 'light grey');;
			8|08) code=$(getColor 'dark grey');;
			9|09) code=$(getColor 'light red');;
			  10) code=$(getColor 'light green');;
			  11) code=$(getColor 'yellow');;
			  12) code=$(getColor 'light blue');;
			  13) code=$(getColor 'light purple');;
			  14) code=$(getColor 'light cyan');;
			  15) code=$(getColor 'white');;
			*) unset code;;
		esac
	fi
	echo -n "${code}"
}


detectColors() {
	my_colors=$(sed 's/^,/na,/;s/,$/,na/;s/,/ /' <<< "${OPTARG}")
	my_lcolor=$(awk -F' ' '{print $1}' <<< "${my_colors}")
	my_lcolor=$(colorNumberToCode "${my_lcolor}")

	my_hcolor=$(awk -F' ' '{print $2}' <<< "${my_colors}")
	my_hcolor=$(colorNumberToCode "${my_hcolor}")
}





			if [[ "$no_color" != "1" ]]; then
				c1=$(getColor 'white') # White
				c2=$(getColor 'light blue') # Light Blue
			fi
			if [ -n "${my_lcolor}" ]; then c1="${my_lcolor}"; c2="${my_lcolor}"; fi
			startline="0"
			fulloutput=("$c2           /:-------------:\          %s"
"$c2        :-------------------::       %s"
"$c2      :-----------"$c1"/shhOHbmp"$c2"---:\\     %s"
"$c2    /-----------"$c1"omMMMNNNMMD  "$c2"---:    %s"
"$c2   :-----------"$c1"sMMMMNMNMP"$c2".    ---:   %s"
"$c2  :-----------"$c1":MMMdP"$c2"-------    ---\  %s"
"$c2 ,------------"$c1":MMMd"$c2"--------    ---:  %s"
"$c2 :------------"$c1":MMMd"$c2"-------    .---:  %s"
"$c2 :----    "$c1"oNMMMMMMMMMNho"$c2"     .----:  %s"
"$c2 :--     ."$c1"+shhhMMMmhhy++"$c2"   .------/  %s"
"$c2 :-    -------"$c1":MMMd"$c2"--------------:   %s"
"$c2 :-   --------"$c1"/MMMd"$c2"-------------;    %s"
"$c2 :-    ------"$c1"/hMMMy"$c2"------------:     %s"
"$c2 :--"$c1" :dMNdhhdNMMNo"$c2"------------;      %s"
"$c2 :---"$c1":sdNMMMMNds:"$c2"------------:       %s"
"$c2 :------"$c1":://:"$c2"-------------::         %s"
"$c2 :---------------------://           %s"
"                                     %s")

	if [ "$truncateSet" == "Yes" ]; then
		for ((i=0; i<${#fulloutput[@]}; i++)); do
			my_out=$(printf "${fulloutput[i]}$c0\n" "${out_array}")
			my_out_full=$(echo "$my_out" | cat -v)
			termWidth=$(tput cols)
			SHOPT_EXTGLOB_STATE=$(shopt -p extglob)
			read SHOPT_CMD SHOPT_STATE SHOPT_OPT <<< ${SHOPT_EXTGLOB_STATE}
			if [[ ${SHOPT_STATE} == "-u" ]]; then
				shopt -s extglob
			fi

			stringReal="${my_out_full//\^\[\[@([0-9]|[0-9];[0-9][0-9])m}"

			if [[ ${SHOPT_STATE} == "-u" ]]; then
				shopt -u extglob
			fi

			if [[ "${#stringReal}" -le "${termWidth}" ]]; then
				echo -e "${my_out}"$c0
			elif [[ "${#stringReal}" -gt "${termWidth}" ]]; then
				((NORMAL_CHAR_COUNT=0))
				for ((j=0; j<=${#my_out_full}; j++)); do
					if [[ "${my_out_full:${j}:3}" == '^[[' ]]; then
						if [[ "${my_out_full:${j}:5}" =~ ^\^\[\[[[:digit:]]m$ ]]; then
							if [[ ${j} -eq 0 ]]; then
								j=$((${j} + 5))
							else
								j=$((${j} + 4))
							fi
						elif [[ "${my_out_full:${j}:8}" =~ ^\^\[\[[[:digit:]]\;[[:digit:]][[:digit:]]m ]]; then
							if [[ ${j} -eq 0 ]]; then
								j=$((${j} + 8))
							else
								j=$((${j} + 7))
							fi
						fi
					else
						((NORMAL_CHAR_COUNT++))
						if [[ ${NORMAL_CHAR_COUNT} -ge ${termWidth} ]]; then
							echo -e "${my_out:0:$((${j} - 5))}"$c0
							break 1
						fi
					fi
				done
			fi

			if [[ "$i" -ge "$startline" ]]; then
				unset out_array[0]
				out_array=( "${out_array[@]}" )
			fi
		done

	elif [[ "$portraitSet" = "Yes" ]]; then
		for ((i=0; $i<${#fulloutput[*]}; i++)); do
			printf "${fulloutput[$i]}$c0\n"
		done

        	printf "\n"

		for ((i=0; $i<${#fulloutput[*]}; i++)); do
			[[ -z "$out_array" ]] && continue
			printf "%s\n" "${out_array}"
            		unset out_array[0]
			out_array=( "${out_array[@]}" )
		done

	elif [[ "$display_logo" == "Yes" ]]; then
		for ((i=0; i<${#fulloutput[*]}; i++)); do
			printf "${fulloutput[i]}\n"
		done

	else
		#n=${#fulloutput[*]}
		for ((i=0; i<${#fulloutput[*]}; i++)); do
			# echo "${out_array[@]}"
			febreeze=$(awk 'BEGIN{srand();print int(rand()*(1000-1))+1 }')
			if [[ "${febreeze}" == "411" || "${febreeze}" == "188" || "${febreeze}" == "15" || "${febreeze}" == "166" || "${febreeze}" == "609" ]]; then
				f_size=${#fulloutput[*]}
				o_size=${#out_array[*]}
				f_max=$(( 32768 / f_size * f_size ))
				#o_max=$(( 32768 / o_size * o_size ))
				for ((a=f_size-1; a>0; a--)); do
					while (( (rand=$RANDOM) >= f_max )); do :; done
					rand=$(( rand % (a+1) ))
					tmp=${fulloutput[a]} fulloutput[a]=${fulloutput[rand]} fulloutput[rand]=$tmp
				done
				for ((b=o_size-1; b>0; b--)); do
					rand=$(( rand % (b+1) ))
					tmp=${out_array[b]} out_array[b]=${out_array[rand]} out_array[rand]=$tmp
				done
			fi
			printf "${fulloutput[i]}$c0\n" "${out_array}"
			if [[ "$i" -ge "$startline" ]]; then
				unset out_array[0]
				out_array=( "${out_array[@]}" )
			fi
		done
	fi
	# Done with ASCII output

		
