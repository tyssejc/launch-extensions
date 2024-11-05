#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Updating Launch Extensions submodules...${NC}"

# Check if we're in the root directory (should contain .gitmodules)
if [ ! -f .gitmodules ]; then
    echo -e "${RED}Error: .gitmodules file not found. Are you in the root directory?${NC}"
    exit 1
fi

# Fetch updates for all submodules
echo -e "${GREEN}Fetching updates for all submodules...${NC}"
git submodule foreach 'git fetch origin main'

# Update each submodule to latest main
echo -e "${GREEN}Updating each submodule to latest main branch...${NC}"
git submodule foreach 'git checkout main && git pull origin main'

# Stage updated submodule references
echo -e "${GREEN}Staging submodule updates...${NC}"
git add .

echo -e "${GREEN}Submodules have been updated successfully!${NC}"

# Show status of updates
echo -e "\n${YELLOW}Current status of submodules:${NC}"
git submodule foreach 'echo -e "${GREEN}$(git remote get-url origin)${NC} - $(git describe --tags --always)"'

echo -e "\n${YELLOW}Review the changes and commit them if satisfied:${NC}"
echo -e "git commit -m \"chore: update submodules to latest versions\""