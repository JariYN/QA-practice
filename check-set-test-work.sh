#!/usr/bin/env bash
# Function to prompt step info
prompt_step() {
  printf "\n"
  printf "\nNext step: $1 ..."
  printf "\n"
  ask_confirmation
}

# Function to ask for user confirmation before proceeding to the next step
ask_confirmation() {
  while true; do
    printf "\n"
    printf "Enter 'y' to proceed, 'q' to quit. "
    printf "Input: "
    read user_input
    case "$user_input" in
      y|Y) return 0 ;;
      q|Q) printf "Stopped."; exit 0 ;;
      *) printf "\nInvalid input. Please enter 'y' to proceed or 'q' to quit." ;;
    esac
  done
}

# Step 1: Initial check message
initial_prompt() {
  printf "\n*************************"
  printf "\nThis is a script that checks your host system is matching the test work run time requirements."
  printf "\nRequirements: linux OS, Docker installed and enough (~2.5 GB free disk space) for Docker image pulling."
  printf "\n"
}

# Step 2: Check if host OS is Linux
check_os() {
  printf "\n"
  printf "\nChecking docker found on host..."
  printf "\n"
  if [ "$(uname)" != "Linux" ]; then
    
    printf "\nLinux OS required, stopping now."
    printf "\n*************************"
    printf "\n"
    exit 1
  else
    printf "\nLinux OS confirmed on host."
    printf "\n"
  fi
}
# Step 3: Check if Docker is installed
check_docker() {
  
  docker --version >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    printf "\nDocker was not found, please install Docker first. Stopping now."
    printf "\n*************************"
    printf "\n"
    exit 1
  else
    printf "\nDocker found."
    printf "\n"
  fi
}

# Step 4: Building Docker image
build_docker_image() {
  printf "\nBuilding Docker image next for test work set up."
  printf "\n"
  docker build -t test-work .
  if [ $? -ne 0 ]; then
    printf "\nFailed to pull Docker image for test work. Stopping."
    printf "\n*************************"
    printf "\n"
    exit 1
  else
    printf "\n"
    printf "\nDocker image built successfully."
    printf "\n"
  fi
}

# Main execution flow

# Step 1: Initial prompt
initial_prompt

# Step 2: Check if OS is Linux
prompt_step "checking host OS is Linux"
check_os

# Step 3: Check if Docker is installed
prompt_step "checking Docker is installed"
check_docker

# Step 4: Building Docker image for test work
prompt_step "Building Docker image for test work"
build_docker_image
printf "\n"
printf "\nDONE."
printf "\nCheck README.md file for instructions to run test work in container."
printf "\nThe docker image to be used based on 'marketsquare/robotframework-browser'"
printf "\nand images can be found from host with command: docker images"
printf "\nThe build image is named 'test-work'."
printf "\nSee more info using docker from: https://docs.docker.com/reference/cli/docker/container/run/"
printf "\n*************************"
printf "\n"
printf "\n"