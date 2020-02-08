kubectl config set-credentials default --token${KUBERNETES_TOKEN}

echo ${KUBERNETES_CERT} | base64 -d > ca.crt
kubectl config set-cluster default --server=https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT_HTTPS} --certificate-authority=ca.crt

kubectl config set-context default --cluster=default --user=default
kubectl config use-context default