.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getentropy(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETENTROPY(3)           Linux Programmer's Manual          GETENTROPY(3)

NAME
-------------------------------------------------

::

          getentropy - fill a buffer with random bytes


---------------------------------------------------------

::

          #include <unistd.h>

          int getentropy(void *buffer, size_t length);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getentropy():
              _DEFAULT_SOURCE


---------------------------------------------------------------

::

          The getentropy() function writes length bytes of high-quality
          random data to the buffer starting at the location pointed to by
          buffer.  The maximum permitted value for the length argument is
          256.

          A successful call to getentropy() always provides the requested
          number of bytes of entropy.


-----------------------------------------------------------------

::

          On success, this function returns zero.  On error, -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT Part or all of the buffer specified by buffer and length
                 is not in valid addressable memory.

          EIO    length is greater than 256.

          EIO    An unspecified error occurred while trying to overwrite
                 buffer with random data.

          ENOSYS This kernel version does not implement the getrandom(2)
                 system call required to implement this function.


---------------------------------------------------------

::

          The getentropy() function first appeared in glibc 2.25.


-------------------------------------------------------------------

::

          This function is nonstandard.  It is also present on OpenBSD.


---------------------------------------------------

::

          The getentropy() function is implemented using getrandom(2).

          Whereas the glibc wrapper makes getrandom(2) a cancellation
          point, getentropy() is not a cancellation point.

          getentropy() is also declared in <sys/random.h>.  (No feature
          test macro need be defined to obtain the declaration from that
          header file.)

          A call to getentropy() may block if the system has just booted
          and the kernel has not yet collected enough randomness to
          initialize the entropy pool.  In this case, getentropy() will
          keep blocking even if a signal is handled, and will return only
          once the entropy pool has been initialized.


---------------------------------------------------------

::

          getrandom(2), urandom(4), random(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  GETENTROPY(3)

--------------

Pages that refer to this page:
`getrandom(2) <../man2/getrandom.2.html>`__, 
`random(7) <../man7/random.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/getentropy.3.license.html>`__

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
