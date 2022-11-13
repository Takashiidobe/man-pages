.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stapex(3stap) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LANG                             |                                   |
| UAGE BASICS <#LANGUAGE_BASICS>`__ |                                   |
| \| `PROBING <#PROBING>`__ \|      |                                   |
| `                                 |                                   |
| MORE EXAMPLES <#MORE_EXAMPLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPEX(3stap)                                              STAPEX(3stap)

NAME
-------------------------------------------------

::

          stapex - systemtap examples


-----------------------------------------------------------------------

::

          These examples give a feel for basic systemtap syntax and control
          structures.

                 global odds, evens

                 probe begin {
                   # "no" and "ne" are local integers
                   for (i=0; i<10; i++) {
                     if (i % 2) odds [no++] = i
                     else evens [ne++] = i
                   }
                   delete odds[2]
                   delete evens[3]
                   exit ()
                 }

                 probe end {
                   foreach (x+ in odds) {
                     printf ("odds[%d] = %d\n", x, odds[x])
                   }
                   foreach (x in evens-) {
                     printf ("evens[%d] = %d\n", x, evens[x])
                   }
                 }

          This prints:

                 odds[1] = 1
                 odds[3] = 5
                 odds[4] = 7
                 odds[5] = 9
                 evens[5] = 8
                 evens[4] = 6
                 evens[2] = 2
                 evens[1] = 0

          Note that all variables types are inferred, and that all locals
          and globals are automatically initialized.

          This script prints the primes between 0 and 49.

                 function isprime (x) {
                   if (x < 2) return 0
                   for (i=2; i<x; i++) {
                     if (x % i == 0) return 0
                     if (i * i > x) break
                   }
                   return 1
                 }
                 probe begin {
                   for (i=0; i<50; i++)
                     if (isprime (i)) printf("%d\n", i)
                   exit()
                 }

          This script demonstrates recursive functions.

                 function fibonacci(i) {
                   if (i < 1) error ("bad number")
                   if (i == 1) return 1
                   if (i == 2) return 2
                   return fibonacci (i-1) + fibonacci (i-2)
                 }
                 probe begin {
                   printf ("11th fibonacci number: %d\n", fibonacci (11))
                   exit ()
                 }

          Any larger number may exceed the MAXACTION or MAXNESTING limits,
          and result in an error.


-------------------------------------------------------

::

          To trace entry and exit from a function, use a pair of probes:

                 probe kernel.function("sys_mkdir") { println ("enter") }
                 probe kernel.function("sys_mkdir").return { println ("exit") }

          To list the probeable functions in the kernel, use the listings
          mode.

                 % stap -l 'kernel.function("*")'

          To list the probeable functions and local variables in the
          kernel, use another listings mode.

                 % stap -L 'kernel.function("*")'


-------------------------------------------------------------------

::

          The directory to find more examples can be found in the stappaths
          (7) manual page, and online at
          http://sourceware.org/systemtap/examples/ 


---------------------------------------------------------

::

          stap(1)
          stapprobes(3stap)
          stappaths(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                              STAPEX(3stap)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__, 
`stap-merge(1) <../man1/stap-merge.1.html>`__, 
`stappaths(7) <../man7/stappaths.7.html>`__, 
`stapbpf(8) <../man8/stapbpf.8.html>`__, 
`stapdyn(8) <../man8/stapdyn.8.html>`__, 
`staprun(8) <../man8/staprun.8.html>`__, 
`stap-server(8) <../man8/stap-server.8.html>`__

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
