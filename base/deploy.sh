#! /bin/sh

set -e

pdflatex resume.tex

echo ""
echo "========== Deploying to the-evans.family =========="
scp resume.pdf tef:/home/evansfamilywebsite/the-evans.family/sumner/

echo ""
echo "========== Deploying to inside.mines.edu/~jonathanevans =========="
scp resume.pdf illuminate:/u/eu/an/jonathanevans/public_html

echo ""
echo "Deploy Successful!"
