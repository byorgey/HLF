---
title: "Tromp-Taylor"
---

    [BLOpts]
    profile = wp
    tags =
    categories =

XXX

I want to write a few posts about the current state of computer Go.
I'm not a machine learning expert by any stretch of the imagination,
but I am a student and lover of the game.

In this post I just want to introduce you to the game of Go --- but in
a somewhat nontraditional way.  In the mid-1990s [John
Tromp](http://tromp.github.io/) and Bill Taylor developed a
formulation of the rules of Go^[The Tromp-Taylor rules are not
*precisely* equivalent to the rules that are used in competitive human
play, but they are so close as to make no difference except at a
rather advanced level.] which is succinct, logical, and lends itself
very nicely to computer implementation.   I will present the rules,
together with some of my own commentary and pictures.

1. *Go is played is on a 19x19 square grid of points, by two players
   called black and white.*

    In practice, XXX


2. *Each point on the grid may be colored black, white or empty.*

3. *A point P, not colored C, is said to reach C, if there is a path
   of (vertically or horizontally) adjacent points of P's color from P
   to a point of color C.*

4. *Clearing a color is the process of emptying all points of that
   color that don't reach empty.*

5. *Starting with an empty grid, the players alternate turns, starting with Black.*

6. *A turn is either a pass; or a move that doesn't repeat an earlier
   grid coloring.*

7. *A move consists of coloring an empty point one's own color; then
   clearing the opponent color, and then clearing one's own color.*

8. *The game ends after two consecutive passes.*

9. *A player's score is the number of points of her color, plus the
   number of empty points that reach only her color.*

10. *The player with the higher score at the end of the game is the
    winner. Equal scores result in a tie.*
