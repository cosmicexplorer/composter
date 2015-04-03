fs = require 'fs'

analyzeLines = ->
  fs.createReadStream("/home/cosmicexplorer/TODO.md")

module.exports = analyzeLines
