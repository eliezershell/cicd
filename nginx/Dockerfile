FROM nginx
USER root
RUN rm -rf /usr/share/nginx/html/*
# A instrução COPY abaixo deve permanecer comentada durante a primeira execução (instalação inicial).
# A partir do primeiro job da pipeline no Jenkins, esta linha deve ser descomentada para copiar o conteúdo customizado.
#COPY nginx-content /usr/share/nginx/html/
