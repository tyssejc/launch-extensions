#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Initializing Launch Extensions submodules...${NC}"

# Check if we're in the root directory (should contain .gitmodules)
if [ ! -f .gitmodules ]; then
    echo -e "${RED}Error: .gitmodules file not found. Are you in the root directory?${NC}"
    exit 1
fi

# Initialize submodules
echo -e "${GREEN}Initializing submodules...${NC}"
git submodule init

# Update submodules
echo -e "${GREEN}Updating submodules...${NC}"
git submodule update --recursive --remote

# Verify all submodules are initialized
echo -e "${GREEN}Verifying submodules...${NC}"
git submodule status

# Check if any submodules failed to initialize
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Some submodules failed to initialize properly.${NC}"
    exit 1
fi

echo -e "${GREEN}All submodules have been initialized successfully!${NC}"

# Optional: Show status of each submodule
echo -e "\n${YELLOW}Current status of submodules:${NC}"
git submodule foreach 'echo -e "${GREEN}$(git remote get-url origin)${NC} - $(git describe --tags --always)"'