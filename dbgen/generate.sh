#!/bin/bash

####################################

gen_sql()
{
	MODEL=$1
	ORDER=$2

	if [ -z ${MODEL} ]; then
		echo "Model not set"
		return 1
	fi

	if [ -z ${ORDER} ]; then
		echo "Order not set"
		return 2
	fi

	MODEL_SRC="../doc/${MODEL}.dbm"
	MODEL_DST="./diff/${ORDER}_${MODEL}.sql"

	"/Applications/pgmodeler.app/Contents/MacOS/pgmodeler-cli" --export-to-file --input=${MODEL_SRC} --output=${MODEL_DST}
	gsed -i 's/CREATE ROLE/--CREATE ROLE/g' "${MODEL_DST}"
}

####################################

gen_sql application		030
gen_sql dwh_ch_equifax	250
gen_sql dwh_ch_nbki		260
gen_sql dwh_ch_okb		270

