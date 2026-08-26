FROM eclipse-temurin:25-jre

RUN groupadd -r mindustry && useradd -r -g mindustry mindustry

WORKDIR /app

ADD --chown=mindustry:mindustry \
    https://github.com/Anuken/MindustryBuilds/releases/download/27651/Mindustry-BE-Server-27651.jar \
    /app/server.jar

RUN mkdir -p /app/config && chown -R mindustry:mindustry /app

USER mindustry

EXPOSE 6567

VOLUME ["/app/config"]

CMD ["java", "-Xms512M", "-Xmx2G", "-jar", "/app/server.jar"]
