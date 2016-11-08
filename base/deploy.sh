#! /bin/sh

set -e

pdflatex resume.tex

echo ""
echo "========== Deploying to the-evans.family =========="
scp resume.pdf tef:/home/evansfamilywebsite/the-evans.family/sumner/

echo ""
echo "Deploy Successful!"
