# tagcloud 的 test case ( @makechart/viewer 的 mctest )
words = <[JavaScript Python React Node.js HTML CSS Vue TypeScript Angular MongoDB Express GraphQL Docker AWS Git]>
types = <[language framework environment database tool cloud]>
mk = (n, cat = true) ->
  raw: words.slice(0, n).map (word, i) -> {word, frequency: 100 - i * 6, type: types[i % types.length]}
  binding: {text: {key: \word}, size: {key: \frequency}} <<< (if cat => {category: {key: \type}} else {})
# 排版是非同步的 ( d3-cloud 的 timer ), 等它跑完
layout = (c, ctx) -> ctx.wait 1500

mctest.suite do
  size: [480, 360]
  data:
    many: mk 15
    few: mk 5
    nocat: mk 10, false
  cases:
    * name: "many", data: \many, steps: layout
    * name: "few", data: \few, steps: layout
    * name: "no-category", data: \nocat, steps: layout
    * name: "random-color", data: \nocat, config: {randomColor: "true"}, steps: layout
    * name: "linear", data: \many, config: {sizeScale: \linear, font: {minsize: 10, maxsize: 40}}, steps: layout
    * name: "rotate:none", data: \many, config: {rotationMode: \none}, steps: layout
    * name: "rotate:fixed", data: \many, config: {rotationMode: \fixed, rotationStep: 45}, steps: layout
    * name: "rectangular", data: \many, config: {spiral: \rectangular, padding: 5}, steps: layout
