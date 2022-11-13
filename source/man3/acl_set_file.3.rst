.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_set_file(3) — Linux manual page
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

   ACL_SET_FILE(3)       BSD Library Functions Manual       ACL_SET_FILE(3)

NAME
-------------------------------------------------

::

        acl_set_file — set an ACL by filename


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <sys/acl.h>

        int
        acl_set_file(const char *path_p, acl_type_t type, acl_t acl);


---------------------------------------------------------------

::

        The acl_set_file() function associates an access ACL with a file or
        directory, or associates a default ACL with a directory. The
        pathname for the file or directory is pointed to by the argument
        path_p.

        The effective user ID of the process must match the owner of the
        file or directory or the process must have the CAP_FOWNER
        capability for the request to succeed.

        The value of the argument type is used to indicate whether the
        access ACL or the default ACL associated with path_p is being set.
        If the type parameter is ACL_TYPE_ACCESS, the access ACL of path_p
        shall be set. If the type parameter is ACL_TYPE_DEFAULT, the
        default ACL of path_p shall be set. If the argument type specifies
        a type of ACL that cannot be associated with path_p, then the
        function fails.

        The acl parameter must reference a valid ACL according to the rules
        described on the acl_valid(3) manual page if the type parameter is
        ACL_TYPE_ACCESS, and must either reference a valid ACL or an ACL
        with zero ACL entries if the type parameter is ACL_TYPE_DEFAULT. If
        the acl parameter references an empty ACL, then the acl_set_file()
        function removes any default ACL associated with the directory
        referred to by the path_p parameter.


-----------------------------------------------------------------

::

        The acl_set_file() function returns the value 0 if successful;
        otherwise the value -1 is returned and the global variable errno is
        set to indicate the error.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_set_file()
        function returns -1 and sets errno to the corresponding value:

        [EACCES]           Search permission is denied for a component of
                           the path prefix or the object exists and the
                           process does not have appropriate access rights.

                           Argument type specifies a type of ACL that
                           cannot be associated with path_p.

        [EINVAL]           The argument acl does not point to a valid ACL.

                           The ACL has more entries than the file referred
                           to by path_p can obtain.

                           The type parameter is not ACL_TYPE_ACCESS or
                           ACL_TYPE_DEFAULT.

                           The type parameter is ACL_TYPE_DEFAULT, but the
                           file referred to by path_p is not a directory.

        [ENAMETOOLONG]     The length of the argument path_p is too long.

        [ENOENT]           The named object does not exist or the argument
                           path_p points to an empty string.

        [ENOSPC]           The directory or file system that would contain
                           the new ACL cannot be extended or the file
                           system is out of file allocation resources.

        [ENOTDIR]          A component of the path prefix is not a
                           directory.

        [ENOTSUP]          The file identified by path_p cannot be
                           associated with the ACL because the file system
                           on which the file is located does not support
                           this.

        [EPERM]            The process does not have appropriate privilege
                           to perform the operation to set the ACL.

        [EROFS]            This function requires modification of a file
                           system which is currently read-only.


-----------------------------------------------------------

::

        IEEE Std 1003.1e draft 17 (“POSIX.1e”, abandoned)

        The behavior of acl_set_file() when the acl parameter refers to an
        empty ACL and the type parameter is ACL_TYPE_DEFAULT is an
        extension in the Linux implementation, in order that all values
        returned by acl_get_file() can be passed to acl_set_file().  The
        POSIX.1e function for removing a default ACL is
        acl_delete_def_file().


---------------------------------------------------------

::

        acl_delete_def_file(3), acl_get_file(3), acl_set_fd(3),
        acl_valid(3), acl(5)


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
