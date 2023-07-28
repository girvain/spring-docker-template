FROM arm64v8/eclipse-temurin:17
RUN mkdir /opt/app

VOLUME /tmp
# Copy the jar into the container
COPY target/*.jar app.jar

#ENTRYPOINT ["java","-jar","/app.jar"]
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#ENTRYPOINT ["java","-Dspring.profiles.active=dockerembbed,oauth-security,dev", "-jar","/app.jar"]
