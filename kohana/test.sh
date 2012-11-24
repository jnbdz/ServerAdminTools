#!/bin/sh

YEAR=$( date +%Y )
MONTH=$( date +%M )
DAY=$( date +%d )
DATE=$( date +%D )
#datestamped=$(date +%Y-%m-%dT%H:%M:%S.tgz)
echo $YEAR
echo $MONTH
echo $DAY
echo $DATE
#echo $datestamped
WORD="aahello"
#NEWWORD=$(echo ${$WORD:0:1} | tr '[a-z]''[A-Z]')${$WORD:1}
#NEWWORD= echo $WORD | tr '[a-z]' '[A-Z]'
#echo $NEWWORD

_repeat()
{
	#@ USAGE: _repeat string number
	_REPEAT=$1
	while [ ${#_REPEAT} -lt $2 ] ## Loop until string exceeds desired length
	do
		_REPEAT=$_REPEAT$_REPEAT$_REPEAT ## 3 seems to be the optimum number
	done
	_REPEAT=${_REPEAT:0:$2} ## Trim to desired length	
}

repeat()
{
	_repeat "$@"
	printf "%s\n" "$_REPEAT"
}

alert() #@ USAGE: alert message border
{
	_repeat "${2:-#}" $(( ${#1} + 8 ))
	printf '\a%s\n' "$_REPEAT" ## \a = BEL
	printf '%2.2s %s %2.2s\n' "$_REPEAT" "$1" "$_REPEAT"
	printf '%s\n' "$_REPEAT"
}

to_upper()
	case $1 in
		a*) _UPR=A ;; b*) _UPR=B ;; c*) _UPR=C ;; d*) _UPR=D ;;
		e*) _UPR=E ;; f*) _UPR=F ;; g*) _UPR=G ;; h*) _UPR=H ;;
		i*) _UPR=I ;; j*) _UPR=J ;; k*) _UPR=K ;; l*) _UPR=L ;;
		m*) _UPR=M ;; n*) _UPR=N ;; o*) _UPR=O ;; p*) _UPR=P ;;
		q*) _UPR=Q ;; r*) _UPR=R ;; s*) _UPR=S ;; t*) _UPR=T ;;
		u*) _UPR=U ;; v*) _UPR=V ;; w*) _UPR=W ;; x*) _UPR=X ;;
		y*) _UPR=Y ;; z*) _UPR=Z ;; *) _UPR=${1%${1#?}} ;;
	esac

to_upper "$WORD"
printf "%c%s\n" "$_UPR" "${WORD#?}"
#page 71

alert "Do you really want to delete all your files?"
