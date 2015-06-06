
# Distro Detection - Begin
detectdistro () {
	if [[ -z "${distro}" ]]; then
		distro="Unknown"
		# LSB Release Check
		if type -p lsb_release >/dev/null 2>&1; then
			# read distro_detect distro_release distro_codename <<< $(lsb_release -sirc)
			distro_detect=( $(lsb_release -sirc) )
			if [[ ${#distro_detect[@]} -eq 3 ]]; then
				distro_codename=${distro_detect[2]}
				distro_release=${distro_detect[1]}
				distro_detect=${distro_detect[0]}
			else
				for ((i=0; i<${#distro_detect[@]}; i++)); do
					if [[ ${distro_detect[$i]} =~ ^[[:digit:]]+((.[[:digit:]]+|[[:digit:]]+|)+)$ ]]; then
						distro_release=${distro_detect[$i]}
						distro_codename=${distro_detect[@]:$(($i+1)):${#distro_detect[@]}+1}
						distro_detect=${distro_detect[@]:0:${i}}
						break 1
					elif [[ ${distro_detect[$i]} =~ [Nn]/[Aa] || ${distro_detect[$i]} == "rolling" ]]; then
						distro_release=${distro_detect[$i]}
						distro_codename=${distro_detect[@]:$(($i+1)):${#distro_detect[@]}+1}
						distro_detect=${distro_detect[@]:0:${i}}
						break 1
					fi
				done
			fi

			case "${distro_detect}" in
				"archlinux"|"Arch Linux"|"arch"|"Arch"|"archarm")
					distro="Arch Linux"
					distro_release="n/a"
					if grep -q 'antergos' /etc/os-release; then
						distro="Antergos"
						distro_release="n/a"
					fi
					if grep -q -i 'logos' /etc/os-release; then
						distro="Logos"
						distro_release="n/a"
					fi
					;;
				"BLAG")
					distro="BLAG"
					distro_more="$(head -n1 /etc/fedora-release)"
					;;
				"Chakra")
					distro="Chakra"
					distro_release=""
					;;
				"CentOS") distro="CentOS"
					;;
				"Chapeau") distro="Chapeau"
					;;
				"Debian")
					if [[ -f /etc/crunchbang-lsb-release || -f /etc/lsb-release-crunchbang ]]; then
						distro="CrunchBang"
						distro_release=$(awk -F'=' '/^DISTRIB_RELEASE=/ {print $2}' /etc/lsb-release-crunchbang)
						distro_codename=$(awk -F'=' '/^DISTRIB_DESCRIPTION=/ {print $2}' /etc/lsb-release-crunchbang)
					elif [[ -f /etc/os-release ]]; then
						if [[ "$(cat /etc/os-release)" =~ "Raspbian" ]]; then
							distro="Raspbian"
							distro_release=$(awk -F'=' '/^PRETTY_NAME=/ {print $2}' /etc/os-release)
						else
							distro="Debian"
						fi
					else
						distro="Debian"
					fi
					;;
				"Raspbian")
					distro="Raspbian"
					;;
				"elementary"|"elementary OS")
					distro="elementary OS"
					;;
				"EvolveOS")
					distro="Evolve OS"
					;;
				"KaOS"|"kaos")
					distro="KaOS"
					;;
				"Fedora")
					distro="Fedora"
					;;
				"frugalware")
					distro="Frugalware"
					distro_codename=null
					distro_release=null
					;;
				"Fuduntu")
					distro="Fuduntu"
					distro_codename=null
					;;
				"Gentoo")
					if [[ "$(lsb_release -sd)" =~ "Funtoo" ]]; then
						distro="Funtoo"
					else
						distro="Gentoo"
					fi
					;;
				"gNewSense")
					distro="gNewSense"
					;;
				"Jiyuu Linux")
					distro="Jiyuu Linux"
					;;
				"LinuxDeepin")
					distro="LinuxDeepin"
					distro_codename=null
					;;
				"Deepin")
					distro="Deepin"
					;;
				"Debian Kali Linux")
					distro="Kali Linux"
					;;
				"Korora")
					distro="Korora"
					;;
				"Lunar Linux"|"lunar")
					distro="Lunar Linux"
					;;
				"Mageia")
					distro="Mageia"
					;;
				"MandrivaLinux")
					distro="Mandriva"
					case "${distro_codename}" in
						"turtle"|"Henry_Farman"|"Farman"|"Adelie"|"pauillac")
							distro="Mandriva-${distro_release}"
							distro_codename=null
							;;
					esac
					;;
				"ManjaroLinux")
					distro="Manjaro"
					;;
				"NixOS")
					distro="NixOS"
					;;
				"LinuxMint")
					distro="Mint"
					if [[ "${distro_codename}" == "debian" ]]; then
						distro="LMDE"
						distro_codename="n/a"
						distro_release="n/a"
					fi
					;;
				"SUSE LINUX"|"openSUSE project")
					distro="openSUSE"
					;;
				"Parabola GNU/Linux-libre"|"Parabola")
					distro="Parabola GNU/Linux-libre"
					distro_codename="n/a"
					distro_release="n/a"
					;;
				"Peppermint")
					distro="Peppermint"
					distro_codename=null
					;;
				"CentOS")
					distro="Red Hat Enterprise Linux"
					;;
				"Sabayon")
					distro="Sabayon"
					;;
				"SolusOS")
					distro="SolusOS"
					;;
				"Trisquel")
					distro="Trisquel"
					;;
				"Ubuntu")
					distro="Ubuntu"
					;;
				"Viperr")
					distro="Viperr"
					distro_codename=null
					;;
				*)
					;;
			esac
			if [[ "${distro_detect}" =~ "RedHatEnterprise" ]]; then distro="Red Hat Enterprise Linux"; fi
			if [[ -n ${distro_release} && ${distro_release} != "n/a" ]]; then distro_more="$distro_release"; fi
			if [[ -n ${distro_codename} && ${distro_codename} != "n/a" ]]; then distro_more="$distro_more $distro_codename"; fi
			if [[ -n ${distro_more} ]]; then
				distro_more="${distro} ${distro_more}"
			fi
		fi

		# Existing File Check
		if [ "$distro" == "Unknown" ]; then
			if [ $(uname -o 2>/dev/null) ]; then
				case "$(uname -o)" in
					"Cygwin")
						distro="Cygwin"
						fake_distro="${distro}"
					;;
					"Haiku")
						distro="Haiku"
						fake_distro="${distro}"
					;;
					"GNU/Linux")
						if type -p crux >/dev/null 2>&1; then 
							distro="CRUX"
							distro_more="${distro} $(crux | awk '{print $3}')"
						fi
						if type -p nixos-version >/dev/null 2>&1; then
							distro="NixOS"
							distro_more="NixOS $(nixos-version)"
						fi
					;;
				esac
			fi
			if [[ "${distro}" == "Unknown" ]]; then
				if [ -f /etc/os-release ]; then
					distrib_id=$(</etc/os-release);
					for l in $(echo $distrib_id); do
						if [[ ${l} =~ ^ID= ]]; then
							distrib_id=${l//*=}
							distrib_id=${distrib_id//\"/}
							break 1
						fi
					done
					if [[ -n ${distrib_id} ]]; then
						if [[ -n ${BASH_VERSINFO} && ${BASH_VERSINFO} -ge 4 ]]; then
							distrib_id=$(for i in ${distrib_id}; do echo -n "${i^} "; done)
							distro=${distrib_id% }
							unset distrib_id
						else
							distrib_id=$(for i in ${distrib_id}; do FIRST_LETTER=$(echo -n "${i:0:1}" | tr "[:lower:]" "[:upper:]"); echo -n "${FIRST_LETTER}${i:1} "; done)
							distro=${distrib_id% }
							unset distrib_id
						fi
					fi

					# Hotfixes
					[[ "${distro}" == "Void" || "${distro}" == "void" ]] && distro="Void"
					[[ "${distro}" == "evolveos" ]] && distro="Evolve OS"
					[[ "${distro}" == "antergos" || "${distro}" == "Antergos" ]] && distro="Antergos"
					[[ "${distro}" == "logos" || "${distro}" == "Logos" ]] && distro="Logos"
					[[ "${distro}" == "Arch" ]] && distro="Arch Linux"
					[[ "${distro}" == "Archarm" || "${distro}" == "archarm" ]] && distro="Arch Linux"
					[[ "${distro}" == "elementary" ]] && distro="elementary OS"
				fi
			fi

			if [[ "${distro}" == "Unknown" ]]; then
				if [[ "${OSTYPE}" == "linux-gnu" || "${OSTYPE}" == "linux" ]]; then
					if [ -f /etc/lsb-release ]; then
						LSB_RELEASE=$(</etc/lsb-release)
						distro=$(echo ${LSB_RELEASE} | awk 'BEGIN {
							distro = "Unknown"
						}
						{
							if ($0 ~ /[Uu][Bb][Uu][Nn][Tt][Uu]/) {
								distro = "Ubuntu"
								exit
							}
							else if ($0 ~ /[Mm][Ii][Nn][Tt]/ && $0 ~ /[Dd][Ee][Bb][Ii][Aa][Nn]/) {
								distro = "LMDE"
								exit
							}
							else if ($0 ~ /[Mm][Ii][Nn][Tt]/) {
								distro = "Mint"
								exit
							}
						} END {
							print distro
						}')
					fi
				fi
			fi

			if [[ "${distro}" == "Unknown" ]]; then
				if [[ "${OSTYPE}" == "linux-gnu" || "${OSTYPE}" == "linux" || "${OSTYPE}" == "gnu" ]]; then
					if [ -f /etc/arch-release ]; then distro="Arch Linux"
					elif [ -f /etc/chakra-release ]; then distro="Chakra"
					elif [ -f /etc/crunchbang-lsb-release ]; then distro="CrunchBang"
					elif [ -f /etc/debian_version ]; then
						if [ -f /etc/issue ] && grep -q "gNewSense" /etc/issue ; then
							distro="gNewSense"
						else
							distro="Debian"
						fi
					elif [ -f /etc/dragora-version ]; then distro="Dragora" && distro_more="$(cut -d, -f1 /etc/dragora-version)"
					elif [ -f /etc/evolveos-release ]; then distro="Evolve OS"
					elif [ -f /etc/fedora-release ]; then
						if grep -q "Korora" /etc/fedora-release; then
							distro="Korora"
						elif grep -q "BLAG" /etc/fedora-release; then
							distro="BLAG"
							distro_more="$(head -n1 /etc/fedora-release)"
						else
							distro="Fedora"
						fi
					elif [ -f /etc/frugalware-release ]; then distro="Frugalware"
					elif [ -f /etc/gentoo-release ]; then
						if grep -q "Funtoo" /etc/gentoo-release ; then
							distro="Funtoo"
						else
							distro="Gentoo"
						fi
					elif [ -f /etc/mageia-release ]; then distro="Mageia"
					elif [ -f /etc/mandrake-release ]; then distro="Mandrake"
					elif [ -f /etc/mandriva-release ]; then distro="Mandriva"
					elif [ -f /etc/NIXOS ]; then distro="NixOS"
					elif [ -f /etc/SuSE-release ]; then distro="openSUSE"
					elif [ -f /etc/redhat-release ] && grep -q "Red Hat" /etc/redhat-release; then distro="Red Hat Enterprise Linux"
					elif [ -f /etc/redhat-release ] && grep -q "CentOS" /etc/redhat-release; then distro="CentOS"
					elif [ -f /etc/slackware-version ]; then distro="Slackware"
					elif [ -f /usr/share/doc/tc/release.txt ]; then distro="TinyCore"
					elif [ -f /etc/sabayon-edition ]; then distro="Sabayon"; fi
				else
					if [[ -x /usr/bin/sw_vers ]] && /usr/bin/sw_vers | grep -i "Mac OS X" >/dev/null; then
						distro="Mac OS X"
					elif [[ -f /var/run/dmesg.boot ]]; then
						distro=$(awk 'BEGIN {
							distro = "Unknown"
						}
						{
							if ($0 ~ /DragonFly/) {
								distro = "DragonFlyBSD"
								exit
							}
							else if ($0 ~ /FreeBSD/) {
								distro = "FreeBSD"
								exit
							}
							else if ($0 ~ /NetBSD/) {
								distro = "NetBSD"
								exit
							}
							else if ($0 ~ /OpenBSD/) {
								distro = "OpenBSD"
								exit
							}
						} END {
							print distro
						}' /var/run/dmesg.boot)
					fi
				fi
			fi

			if [[ "${distro}" == "Unknown" ]] && [[ "${OSTYPE}" == "linux-gnu" || "${OSTYPE}" == "linux" || "${OSTYPE}" == "gnu" ]]; then
				if [[ -f /etc/issue ]]; then
					distro=$(awk 'BEGIN {
						distro = "Unknown"
					}
					{
						if ($0 ~ /"LinuxDeepin"/) {
							distro = "LinuxDeepin"
							exit
						}
						else if ($0 ~ /"Parabola GNU\/Linux-libre"/) {
							distro = "Parabola GNU/Linux-libre"
							exit
						}
						else if ($0 ~ /"SolusOS"/) {
							distro = "SolusOS"
							exit
						}
					} END {
						print distro
					}' /etc/issue)
				fi
			fi

			if [[ "${distro}" == "Unknown" ]] && [[ "${OSTYPE}" == "linux-gnu" || "${OSTYPE}" == "linux" || "${OSTYPE}" == "gnu" ]]; then
				if [[ -f /etc/system-release ]]; then
					if grep -q "Scientific Linux" /etc/system-release; then
						distro="Scientific Linux"
					fi
				fi
			fi
		fi
	fi

	if [[ "${distro}" != "Haiku" ]]; then
		if [[ ${BASH_VERSINFO[0]} -ge 4 ]]; then
			if [[ ${BASH_VERSINFO[0]} -eq 4 && ${BASH_VERSINFO[1]} -gt 1 ]] || [[ ${BASH_VERSINFO[0]} -gt 4 ]]; then
				distro=${distro,,}
			else
				distro="$(tr '[:upper:]' '[:lower:]' <<< ${distro})"
			fi
		else
			distro="$(tr '[:upper:]' '[:lower:]' <<< ${distro})"
		fi
	fi

	case $distro in
		antergos) distro="Antergos" ;;
		arch*linux*old) distro="Arch Linux - Old" ;;
		arch|arch*linux) distro="Arch Linux" ;;
		dragora) distro="Dragora" ;;
		elementary|'elementary os') distro="elementary OS";;
		evolveos) distro="Evolve OS" ;;
		fedora) distro="Fedora" ;;
		gnewsense) distro="gNewSense" ;;
		korora) distro="Korora" ;;
		blag) distro="BLAG" ;;
		chapeau) distro="Chapeau" ;;
		crux) distro="CRUX" ;;
		mageia) distro="Mageia" ;;
		mandriva) distro="Mandriva" ;;
		mandrake) distro="Mandrake" ;;
		mint) distro="Mint" ;;
		nix|nix*os) distro="NixOS" ;;
		kali*linux) distro="Kali Linux" ;;
		lmde) distro="LMDE" ;;
		lunar|lunar*linux) distro="Lunar Linux";;
		opensuse) distro="openSUSE" ;;
		ubuntu) distro="Ubuntu" ;;
		debian) distro="Debian" ;;
		raspbian) distro="Raspbian" ;;
		freebsd) distro="FreeBSD" ;;
		freebsd*old) distro="FreeBSD - Old" ;;
		logos) distro="Logos" ;;
		openbsd) distro="OpenBSD" ;;
		dragonflybsd) distro="DragonFlyBSD" ;;
		netbsd) distro="NetBSD" ;;
		red*hat*) distro="Red Hat Enterprise Linux" ;;
		crunchbang) distro="CrunchBang" ;;
		gentoo) distro="Gentoo" ;;
		funtoo) distro="Funtoo" ;;
		sabayon) distro="Sabayon" ;;
		slackware) distro="Slackware" ;;
		frugalware) distro="Frugalware" ;;
		peppermint) distro="Peppermint" ;;
		solusos) distro="SolusOS" ;;
		trisquel) distro="Trisquel";;
		parabolagnu|parabolagnu/linux-libre|'parabola gnu/linux-libre'|parabola) distro="Parabola GNU/Linux-libre" ;;
		viperr) distro="Viperr" ;;
		void) distro="Void" ;;
		kaos) distro="KaOS";;
		linuxdeepin) distro="LinuxDeepin" ;;
		deepin) distro="Deepin" ;;
		chakra) distro="Chakra" ;;
		centos) distro="CentOS" ;;
		mac*os*x) distro="Mac OS X" ;;
		fuduntu) distro="Fuduntu" ;;
		manjaro) distro="Manjaro" ;;
		cygwin) distro="Cygwin" ;;
		haiku) distro="Haiku" ;;
	esac
	printf  "Finding distro...found as '${distro} ${distro_release}'\n"
}

detectdistro
