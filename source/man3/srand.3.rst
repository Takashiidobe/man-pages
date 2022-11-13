.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rand(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RAND(3)                 Linux Programmer's Manual                RAND(3)

NAME
-------------------------------------------------

::

          rand, rand_r, srand - pseudo-random number generator


---------------------------------------------------------

::

          #include <stdlib.h>

          int rand(void);
          int rand_r(unsigned int *seedp);
          void srand(unsigned int seed);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          rand_r():
              Since glibc 2.24:
                  _POSIX_C_SOURCE >= 199506L
              Glibc 2.23 and earlier
                  _POSIX_C_SOURCE


---------------------------------------------------------------

::

          The rand() function returns a pseudo-random integer in the range
          0 to RAND_MAX inclusive (i.e., the mathematical range
          [0, RAND_MAX]).

          The srand() function sets its argument as the seed for a new
          sequence of pseudo-random integers to be returned by rand().
          These sequences are repeatable by calling srand() with the same
          seed value.

          If no seed value is provided, the rand() function is
          automatically seeded with a value of 1.

          The function rand() is not reentrant, since it uses hidden state
          that is modified on each call.  This might just be the seed value
          to be used by the next call, or it might be something more
          elaborate.  In order to get reproducible behavior in a threaded
          application, this state must be made explicit; this can be done
          using the reentrant function rand_r().

          Like rand(), rand_r() returns a pseudo-random integer in the
          range [0, RAND_MAX].  The seedp argument is a pointer to an
          unsigned int that is used to store state between calls.  If
          rand_r() is called with the same initial value for the integer
          pointed to by seedp, and that value is not modified between
          calls, then the same pseudo-random sequence will result.

          The value pointed to by the seedp argument of rand_r() provides
          only a very small amount of state, so this function will be a
          weak pseudo-random generator.  Try drand48_r(3) instead.


-----------------------------------------------------------------

::

          The rand() and rand_r() functions return a value between 0 and
          RAND_MAX (inclusive).  The srand() function returns no value.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │rand(), rand_r(), srand()             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The functions rand() and srand() conform to SVr4, 4.3BSD, C89,
          C99, POSIX.1-2001.  The function rand_r() is from POSIX.1-2001.
          POSIX.1-2008 marks rand_r() as obsolete.


---------------------------------------------------

::

          The versions of rand() and srand() in the Linux C Library use the
          same random number generator as random(3) and srandom(3), so the
          lower-order bits should be as random as the higher-order bits.
          However, on older rand() implementations, and on current
          implementations on different systems, the lower-order bits are
          much less random than the higher-order bits.  Do not use this
          function in applications intended to be portable when good
          randomness is needed.  (Use random(3) instead.)


---------------------------------------------------------

::

          POSIX.1-2001 gives the following example of an implementation of
          rand() and srand(), possibly useful when one needs the same
          sequence on two different machines.

              static unsigned long next = 1;

              /* RAND_MAX assumed to be 32767 */
              int myrand(void) {
                  next = next * 1103515245 + 12345;
                  return((unsigned)(next/65536) % 32768);
              }

              void mysrand(unsigned int seed) {
                  next = seed;
              }

          The following program can be used to display the pseudo-random
          sequence produced by rand() when given a particular seed.

              #include <stdlib.h>
              #include <stdio.h>

              int
              main(int argc, char *argv[])
              {
                  int r, nloops;
                  unsigned int seed;

                  if (argc != 3) {
                      fprintf(stderr, "Usage: %s <seed> <nloops>\n", argv[0]);
                      exit(EXIT_FAILURE);
                  }

                  seed = atoi(argv[1]);
                  nloops = atoi(argv[2]);

                  srand(seed);
                  for (int j = 0; j < nloops; j++) {
                      r =  rand();
                      printf("%d\n", r);
                  }

                  exit(EXIT_SUCCESS);
              }


---------------------------------------------------------

::

          drand48(3), random(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        RAND(3)

--------------

Pages that refer to this page: `mcookie(1) <../man1/mcookie.1.html>`__, 
`drand48(3) <../man3/drand48.3.html>`__, 
`drand48_r(3) <../man3/drand48_r.3.html>`__, 
`random(3) <../man3/random.3.html>`__, 
`random_r(3) <../man3/random_r.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/rand.3.license.html>`__

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
