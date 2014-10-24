#!/bin/bash

start-sshagent() {
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
}
