while true; do
  # -i 옵션으로 헤더를 포함해서 가져온 뒤 X-App-Source 값을 확인
  RES=$(curl -k -s -i -X POST https://nginx-app-nginx.apps.ocp.d2jz5.sandbox1023.opentlc.com/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{"model": "tinyllama1-1b-10", "messages": [{"role": "user", "content": "hi"}]}')
  
  # 헤더에서 소스 확인 (없으면 Model-A로 간주)
  SOURCE=$(echo "$RES" | grep "X-App-Source" | awk '{print $2}' | tr -d '\r')
  if [ -z "$SOURCE" ]; then SOURCE="Model-A-Active"; fi
  
  echo "[$(date +%T)] Current Working Model: $SOURCE"
  sleep 2
done
