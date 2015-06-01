---
layout: post
title:  "Welcome to a New World!"
date:   2015-01-02 16:36:39
categories: posts static web jekyll
---
This is the first entry in the test PRU web site...maybe more to come.


You can use math notation:

$$\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{aligned}$$

There are things like citation [see @jetzki p. 34-35] or URL citations [see @pandoc] or plain URL [markdown][md].
We use pandoc to generate html from markdown so you can use extensions like ~~strikethrough~~ or fenced code blocks like the [PLSQL one](#mycode) below.

For the citations you get a *References* section with all of them at the end!

Nice, eh?



~~~~ {#mycode .plsql .numberLines startFrom="42"}
DECLARE
   salary         emp.sal%TYPE := 0;
   mgr_num        emp.mgr%TYPE;
   last_name      emp.ename%TYPE;
   starting_empno emp.empno%TYPE := 7499;
BEGIN
   SELECT mgr INTO mgr_num FROM emp
      WHERE empno = starting_empno;
   WHILE salary <= 2500 LOOP
      SELECT sal, mgr, ename INTO salary, mgr_num, last_name
         FROM emp WHERE empno = mgr_num;
   END LOOP;
   INSERT INTO temp VALUES (NULL, salary, last_name);
   COMMIT;
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      INSERT INTO temp VALUES (NULL, NULL, 'Not found');
      COMMIT;
END;

qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
               qsort (filter (>= x) xs)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# References

[md]: http://daringfireball.net/projects/markdown/syntax "Markdown syntax"