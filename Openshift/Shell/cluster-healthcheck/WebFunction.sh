#!/bin/bash
function generateTextCell() {
  MESSAGE=$1
  COLSPAN=$2
  echo "<td colspan=${COLSPAN}>${MESSAGE}</td>" >> index.html
}

function generateSuccessCell() {
  MESSAGE=$1
  COLSPAN=$2
  echo "<td colspan=${COLSPAN}><image src="success.png" height="30" width="30"/>${MESSAGE}</td>" >> index.html
}

function generateErrorCell() {
  MESSAGE=$1
  COLSPAN=$2
  echo "<td><image src="failure.png" height="30" width="30"/>${MESSAGE}</td>" >> index.html
}

function startRow() {
  echo "<tr>" >> index.html
}

function endRow() {
  echo "</tr>" >> index.html
}

function startHtml() {
  echo "<html><table border=2 width=100%>" > index.html
}

function endHtml() {
  echo "</table></html>" >> index.html
}
