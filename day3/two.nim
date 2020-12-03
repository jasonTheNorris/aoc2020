import os, sequtils, strutils

type Step = object
  x: int
  y: int

let inputFilename = commandLineParams()[0]
let grid = split(readFile(inputFilename), '\n')

let maxX = len(grid[0]) - 1
let maxY = len(grid) - 1

let treeChar = '#'
let steps = [
  Step(x: 1, y: 1),
  Step(x: 3, y: 1),
  Step(x: 5, y: 1),
  Step(x: 7, y: 1),
  Step(x: 1, y: 2),
]

let treeCounts = map(steps, proc (step: Step): int =
  var x, y, treeCount = 0

  while(y <= maxY):
    if (grid[y][x] == treeChar): treeCount += 1

    x += step.x
    if (x > maxX): x = x - maxX - 1

    y += step.y

  treeCount
)

echo foldl(treeCounts, a * b)
