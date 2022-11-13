.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

error::pass2(7stap) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GATHERING MORE INFORMATION       |                                   |
|  <#GATHERING_MORE_INFORMATION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERROR::PASS2(7stap)                                  ERROR::PASS2(7stap)

NAME
-------------------------------------------------

::

          error::pass2 - systemtap pass-2 errors


---------------------------------------------------------------

::

          Errors that occur during pass 2 (elaboration) can have a variety
          of causes.  Common types include:

          missing debuginfo
                 The script requires debuginfo to resolve a probe point,
                 but could not find any.  See error::dwarf(7stap) and
                 warning::debuginfo(7stap) for more details.

          unavailable probe point classes
                 Some types of probe points are only available on certain
                 system versions, architectures, and configurations.  For
                 example, user-space process.*  probes may require utrace
                 or uprobes capability in the kernel for this architecture.

          unavailable probe points
                 Some probe points may be individually unavailable even
                 when their class is fine.  For example,
                 kprobe.function("foobar") may fail if function foobar does
                 not exist in the kernel any more.  Debugging or symbol
                 data may be absent for some types of .function or
                 .statement probes; check for availability of debuginfo.
                 Try the stap-prep program to download possibly-required
                 debuginfo.  Use a wildcard parameter such as stap -l
                 'kprobe.function("*foo*")' to locate still-existing
                 variants.  Use ! or ?  probe point suffixes to denote
                 optional / preferred-alternatives, to let the working
                 parts of a script continue.

          typos  There might be a spelling error in the probe point name
                 ("sycsall" vs.  "syscall").  Wildcard probes may not find
                 a match at all in the tapsets.  Recheck the names using
                 stap -l PROBEPOINT.  Another common mistake is to use the
                 .  operator instead of the correct -> when dereferencing
                 context variable subfields or pointers: $foo->bar->baz
                 even if in C one would say foo->bar.baz.

          unavailable context variables
                 Systemtap scripts often wish to refer to variables from
                 the context of the probed programs using $variable
                 notation.  These variables may not always be available,
                 depending on versions of the compiler,
                 debugging/optimization flags used, architecture, etc.  Use
                 stap -L PROBEPOINT to list available context variables for
                 given probes.  Use the @defined() expression to test for
                 the resolvability of a context variable expression.
                 Consider using the stap --skip-badvars option to silently
                 replace misbehaving context variable expressions with
                 zero.  Experiment with the stap --prologue-searching
                 option.

          module cache inconsistencies
                 Occasionally, the systemtap module cache
                 ($HOME/.systemtap/cache) might contain obsolete
                 information from a prior system configuration/version, and
                 produce false results as systemtap attempts to reuse it.
                 Retrying with stap --poison-cache ...  forces new
                 information to be generated.  Note: this should not happen
                 and likely represents a systemtap bug.  Please report it.


---------------------------------------------------------------------------------------------

::

          Increasing the verbosity of pass-2 with an option such as --vp 02
          can help pinpoint the problem.


---------------------------------------------------------

::

          stap(1),
          stap-prep(1),
          stapprobes(3stap),
          probe::*(3stap),
          error::dwarf(7stap),
          error::inode-uprobes(7stap),
          warning::debuginfo(7stap),
          error::reporting(7stap)

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

                                                        ERROR::PASS2(7stap)

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
