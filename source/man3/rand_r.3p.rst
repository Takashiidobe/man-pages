.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rand(3p) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RAND(3P)                POSIX Programmer's Manual               RAND(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          rand, rand_r, srand — pseudo-random number generator


---------------------------------------------------------

::

          #include <stdlib.h>

          int rand(void);
          int rand_r(unsigned *seed);
          void srand(unsigned seed);


---------------------------------------------------------------

::

          For rand() and srand(): The functionality described on this
          reference page is aligned with the ISO C standard. Any conflict
          between the requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The rand() function shall compute a sequence of pseudo-random
          integers in the range [0,{RAND_MAX}] with a period of at least
          232.

          The rand() function need not be thread-safe.

          The rand_r() function shall compute a sequence of pseudo-random
          integers in the range [0,{RAND_MAX}].  (The value of the
          {RAND_MAX} macro shall be at least 32767.)

          If rand_r() is called with the same initial value for the object
          pointed to by seed and that object is not modified between
          successive returns and calls to rand_r(), the same sequence shall
          be generated.

          The srand() function uses the argument as a seed for a new
          sequence of pseudo-random numbers to be returned by subsequent
          calls to rand().  If srand() is then called with the same seed
          value, the sequence of pseudo-random numbers shall be repeated.
          If rand() is called before any calls to srand() are made, the
          same sequence shall be generated as when srand() is first called
          with a seed value of 1.

          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017 calls rand() or srand().


-----------------------------------------------------------------

::

          The rand() function shall return the next pseudo-random number in
          the sequence.

          The rand_r() function shall return a pseudo-random integer.

          The srand() function shall not return a value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Generating a Pseudo-Random Number Sequence
          The following example demonstrates how to generate a sequence of
          pseudo-random numbers.

              #include <stdio.h>
              #include <stdlib.h>
              ...
                  long count, i;
                  char *keystr;
                  int elementlen, len;
                  char c;
              ...
              /* Initial random number generator. */
                  srand(1);

                  /* Create keys using only lowercase characters */
                  len = 0;
                  for (i=0; i<count; i++) {
                      while (len < elementlen) {
                          c = (char) (rand() % 128);
                          if (islower(c))
                              keystr[len++] = c;
                      }

                      keystr[len] = '\0';
                      printf("%s Element%0*ld\n", keystr, elementlen, i);
                      len = 0;
                  }

      Generating the Same Sequence on Different Machines
          The following code defines a pair of functions that could be
          incorporated into applications wishing to ensure that the same
          sequence of numbers is generated across different machines.

              static unsigned long next = 1;
              int myrand(void)  /* RAND_MAX assumed to be 32767. */
              {
                  next = next * 1103515245 + 12345;
                  return((unsigned)(next/65536) % 32768);
              }

              void mysrand(unsigned seed)
              {
                  next = seed;
              }


---------------------------------------------------------------------------

::

          The drand48() and random() functions provide much more elaborate
          pseudo-random number generators.

          The limitations on the amount of state that can be carried
          between one function call and another mean the rand_r() function
          can never be implemented in a way which satisfies all of the
          requirements on a pseudo-random number generator.

          These functions should be avoided whenever non-trivial
          requirements (including safety) have to be fulfilled.


-----------------------------------------------------------

::

          The ISO C standard rand() and srand() functions allow per-process
          pseudo-random streams shared by all threads. Those two functions
          need not change, but there has to be mutual-exclusion that
          prevents interference between two threads concurrently accessing
          the random number generator.

          With regard to rand(), there are two different behaviors that may
          be wanted in a multi-threaded program:

           1. A single per-process sequence of pseudo-random numbers that
              is shared by all threads that call rand()

           2. A different sequence of pseudo-random numbers for each thread
              that calls rand()

          This is provided by the modified thread-safe function based on
          whether the seed value is global to the entire process or local
          to each thread.

          This does not address the known deficiencies of the rand()
          function implementations, which have been approached by
          maintaining more state. In effect, this specifies new thread-safe
          forms of a deficient function.


---------------------------------------------------------------------------

::

          The rand_r() function may be removed in a future version.


---------------------------------------------------------

::

          drand48(3p), initstate(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                          RAND(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`drand48(3p) <../man3/drand48.3p.html>`__, 
`initstate(3p) <../man3/initstate.3p.html>`__, 
`srand(3p) <../man3/srand.3p.html>`__

--------------

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
