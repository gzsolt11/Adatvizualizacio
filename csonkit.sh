d=$1

#kicsereltunk minden szokozt vesszore
sed 's/ \+/,/g' "$d" > vesszovel.txt
#a csapadeknal eszrevettuk hogy ossze voltak csatolva oszlopok, szetvalasztottuk azokat
sed 's/,\(0.00T\)\(\*\+\)/,0.00T,\2/g' vesszovel.txt > tscsillagnelkul.txt 
#akkor ha csillagok vannak a bizonyos oszlophoz ragadva
sed 's/,\(\*\+\)\(0.00T\)/,\1,\2/g' tscsillagnelkul.txt > tscsillagnelkul2.txt 
#ha szamok vannak az oszlop utan ragadva
sed 's/,\(0.00T\)\([0-9]\+\)/,0.00T,\2/g' tscsillagnelkul2.txt  > tesszamnelkul.txt 
#ha szamok vannak az oszlop ele ragadva
sed 's/,\([0-9]\+\)\(0.00T\)/,\1,\2/g' tesszamnelkul.txt   > tesszamnelkul2.txt
#levettuk a sorvegi folosleges vesszoket 
sed 's/,$//' tesszamnelkul2.txt > ujvesszovel.txt
#a csillagokat atalakitottuk ures stringe
sed 's/,\*\+/,/g' ujvesszovel.txt > vegleges.txt
#kivettuk azt az oszlopot amelyben minden sorban 99999 volt
sed 's/,99999,/,/g' vegleges.txt > vegleges1.txt
#kijavitottuk a cimsorban a hibankat
sed 's/,USAF,WBAN,/USAF,/' vegleges1.txt > tisztitott.txt



#ezt miutan elvegeztuk minden fajlra, osszesitettuk ezeket es kiszurtuk beloluk a duplicatumokat
# sort NEV | uniq -u
