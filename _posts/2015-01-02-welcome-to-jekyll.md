---
layout: post
title:  "Welcome to a New World!"
date:   2015-01-02 16:36:39
categories: static web jekyll
---
This is the first entry in the test PRU web site...maybe more to come.


You can use math notation:

$$\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{aligned}$$

Another one [see @jetzki p. 34-35].
citations [see @pandoc] and [markdown][md] extensions like ~~strikethrough~~ or fenced code blocks:

~~~~ {#mycode .haskell .numberLines startFrom="100"}
qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
               qsort (filter (>= x) xs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# References

[md]: http://daringfireball.net/projects/markdown/syntax "Markdown syntax"