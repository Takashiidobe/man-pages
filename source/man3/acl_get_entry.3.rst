.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_get_entry(3) — Linux manual page
====================================

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

   ACL_GET_ENTRY(3)      BSD Library Functions Manual      ACL_GET_ENTRY(3)

NAME
-------------------------------------------------

::

        acl_get_entry — get an ACL entry


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <sys/acl.h>

        int
        acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p);


---------------------------------------------------------------

::

        The acl_get_entry() function obtains a descriptor for an ACL entry
        as specified by entry_id within the ACL indicated by the argument
        acl.  If the value of entry_id is ACL_FIRST_ENTRY, then the
        function returns in entry_p a descriptor for the first ACL entry
        within acl.  If the value of entry_id is ACL_NEXT_ENTRY, then the
        function returns in entry_p a descriptor for the next ACL entry
        within acl.

        If a call is made to acl_get_entry() with entry_id set to
        ACL_NEXT_ENTRY when there has not been either an initial successful
        call to acl_get_entry(), or a previous successful call to
        acl_get_entry() following a call to acl_calc_mask(),
        acl_copy_int(), acl_create_entry(), acl_delete_entry(), acl_dup(),
        acl_from_text(), acl_get_fd(), acl_get_file(), acl_set_fd(),
        acl_set_file(), or acl_valid(), then the effect is unspecified.

        Calls to acl_get_entry() do not modify any ACL entries. Subsequent
        operations using the returned ACL entry descriptor operate on the
        ACL entry within the ACL in working storage. The order of all
        existing entries in the ACL remains unchanged.  Any existing ACL
        entry descriptors that refer to entries within the ACL continue to
        refer to those entries. Any existing ACL pointers that refer to the
        ACL referred to by acl continue to refer to the ACL.


-----------------------------------------------------------------

::

        If the function successfully obtains an ACL entry, the function
        returns a value of 1.  If the ACL has no ACL entries, the function
        returns the value 0.  If the value of entry_id is ACL_NEXT_ENTRY
        and the last ACL entry in the ACL has already been returned by a
        previous call to acl_get_entry(), the function returns the value 0
        until a successful call with an entry_id of ACL_FIRST_ENTRY is
        made. Otherwise, the value -1 is returned and errno is set to
        indicate the error.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_get_entry()
        function returns -1 and sets errno to the corresponding value:

        [EINVAL]           The argument acl_p is not a valid pointer to an
                           ACL.

                           The argument entry_id is neither ACL_NEXT_ENTRY
                           nor ACL_FIRST_ENTRY.


-----------------------------------------------------------

::

        IEEE Std 1003.1e draft 17 (“POSIX.1e”, abandoned)


---------------------------------------------------------

::

        acl_calc_mask(3), acl_create_entry(3), acl_copy_entry(3),
        acl_delete_entry(3), acl_get_file(3), acl(5)


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
