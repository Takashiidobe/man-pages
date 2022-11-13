.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_get_tag_type(3) — Linux manual page
=======================================

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

   ACL_GET_TAG_TYPE(3)   BSD Library Functions Manual   ACL_GET_TAG_TYPE(3)

NAME
-------------------------------------------------

::

        acl_get_tag_type — get the tag type of an ACL entry


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <sys/acl.h>

        int
        acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p);


---------------------------------------------------------------

::

        The acl_get_tag_type() function assigns to the value pointed to by
        tag_type_p the tag type for the ACL entry indicated by the argument
        entry_d.

        The argument entry_d and any other ACL entry descriptors that refer
        to entries in the same ACL continue to refer to those entries. The
        order of all existing entries in the ACL remain unchanged.


-----------------------------------------------------------------

::

        The acl_get_tag_type() function returns the value 0 if successful;
        otherwise the value -1 is returned and the global variable errno is
        set to indicate the error.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_get_tag_type()
        function returns -1 and sets errno to the corresponding value:

        [EINVAL]           The argument entry_d is not a valid descriptor
                           for an ACL entry.


-----------------------------------------------------------

::

        IEEE Std 1003.1e draft 17 (“POSIX.1e”, abandoned)


---------------------------------------------------------

::

        acl_create_entry(3), acl_get_entry(3), acl_get_permset(3),
        acl_get_qualifier(3), acl_set_permset(3), acl_set_qualifier(3),
        acl_set_tag_type(3), acl(5)


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
