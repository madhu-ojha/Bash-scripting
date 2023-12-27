#!/bin/bash
# Script to take input from users and print output
# Prompt the user for their name
echo -n "Enter your name: "
read name
# Prompt the user for their age
echo -n "Enter your age: "
read age
# Prompt the user for their favorite color
echo -n "Enter your favorite color: "
read color
# Print a greeting with the provided information
echo "Hello, $name! You are $age years old, and your favorite color is $color."