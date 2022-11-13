.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_extended_fd(3) — Linux manual page
======================================

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

   ACL_EXTENDED_FD(3)    BSD Library Functions Manual    ACL_EXTENDED_FD(3)

NAME
-------------------------------------------------

::

        acl_extended_fd — test for information in the ACL by file
        descriptor


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <acl/libacl.h>

        int
        acl_extended_fd(int fd);


---------------------------------------------------------------

::

        The acl_extended_fd() function returns 1 if the file identified by
        the argument fd is associated with an extended access ACL. The
        function returns 0 if the file does not have an extended access
        ACL.

        An extended ACL is an ACL that contains entries other than the
        three required entries of tag types ACL_USER_OBJ, ACL_GROUP_OBJ and
        ACL_OTHER.  If the result of the acl_extended_fd() function for a
        file object is 0, then the ACL defines no discretionary access
        rights other than those already defined by the traditional file
        permission bits.

        Access to the file object may be further restricted by other
        mechanisms, such as Mandatory Access Control schemes. The access(2)
        system call can be used to check whether a given type of access to
        a file object would be granted.


-----------------------------------------------------------------

::

        If successful, the acl_extended_fd() function returns 1 if the file
        object identified by fd has an extended access ACL, and 0 if the
        file object identified by fd does not have an extended access ACL.
        Otherwise, the value -1 is returned and the global variable errno
        is set to indicate the error.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_extended_fd()
        function returns -1 and sets errno to the corresponding value:

        [EBADF]            The fd argument is not a valid file descriptor.

        [ENOTSUP]          The file system on which the file identified by
                           fd is located does not support ACLs, or ACLs are
                           disabled.


-----------------------------------------------------------

::

        This is a non-portable, Linux specific extension to the ACL
        manipulation functions defined in IEEE Std 1003.1e draft 17
        (“POSIX.1e”, abandoned).


---------------------------------------------------------

::

        access(2), acl_get_fd(3), acl(5)


-----------------------------------------------------

::

        Written by Andreas Gruenbacher <andreas.gruenbacher@gmail.com>.

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
