#!/bin/bash

# Create container
NAME=fineract
RUN="toolbox run --container $NAME"
toolbox rm --force $NAME || true
toolbox create --container $NAME

# Install applications
APPLICATIONS="java-11-openjdk-devel java-17-openjdk-src unzip"

## Install applications
$RUN sudo dnf install -y $APPLICATIONS;

## Install Gradle 7.5.1

$RUN curl -O https://downloads.gradle.org/distributions/gradle-7.5.1-all.zip
$RUN sudo mkdir /opt/gradle
$RUN sudo unzip -d /opt/gradle gradle-7.5.1-all.zip

$RUN sudo bash -c ' echo \
    "export PATH='$PATH':/opt/gradle/gradle-7.5.1" \
    > /etc/profile.d/gradle.sh'

