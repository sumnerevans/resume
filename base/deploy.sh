#! /bin/sh

set -e

echo ""
echo "========== Deploying Built Website to Server =========="
scp resume.pdf evansfamilywebsite@the-evans.family:/home/evansfamilywebsite/the-evans.family/sumner/resume.pdf

echo ""
echo "Deploy Successful!"
