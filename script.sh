#!/usr/bin/env bash

for user in R{1..5}; do sudo useradd $user; done
for user in I{1..3}; do sudo useradd $user; done
for user in A{1..4}; do sudo useradd $user; done

for folder in Proj{1..3}; do mkdir /home/$folder; done
