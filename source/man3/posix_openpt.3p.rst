.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_openpt(3p) — Linux manual page
====================================

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

   POSIX_OPENPT(3P)        POSIX Programmer's Manual       POSIX_OPENPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_openpt — open a pseudo-terminal device


---------------------------------------------------------

::

          #include <stdlib.h>
          #include <fcntl.h>

          int posix_openpt(int oflag);


---------------------------------------------------------------

::

          The posix_openpt() function shall establish a connection between
          a master device for a pseudo-terminal and a file descriptor. The
          file descriptor shall be allocated as described in Section 2.14,
          File Descriptor Allocation and can be used by other I/O functions
          that refer to that pseudo-terminal.

          The file status flags and file access modes of the open file
          description shall be set according to the value of oflag.

          Values for oflag are constructed by a bitwise-inclusive OR of
          flags from the following list, defined in <fcntl.h>:

          O_RDWR      Open for reading and writing.

          O_NOCTTY    If set posix_openpt() shall not cause the terminal
                      device to become the controlling terminal for the
                      process.

          The behavior of other values for the oflag argument is
          unspecified.


-----------------------------------------------------------------

::

          Upon successful completion, the posix_openpt() function shall
          open a file descriptor for a master pseudo-terminal device and
          return a non-negative integer representing the file descriptor.
          Otherwise, -1 shall be returned and errno set to indicate the
          error.


-----------------------------------------------------

::

          The posix_openpt() function shall fail if:

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE The maximum allowable number of files is currently open in
                 the system.

          The posix_openpt() function may fail if:

          EINVAL The value of oflag is not valid.

          EAGAIN Out of pseudo-terminal resources.

          ENOSR  Out of STREAMS resources.

          The following sections are informative.


---------------------------------------------------------

::

      Opening a Pseudo-Terminal and Returning the Name of the Slave Device
          and a File Descriptor
              #include <fcntl.h>
              #include <stdio.h>

              int masterfd, slavefd;
              char *slavedevice;

              masterfd = posix_openpt(O_RDWR|O_NOCTTY);

              if (masterfd == -1
                  || grantpt (masterfd) == -1
                  || unlockpt (masterfd) == -1
                  || (slavedevice = ptsname (masterfd)) == NULL)
                  return -1;

              printf("slave device is: %s\n", slavedevice);

              slavefd = open(slavedevice, O_RDWR|O_NOCTTY);
              if (slavefd < 0)
                  return -1;


---------------------------------------------------------------------------

::

          This function is a method for portably obtaining a file
          descriptor of a master terminal device for a pseudo-terminal. The
          grantpt() and ptsname() functions can be used to manipulate mode
          and ownership permissions, and to obtain the name of the slave
          device, respectively.


-----------------------------------------------------------

::

          The standard developers considered the matter of adding a special
          device for cloning master pseudo-terminals: the /dev/ptmx device.
          However, consensus could not be reached, and it was felt that
          adding a new function would permit other implementations. The
          posix_openpt() function is designed to complement the grantpt(),
          ptsname(), and unlockpt() functions.

          On implementations supporting the /dev/ptmx clone device, opening
          the master device of a pseudo-terminal is simply:

              mfdp = open("/dev/ptmx", oflag );
              if (mfdp < 0)
                  return -1;


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, File Descriptor Allocation, grantpt(3p), open(3p),
          ptsname(3p), unlockpt(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          stdlib.h(0p)


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

   IEEE/The Open Group               2017                  POSIX_OPENPT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`grantpt(3p) <../man3/grantpt.3p.html>`__, 
`ptsname(3p) <../man3/ptsname.3p.html>`__, 
`unlockpt(3p) <../man3/unlockpt.3p.html>`__

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
