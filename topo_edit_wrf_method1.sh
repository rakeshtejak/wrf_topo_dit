#!/bin/bash

 #Author: Rakesh Teja Konduru

 #Purpose: To edit the topography in the wrf (method1).

 #Detail : This script will reduce the topography to 1%, 25%, 50%, 75%.

 #Date/Time:03-12-2021.15:00

 #Note: Before utilizing this code you need to have following things with you
 #     1) ncap2 should be installed in your home
 #     2) geo_em_do1.nc file
 #     3) Any plotting software to confirm the changes. Best way is to use ncview to see the changes.
 #     4) Manually confirm whether these change has retained the attributes and data type accurately.
 #   If any of these steps go wrong then you may come across errors during metgrid.
 #

 file="geo_em.d01.nc" #the file name

 echo "$file"
 str1=(${file//./ })
 ofile1p=${str1[0]}"."${str1[1]}"_1ptopo."${str1[2]}
 ofile25p=${str1[0]}"."${str1[1]}"_25ptopo."${str1[2]}
 ofile50p=${str1[0]}"."${str1[1]}"_50ptopo."${str1[2]}
 ofile75p=${str1[0]}"."${str1[1]}"_75ptopo."${str1[2]}

 # From here onwards no changes needed.
 # This code is written in free format to understand easily. This can be changed to much effective way.

 #1 % of topography

 ncap2 -O -c -s "HGT_M=float(HGT_M*0.01)" $file $ofile1p
 ncap2 -O -c -s "VAR_SSO=float(VAR_SSO*0.01)" $ofile1p $ofile1p
 ncap2 -O -c -s "VAR=float(VAR*0.01)" $ofile1p $ofile1p

 #25 % of topography

 ncap2 -O -c -s "HGT_M=float(HGT_M*0.25)" $file $ofile25p
 ncap2 -O -c -s "VAR_SSO=float(VAR_SSO*0.25)" $ofile25p $ofile25p
 ncap2 -O -c -s "VAR=float(VAR*0.25)" $ofile25p $ofile25p

 #50 % of topography

 ncap2 -O -c -s "HGT_M=float(HGT_M*0.50)" $file $ofile50p
 ncap2 -O -c -s "VAR_SSO=float(VAR_SSO*0.50)" $ofile50p $ofile50p
 ncap2 -O -c -s "VAR=float(VAR*0.50)" $ofile50p $ofile50p

 #75 % of topography

 ncap2 -O -c -s "HGT_M=float(HGT_M*0.75)" $file $ofile75p
 ncap2 -O -c -s "VAR_SSO=float(VAR_SSO*0.75)" $ofile75p $ofile75p
 ncap2 -O -c -s "VAR=float(VAR*0.75)" $ofile75p $ofile75p

 echo "Topography is modified to 1%, 25%, 50%, 75%. Files saved as:"
 echo "$ofile1p"
 echo "$ofile25p"
 echo "$ofile50p"
 echo "$ofile75p"

