# simple-midi-engine

This small project began in response to a matlab subreddit thread asking how to convert a simple score to audible music using Matlab. It was a homework assignment for OP, but sounded like fun to implement. 

I chose J.S. Bach's Prelude in C from the Well-Tempered Clavier Book I because of it's simultaneous mechanical, yet transcendant character. The ad-hoc MIDI protocol is so rudimentary, that the engine really only would work with songs like this where uniform amplitude is acceptable and the rhythm follows a very predictable pattern.

There are three classes and a main function that implement the engine. A `Piece` is composed of `Bars`, which in turn are composed of `Notes`. 


