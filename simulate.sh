Start_time=$(date +%s)
N=1000
#Generación de archivos con cantidad de neutrinos detectados y la hora en la que es/son detectado/s.
for i in $(seq -w 1 $N); do
    detection_time=$(date +"%y/%m/%d - %H:%M:%s")
    amount_of_neutrinos=$(( RANDOM % 11 ))
    echo "$detection_time  $amount_of_neutrinos" > "${i}.txt"
done

End_time=$(date +%s)

#Se llevan los archivos creados de cada evento a results.txt.
cat $(seq -f "%04g.txt" 1 $N) > results.txt

#Tiempo promedio entre eventos.
Time_lapse=$(($End_time - $Start_time))
Average_time_lapse=$(echo "scale=6; $Time_lapse/1000" | bc)

#Se lleva Time_lapse y Avarege_time al archivo performance.txt.
echo "Tiempo promedio entre eventos: ${Average_time_lapse}s" > performance.txt
echo "Tiempo entre eventos: ${Time_lapse}s" >> performance.txt

