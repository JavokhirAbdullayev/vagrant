FROM folioci/alpine-jre-openjdk17:latest

ENV VERTICLE_FILE data-import-processing-core.jar

# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

# Copy your fat jar to the container
COPY ${VERTICLE_FILE} ${VERTICLE_HOME}/${VERTICLE_FILE}

# Expose this port locally in the container.
EXPOSE 8081
