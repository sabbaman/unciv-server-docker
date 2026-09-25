FROM curlimages/curl:8.21.0 AS downloader
ENV UNCIV_VERSION=4.22.3
USER root
RUN curl -L -o "/UncivServer.jar" "https://github.com/yairm210/Unciv/releases/download/{$UNCIV_VERSION}/UncivServer.jar"

FROM eclipse-temurin:25




RUN mkdir -p /opt/app/MultiplayerFiles
COPY --from=downloader /UncivServer.jar /opt/app/UncivServer.jar

EXPOSE 8080

CMD ["java","-jar","/opt/app/UncivServer.jar"]