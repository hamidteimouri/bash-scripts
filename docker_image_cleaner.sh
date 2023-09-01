#!/bin/bash

# Docker repository and prefix
repository="dockerhub/myimage"

# Get a list of all image tags
tags=($(docker images --format '{{.Tag}}' $repository))

# Find the highest tag
highest_tag=$(printf "%s\n" "${tags[@]}" | sort -rV | head -n1)

# Delete images with tags other than the highest tag
for tag in "${tags[@]}"; do
    if [[ $tag != $highest_tag ]]; then
        image="$repository:$tag"
        docker rmi $image
        #echo $image
    fi
done
