# Dockerfile for building reactor-netty-core
FROM eclipse-temurin:8-jdk

WORKDIR /build

# Copy the source code
COPY . .

# Make gradlew executable and build only reactor-netty-core
RUN chmod +x gradlew && \
    ./gradlew reactor-netty-core:assemble -x test

# Set the output directory
WORKDIR /output

# Copy built jars
RUN cp -r /build/reactor-netty-core/build/libs/* /output/

# Display build artifacts
CMD ["ls", "-lah", "/output/"]