# Change Logs

## v0.0.2

 - extend the lite base ( `@makechart/base` `lite/index.html`, no d3 ): needs `@makechart/base` >= 0.2.0
   and `@plotdb/chart` >= 3.7.0
   its own d3@7 and d3-cloud loading are replaced by `d3-cloud` 1.2.5 as a dependency
 - add `pkg.name`
 - rotation and random colors are seeded, so the same data always gives the same result
 - fix bug: it didn't render. the svg is now positioned at the top left instead of being pushed below
   the base layout block
 - fix bug: `xfl` was used without declaration
 - add test cases ( `test/index.ls`, run with `npm test` via `@makechart/viewer` )


## v0.0.1

init release
