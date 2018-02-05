# conky_cryptocurrency_info
A simple (and hopefully easily extendable) bash script to output data to the commandline or conky

## Requires

* curl
* bash

## Customization

In the `cryptocurrency_apidata.sh` script, add the cryptocurrency and its
symbols in the two arrays `ccname` and `ccsymbol`.  The default is

`ccname=( bitcoin bitcoin-cash litecoin ethereum )`

`ccsymbol=( BTC BCH LTC ETH )`

but if you wanted to add another, it would be as simple as making it

`ccname=( bitcoin bitcoin-cash litecoin ethereum myfakecc )`

`ccsymbol=( BTC BCH LTC ETH MFC )`

This script pulls from coinmarketcap.com

## Usage

Run `bash cryptocurrency_apidata.sh`.

If you wish to use the conky script, a basic one is included. If you need 
help setting up conky, see [Setting Up Conky](https://help.ubuntu.com/community/SettingUpConky).

## TODO 

* Integrate [cryptocoin glyphs](https://github.com/allienworks/cryptocoins)
; the start of it is there, but it's essentially pointless code at the
moment.
