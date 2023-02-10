#!/bin/bash

# Define an empty array
declare -a my_array
echo '${{secrets.MY_ARRAY}}
# Load secrets into the array
secrets=($(echo "${{ secrets.MY_ARRAY }}" | tr ',' '\n'))
my_array+=("${secrets[@]}")

# Load environment variables into the array
vars=($(echo "${{ env.MY_ARRAY }}" | tr ',' '\n'))
my_array+=("${vars[@]}")

# Display the contents of the array
echo "Array contents:"
for item in "${my_array[@]}"; do
  echo " - $item"
done
