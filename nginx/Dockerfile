FROM nginx
# A linha 4 com a instrução COPY deve estar comentada na primeira instalação
# Essa linha funcionara após o primeiro Job da pipeline Jenkins 
COPY /var/lib/docker/volumes/cicd_jenkins-data/_data/workspace/web-content/nginx-content /usr/share/nginx/html/
