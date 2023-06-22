const fs = require("fs");
const jison = require("jison");

const args = process.argv.slice(2);

const jisonFile = args[0]
const fileToTest = args[1]

const bnf = fs.readFileSync(jisonFile, "utf8");
const file = fs.readFileSync(fileToTest, "utf8");
const parser = new jison.Parser(bnf);


console.log(parser.parse(file))
module.exports = parser;
