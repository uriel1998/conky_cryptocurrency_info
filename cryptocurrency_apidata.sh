#!/bin/bash

########################################################################
# This script is designed to pull various cryptocurrency values
########################################################################

########################################################################
# Wherein we establish our arrays. This way you can add or remove the
# elements of your choice, or simply have the for-next loop skip those
# particular elements.
# The glyphs are if you have the crypocurrency font installed; that 
# functionality isn't here quite yet.
########################################################################

ccname=( bitcoin bitcoin-cash litecoin ethereum )
ccsymbol=( BTC BCH LTC ETH )
ccglyph=( '\ue029' '\ue01B' '\ue029' '\ue04D' )

JSONDATA=""
CC_Price=""
CC_1h=""
CC_1d=""
CC_7d=""
CURRENCY=""
SYMBOL=""
GLYPH=""

function get_cryptocurrency_data() {

	curl_line="https://api.coinmarketcap.com/v1/ticker/$CURRENCY/?convert=INR"
	JSONDATA=$(curl -s "$curl_line")
}

function parse_cryptocurrency_data() {

	CC_Price=$(echo "$JSONDATA"| grep "price_usd" | grep -oE "[0-9]*\..")
	CC_1h=$(echo "$JSONDATA"| grep "percent_change_1h" | awk -F ':' '{ print $2 }' | awk -F '"' '{ print $2 }')
	CC_1d=$(echo "$JSONDATA"| grep "percent_change_24h" | awk -F ':' '{ print $2 }' | awk -F '"' '{ print $2 }')
	CC_7d=$(echo "$JSONDATA"| grep "percent_change_7d" | awk -F ':' '{ print $2 }' | awk -F '"' '{ print $2 }')
}

function output_cryptocurrency_data() {
    printf "%s %6s %4s %5s   $%s \n" $SYMBOL $CC_1h $CC_1d $CC_7d $CC_Price
}


# get length of an array
tLen=${#ccname[@]}
 
# use for loop read all nameservers
for (( i=0; i<${tLen}; i++ ));
do
    CURRENCY=${ccname[$i]}
    SYMBOL=${ccsymbol[$i]}
    GLYPH=${ccglyph[$i]}
    get_cryptocurrency_data
    parse_cryptocurrency_data
    output_cryptocurrency_data

done
