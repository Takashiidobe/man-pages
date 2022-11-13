.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_get_file(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ACL_GET_FILE(3)       BSD Library Functions Manual       ACL_GET_FILE(3)

NAME
-------------------------------------------------

::

        acl_get_file — get an ACL by filename


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <sys/acl.h>

        acl_t
        acl_get_file(const char *path_p, acl_type_t type);


---------------------------------------------------------------

::

        The acl_get_file() function retrieves the access ACL associated
        with a file or directory, or the default ACL associated with a
        directory. The pathname for the file or directory is pointed to by
        the argument path_p.  The ACL is placed into working storage and
        acl_get_file() returns a pointer to that storage.

        In order to read an ACL from an object, a process must have read
        access to the object's attributes.

        The value of the argument type is used to indicate whether the
        access ACL or the default ACL associated with path_p is returned.
        If type is ACL_TYPE_ACCESS, the access ACL of path_p is returned.
        If type is ACL_TYPE_DEFAULT, the default ACL of path_p is returned.
        If type is ACL_TYPE_DEFAULT and no default ACL is associated with
        the directory path_p, then an ACL containing zero ACL entries is
        returned. If type specifies a type of ACL that cannot be associated
        with path_p, then the function fails.

        This function may cause memory to be allocated.  The caller should
        free any releasable memory, when the new ACL is no longer required,
        by calling acl_free(3) with the (void*)acl_t returned by
        acl_get_file() as an argument.


-----------------------------------------------------------------

::

        On success, this function returns a pointer to the working storage.
        On error, a value of (acl_t)NULL is returned, and errno is set
        appropriately.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_get_file()
        function returns a value of (acl_t)NULL and sets errno to the
        corresponding value:

        [EACCES]           Search permission is denied for a component of
                           the path prefix or the object exists and the
                           process does not have appropriate access rights.

                           Argument type specifies a type of ACL that
                           cannot be associated with path_p.

        [EINVAL]           The argument type is not ACL_TYPE_ACCESS or
                           ACL_TYPE_DEFAULT.

        [ENAMETOOLONG]     The length of the argument path_p is too long.

        [ENOENT]           The named object does not exist or the argument
                           path_p points to an empty string.

        [ENOMEM]           The ACL working storage requires more memory
                           than is allowed by the hardware or system-
                           imposed memory management constraints.

        [ENOTDIR]          A component of the path prefix is not a
                           directory.

        [ENOTSUP]          The file system on which the file identified by
                           path_p is located does not support ACLs, or ACLs
                           are disabled.


-----------------------------------------------------------

::

        IEEE Std 1003.1e draft 17 (“POSIX.1e”, abandoned)


---------------------------------------------------------

::

        acl_free(3), acl_get_entry(3), acl_get_fd(3), acl_set_file(3),
        acl(5)


-----------------------------------------------------

::

        Derived from the FreeBSD manual pages written by Robert N M Watson
        <rwatson@FreeBSD.org>, and adapted for Linux by Andreas Gruenbacher
        <andreas.gruenbacher@gmail.com>.

COLOPHON
---------------------------------------------------------

::

        This page is part of the acl (manipulating access control lists)
        project.  Information about the project can be found at
        http://savannah.nongnu.org/projects/acl.  If you have a bug report
        for this manual page, see
        ⟨http://savannah.nongnu.org/bugs/?group=acl⟩.  This page was
        obtained from the project's upstream Git repository
        ⟨git://git.savannah.nongnu.org/acl.git⟩ on 2021-08-27.  (At that
        time, the date of the most recent commit that was found in the
        repository was 2021-03-16.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   Linux ACL                    March 23, 2002                    Linux ACL

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
