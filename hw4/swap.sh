#/bin/bash

function killitif {
    docker ps -a  > /tmp/yy_xx$$
    if grep --quiet $1 /tmp/yy_xx$$
     then
     echo "killing older version of $1"
     docker rm -f `docker ps -a | grep $1  | sed -e 's: .*$::'`
   fi
}



function correctImage {
  if [ ! -n "docker ps | grep $1" ]; then
    echo "can't swap - image already running"
    exit 1
  else
    if [ "$1" == "activity2" ]; then
      killitif web2
      containerName="web2"
      old="web1"
    else
      killitif web1
      containerName="web1"
      old="web2"
    fi
  fi
}

#killitif $1

#docker run --name $NEW --network ecs189_default $1
correctImage $1
echo "$containerName"
echo "$old"

docker run --name $containerName --network ecs189_default -d -P $1
#docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh
if [ "$1" == "activity2" ]; then
  echo "changing to activity2"
  sleep 10 && docker exec ecs189_proxy_1 /bin/bash /bin/swap2.sh
  killitif web1
else
  echo "changing to activity"
  sleep 10 &&docker exec ecs189_proxy_1 /bin/bash /bin/swap1.sh
  killitif web2
fi
