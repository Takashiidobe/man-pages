.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmprintf(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPRINTF(3)             Library Functions Manual             PMPRINTF(3)

NAME
-------------------------------------------------

::

          pmprintf, pmflush - print formatted output in a window or to
          standard error


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmprintf(const char *fmt, ... /*args*/);
          int pmflush(void);

          cc ... -lpcp


---------------------------------------------------------------

::

          The combination of pmprintf and pmflush produces output in either
          an xconfirm(1) window, on the standard error stream, or to a file
          in a manner similar to fprintf(3).  The fmt argument is used to
          control the conversion, formatting, and printing of the variable
          length args list.  The output technique is controlled via an
          environment variable.

          pmprintf appends the formatted message string to an internal
          buffer shared by the two routines, without actually producing any
          output.

          pmflush causes the internal buffer to be either displayed in a
          window, printed on standard error, or flushed to a file and the
          internal buffer to be cleared.


---------------------------------------------------------------

::

          On successful completion, pmprintf returns the number of
          characters transmitted, while pmflush returns a value of zero on
          successful completion.

          For either routine, a negative value is returned if an error was
          encountered, and this can be passed to pmErrStr(3) to obtain the
          associated error message.


---------------------------------------------------

::

          pmprintf uses the mkstemp(3) function to create a temporary file.
          This temporary file is deleted when pmflush is called.


---------------------------------------------------------------

::

          The environment variable PCP_STDERR controls the output technique
          used by pmflush:

              If PCP_STDERR is unset, the text is written onto the stderr
              stream of the caller.

              If PCP_STDERR is set to the literal reserved word DISPLAY
              then the text will be displayed as a GUI dialog using
              xconfirm(1).

              If PCP_STDERR is set to any other value then pmflush
              interprets the value as a file name and appends the text to
              that file.  The file is created if it doesn't already exist,
              and in this case if the file creation fails, then stderr is
              used instead).


---------------------------------------------------------

::

          pmdbg(1), fprintf(3), mkstemp(3), pmErrStr(3) and PMAPI(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                       PMPRINTF(3)

--------------

Pages that refer to this page:
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmloadderivedconfig(3) <../man3/pmloadderivedconfig.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmsprintf(3) <../man3/pmsprintf.3.html>`__, 
`QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
`QmcDesc(3) <../man3/QmcDesc.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__, 
`QmcMetric(3) <../man3/QmcMetric.3.html>`__, 
`QmcSource(3) <../man3/QmcSource.3.html>`__

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
