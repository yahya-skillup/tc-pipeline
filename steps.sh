kubectl apply -f pvc.yaml

tkn hub install task ibmcloud -n $SN_ICR_NAMESPACE

kubectl create secret docker-registry deploy-icr --docker-server=us.icr.io --docker-username=iamapikey --docker-password=$IBMCLOUD_API_KEY --namespace=$SN_ICR_NAMESPACE

kubectl apply -f serviceaccount.yaml -n $SN_ICR_NAMESPACE
kubectl apply -f tasks.yaml
kubectl apply -f pipeline.yaml


kubectl create -f run.yaml -n $SN_ICR_NAMESPACE
