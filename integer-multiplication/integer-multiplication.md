How long does it take to multiply two integers?

It may seem like a strange question at first---multiplication is
something that computers can do more or less instantly, so we usually
think of it as taking some small constant amount of time.  This is
true if you limit yourself to working with, say, 64-bit integers: they
fit in registers and there is specialized circuitry for multiplying
them.  However, what if we want to multiply integers with thousands or
millions of bits?  (This is not just academic: applications in
cryptography XXX primality test XXX need to multiply large integers.)
It is only reasonable to suppose the time required for multiplication
will grow as the number of bits does.  The real question, as usual, is
how the required computation time scales with the size of the inputs.

Kolmogorov's Mistake
--------------------

Humans have been multiplying integers for thousands of years.
Euclid's algorithm for computing the greatest common divisor of two
integers is sometimes claimed as the oldest algorithm, but it's
possible that various methods for multiplication may have a decent
claim to this title instead.

The most obvious way to compute $a \times b$ is to simply add $b$ to
itself $a$ times, or vice versa. Indeed, to do this you someone
doesn't even necessarily have to think of multiplication as an
independent concept; they just recognize that they need to repeatedly
add a certain number of times.

XXX Kolmogorov claims the "standard" method is at least 4K years old,
ancient Egyptians and Sumerians, but perhaps 6K years.


In quite a few places, however, as early as XXX years ago, humans came
up with faster ways to multiply.  XXX predicated on having a
positional notation system for numbers. ?  For example, XXX.

XXX ancient Egyptians (see Rhind Papyrus etc.): halving and doubling.
Why does this work?  It's actually exactly the "standard" algorithm
that you learned in school, but for binary numbers. XXX explain

How long does it take?  XXX $O(n^2)$.

Kolmogorov XXX conjectured that $O(n^2)$ is optimal, that is, any
method for computing the product of two $n$-bit numbers
Perhaps based on personal intuition, and perhaps partly based on the
sense that if there

Adding takes $O(n)$.

Notice that $(a + b)^2 - (a - b)^2 = 4ab$, which computes the product
$ab$ using three addition or subtraction operations and two squaring
operations (and also a division by 4, but that's trivial when working in
binary---just take two zeros off the end).  This is why it's enough to
talk about the time it takes two multiply "two $n$-bit numbers",
rather than talking more generally about the time needed to multiply
an $m$-bit number by an $n$-bit number, because fundamentally it's
enough to just talk about the time it takes to square an $n$-bit
number.  If it's possible to square an $n$-bit number faster than
$O(n^2)$, then it's possible to 




A few months ago, XXX published a breakthrough XXX.  And although it
may or may not end up having much effect on integer multiplication *in
practice*, XXX gives us opportunity to XXX fascinating history etc.

There have already been several good articles discussing XXX in more
general terms.    I want to try diving a bit deeper into details.
Draw from Karatsuba (1995), XXX, XXX
