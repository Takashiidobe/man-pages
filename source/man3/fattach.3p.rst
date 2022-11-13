.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fattach(3p) — Linux manual page
===============================

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

   FATTACH(3P)             POSIX Programmer's Manual            FATTACH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fattach — attach a STREAMS-based file descriptor to a file in the
          file system name space (STREAMS)


---------------------------------------------------------

::

          #include <stropts.h>

          int fattach(int fildes, const char *path);


---------------------------------------------------------------

::

          The fattach() function shall attach a STREAMS-based file
          descriptor to a file, effectively associating a pathname with
          fildes.  The application shall ensure that the fildes argument is
          a valid open file descriptor associated with a STREAMS file. The
          path argument points to a pathname of an existing file. The
          application shall have appropriate privileges or be the owner of
          the file named by path and have write permission. A successful
          call to fattach() shall cause all pathnames that name the file
          named by path to name the STREAMS file associated with fildes,
          until the STREAMS file is detached from the file. A STREAMS file
          can be attached to more than one file and can have several
          pathnames associated with it.

          The attributes of the named STREAMS file shall be initialized as
          follows: the permissions, user ID, group ID, and times are set to
          those of the file named by path, the number of links is set to 1,
          and the size and device identifier are set to those of the
          STREAMS file associated with fildes.  If any attributes of the
          named STREAMS file are subsequently changed (for example, by
          chmod()), neither the attributes of the underlying file nor the
          attributes of the STREAMS file to which fildes refers shall be
          affected.

          File descriptors referring to the underlying file, opened prior
          to an fattach() call, shall continue to refer to the underlying
          file.


-----------------------------------------------------------------

::

          Upon successful completion, fattach() shall return 0. Otherwise,
          -1 shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The fattach() function shall fail if:

          EACCES Search permission is denied for a component of the path
                 prefix, or the process is the owner of path but does not
                 have write permissions on the file named by path.

          EBADF  The fildes argument is not a valid open file descriptor.

          EBUSY  The file named by path is currently a mount point or has a
                 STREAMS file attached to it.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of path does not name an existing file or path
                 is an empty string.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory,
                 or the path argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters.

          EPERM  The effective user ID of the process is not the owner of
                 the file named by path and the process does not have
                 appropriate privileges.

          The fattach() function may fail if:

          EINVAL The fildes argument does not refer to a STREAMS file.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          EXDEV  A link to a file on another file system was attempted.

          The following sections are informative.


---------------------------------------------------------

::

      Attaching a File Descriptor to a File
          In the following example, fd refers to an open STREAMS file. The
          call to fattach() associates this STREAM with the file
          /tmp/named-STREAM, such that any future calls to open /tmp/named-
          STREAM, prior to breaking the attachment via a call to fdetach(),
          will instead create a new file handle referring to the STREAMS
          file associated with fd.

              #include <stropts.h>
              ...
                  int fd;
                  char *pathname = "/tmp/named-STREAM";
                  int ret;

                  ret = fattach(fd, pathname);


---------------------------------------------------------------------------

::

          The fattach() function behaves similarly to the traditional
          mount() function in the way a file is temporarily replaced by the
          root directory of the mounted file system. In the case of
          fattach(), the replaced file need not be a directory and the
          replacing file is a STREAMS file.


-----------------------------------------------------------

::

          The file attributes of a file which has been the subject of an
          fattach() call are specifically set because of an artifact of the
          original implementation. The internal mechanism was the same as
          for the mount() function. Since mount() is typically only applied
          to directories, the effects when applied to a regular file are a
          little surprising, especially as regards the link count which
          rigidly remains one, even if there were several links originally
          and despite the fact that all original links refer to the STREAM
          as long as the fattach() remains in effect.


---------------------------------------------------------------------------

::

          The fattach() function may be removed in a future version.


---------------------------------------------------------

::

          fdetach(3p), isastream(3p)

          The Base Definitions volume of POSIX.1‐2017, stropts.h(0p)


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

   IEEE/The Open Group               2017                       FATTACH(3P)

--------------

Pages that refer to this page:
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`fdetach(3p) <../man3/fdetach.3p.html>`__

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
