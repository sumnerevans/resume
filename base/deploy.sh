#! /bin/sh

set -e

pdflatex resume.tex

echo ""
echo "========== Deploying Built Website to Server =========="
scp resume.pdf evansfamilywebsite@the-evans.family:/home/evansfamilywebsite/the-evans.family/sumner/resume.pdf

echo ""
echo "Deploy Successful!"
