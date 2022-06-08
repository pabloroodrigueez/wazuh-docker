fbout=$(docker exec single-node_wazuh.manager_1 sh -c 'filebeat test output')
fbstatus=$(echo "${fbout}" | grep OK | wc -l)
if [[ fbstatus -eq 7 ]]; then
  echo "No errors in master filebeat"
else
  echo "Errors in master filebeat"
  echo "${fbout}"
  exit 1
fi