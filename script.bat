echo "criando as imagens..."

docker build -t jeffersondevelopers/projeto-backend:1.0 backend/.
docker build -t jeffersondevelopers/projeto-database:1.0 database/.

echo "realizando push das imagens..."

docker push jeffersondevelopers/projeto-backend:1.0
docker push jeffersondevelopers/projeto-database:1.0

echo "serviços do cluster kubernetes..."

kubectl apply -f ./services.yml

echo "criando os deployments..."

kubectl apply -f ./deployment.yml