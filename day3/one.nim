import os, strutils

let inputFilename = commandLineParams()[0]
let grid = split(readFile(inputFilename), '\n')

let maxX = len(grid[0]) - 1
let maxY = len(grid) - 1

var x, y, treeCount = 0
let stepX = 3
let stepY = 1
let treeChar = '#'

while(y <= maxY):
  if (grid[y][x] == treeChar): treeCount += 1

  x += stepX
  if (x > maxX): x = x - maxX - 1

  y += stepY

echo treeCount

