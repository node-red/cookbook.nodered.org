#!/bin/bash
# Generates the stylesheet based on the main site css that assumed to be co-located

echo > style.css
for x in simplegrid.css style.css front.css docs.css blog.css syntax.css
do
    cat "../../node-red.github.io/css/"$x >> style.css
done
scss -t compressed style.css > style.min.css
rm style.css
