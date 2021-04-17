# Alloy learning

> Some examples and notes while learning [Alloy](http://alloytools.org/) modeling language.

## Examples

See [examples/](./examples/)

## Glossary

- (+) - Set-union operator
- (-) - Difference of two sets
- (.*) - Transitive closure (reflexive)
- (.^) - Transitive closure (non-reflexive)
- all - Corresponds to forall
- assertion - These are assumptions about the model that you can ask the analyzer to find counter-examples of.
- check - Command given to Alloy to attempt to find counter-examples of an assertion.
- fact - These are constraints of the model that are assumed to always hold.
- function - An expression that returns a result.
- lone - Multiplicity symbol indicating zero or one.
- module - Similar to package in Java corresponding to the path to the .als file from the project directory.
- one - Multiplicity symbol indicating exactly one.
- predicate - Consists of one or more constraints and can be used to represent operations.
- run - Command to ask Alloy to find instances that satisfy a predicate.
- signature - A signature in Alloy is similar to the signature of a scheme (in Z) in that it defines the vocabulary for the model.
- some - Multiplicity symbol indicating more than zero (corresponds to there exists).

## Resources

- [A Guide to Alloy](http://www.doc.ic.ac.uk/project/examples/2007/271j/suprema_on_alloy/Web/index.php)
- [The Same-Origin Policy](http://aosabook.org/en/500L/the-same-origin-policy.html)
- ["Finding bugs without running or even looking at code" by Jay Parlar](https://www.youtube.com/watch?v=FvNRlE4E9QQ)
- [Tutorial for Alloy Analyzer 4.0](http://alloytools.org/tutorials/online/index.html)

## License

[MIT](LICENSE)