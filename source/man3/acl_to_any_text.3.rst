.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl_to_any_text(3) — Linux manual page
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

   ACL_TO_ANY_TEXT(3)    BSD Library Functions Manual    ACL_TO_ANY_TEXT(3)

NAME
-------------------------------------------------

::

        acl_to_any_text — convert an ACL to text


-------------------------------------------------------

::

        Linux Access Control Lists library (libacl, -lacl).


---------------------------------------------------------

::

        #include <sys/types.h>
        #include <acl/libacl.h>

        char *
        acl_to_any_text(acl_t acl, const char *prefix, char separator,
            int options);


---------------------------------------------------------------

::

        The acl_to_any_text() function translates the ACL pointed to by the
        argument acl into a NULL terminated character string. This
        character string is composed of the ACL entries contained in acl,
        in the entry text format described on acl(5).  Entries are
        separated from each other by the separator character. If the
        argument prefix is not (const char *)NULL, each entry is prefixed
        by this character string.

        If the argument options is 0, ACL entries are converted using the
        entry tag type keywords user, group, mask, and other.  User IDs and
        group IDs of ACL entries that contain such qualifiers are converted
        to their corresponding names; if an identifier has no corresponding
        name, a decimal number string is produced. The ACL text
        representation contains no additional comments.  A bitwise
        combinations of the following options can be used to modify the
        result:

        TEXT_ABBREVIATE
                Instead of the full tag type keywords, single letter
                abbreviations are used.  The abbreviation for user is u,
                the abbreviation for group is g, the abbreviation for mask
                is m, and the abbreviation for other is o.

        TEXT_NUMERIC_IDS
                User IDs and group IDs are included as decimal numbers
                instead of names.

        TEXT_SOME_EFFECTIVE
                A comment containing the effective permissions of the ACL
                entry is included after ACL entries that contain
                permissions which are ineffective because they are masked
                by an ACL_MASK entry. The ACL entry and the comment are
                separated by a tab character.

        TEXT_ALL_EFFECTIVE
                A comment containing the effective permissions of the ACL
                entry is included after all ACL entries that are affected
                by an ACL_MASK entry.  The comment is included even if the
                permissions contained in the ACL entry equal the effective
                permissions. The ACL entry and the comment are separated by
                a tab character.

        TEXT_SMART_INDENT
                This option is used in combination with the
                TEXT_SOME_EFFECTIVE or TEXT_ALL_EFFECTIVE option. The
                number of tab characters inserted between the ACL entry and
                the comment is increased so that the comment is aligned to
                the fourth tab stop position.  A tab width of 8 characters
                is assumed.

        The ACL referred to by acl is not changed.

        This function allocates any memory necessary to contain the string
        and returns a pointer to the string.  The caller should free any
        releasable memory, when the new string is no longer required, by
        calling acl_free() with the (void*)char returned by
        acl_to_any_text() as an argument.


-----------------------------------------------------------------

::

        On success, this function returns a pointer to the text
        representation of the ACL.  On error, a value of (char *)NULL is
        returned, and errno is set appropriately.


-----------------------------------------------------

::

        If any of the following conditions occur, the acl_to_any_text()
        function returns a value of (char *)NULL and sets errno to the
        corresponding value:

        [EINVAL]           The argument acl is not a valid pointer to an
                           ACL.

                           The ACL referenced by acl contains one or more
                           improperly formed ACL entries, or for some other
                           reason cannot be translated into the text form
                           of an ACL.

        [ENOMEM]           The character string to be returned requires
                           more memory than is allowed by the hardware or
                           system-imposed memory management constraints.


-----------------------------------------------------------

::

        This is a non-portable, Linux specific extension to the ACL
        manipulation functions defined in IEEE Std 1003.1e draft 17
        (“POSIX.1e”, abandoned).


---------------------------------------------------------

::

        acl_from_text(3), acl_to_text(3), acl_free(3), acl(5)


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

   Linux ACL                    March 25, 2002                    Linux ACL

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
