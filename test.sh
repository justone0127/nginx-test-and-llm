while true; do 
  echo -n "[$(date +%T)] Response: "
  curl -k -s -X POST https://nginx-app-nginx.apps.ocp.d2jz5.sandbox1023.opentlc.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -d "{\"model\": \"tinyllama1-1b-10\", \"messages\": [{\"role\": \"user\", \"content\": \"hi\"}]}" \
  | grep -o "content\":\"[^\"]*" | cut -d' ' -f2-
  sleep 2
done
