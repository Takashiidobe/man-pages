.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acl(5) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ACL TYPES <#ACL_TYPES>`__ \|     |                                   |
| `ACL ENTRIES <#ACL_ENTRIES>`__ \| |                                   |
| `VALID ACLs <#VALID_ACLs>`__ \|   |                                   |
| `CORRESPONDENCE BETWEEN ACL       |                                   |
|  ENTRIES AND FILE PERMISSION BITS |                                   |
|  <#CORRESPONDENCE_BETWEEN_ACL_ENT |                                   |
| RIES_AND_FILE_PERMISSION_BITS>`__ |                                   |
| \|                                |                                   |
| `OBJEC                            |                                   |
| T CREATION AND DEFAULT ACLs <#OBJ |                                   |
| ECT_CREATION_AND_DEFAULT_ACLs>`__ |                                   |
| \|                                |                                   |
| `ACCESS CHECK ALGOR               |                                   |
| ITHM <#ACCESS_CHECK_ALGORITHM>`__ |                                   |
| \|                                |                                   |
| `AC                               |                                   |
| L TEXT FORMS <#ACL_TEXT_FORMS>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `CHANGES TO THE FILE UTILITIES <# |                                   |
| CHANGES_TO_THE_FILE_UTILITIES>`__ |                                   |
| \| `STANDARDS <#STANDARDS>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ACL(5)                   BSD File Formats Manual                  ACL(5)

NAME
-------------------------------------------------

::

        acl — Access Control Lists


---------------------------------------------------------------

::

        This manual page describes POSIX Access Control Lists, which are
        used to define more fine-grained discretionary access rights for
        files and directories.


-----------------------------------------------------------

::

        Every object can be thought of as having associated with it an ACL
        that governs the discretionary access to that object; this ACL is
        referred to as an access ACL. In addition, a directory may have an
        associated ACL that governs the initial access ACL for objects
        created within that directory; this ACL is referred to as a default
        ACL.


---------------------------------------------------------------

::

        An ACL consists of a set of ACL entries. An ACL entry specifies the
        access permissions on the associated object for an individual user
        or a group of users as a combination of read, write and
        search/execute permissions.

        An ACL entry contains an entry tag type, an optional entry tag
        qualifier, and a set of permissions.  We use the term qualifier to
        denote the entry tag qualifier of an ACL entry.

        The qualifier denotes the identifier of a user or a group, for
        entries with tag types of ACL_USER or ACL_GROUP, respectively.
        Entries with tag types other than ACL_USER or ACL_GROUP have no
        defined qualifiers.

        The following entry tag types are defined:

              ACL_USER_OBJ    The ACL_USER_OBJ entry denotes access rights
                              for the file owner.

              ACL_USER        ACL_USER entries denote access rights for
                              users identified by the entry's qualifier.

              ACL_GROUP_OBJ   The ACL_GROUP_OBJ entry denotes access rights
                              for the file group.

              ACL_GROUP       ACL_GROUP entries denote access rights for
                              groups identified by the entry's qualifier.

              ACL_MASK        The ACL_MASK entry denotes the maximum access
                              rights that can be granted by entries of type
                              ACL_USER, ACL_GROUP_OBJ, or ACL_GROUP.

              ACL_OTHER       The ACL_OTHER entry denotes access rights for
                              processes that do not match any other entry
                              in the ACL.

        When an access check is performed, the ACL_USER_OBJ and ACL_USER
        entries are tested against the effective user ID. The effective
        group ID, as well as all supplementary group IDs are tested against
        the ACL_GROUP_OBJ and ACL_GROUP entries.


-------------------------------------------------------------

::

        A valid ACL contains exactly one entry with each of the
        ACL_USER_OBJ, ACL_GROUP_OBJ, and ACL_OTHER tag types. Entries with
        ACL_USER and ACL_GROUP tag types may appear zero or more times in
        an ACL. An ACL that contains entries of ACL_USER or ACL_GROUP tag
        types must contain exactly one entry of the ACL_MASK tag type. If
        an ACL contains no entries of ACL_USER or ACL_GROUP tag types, the
        ACL_MASK entry is optional.

        All user ID qualifiers must be unique among all entries of ACL_USER
        tag type, and all group IDs must be unique among all entries of
        ACL_GROUP tag type.

          The acl_get_file() function returns an ACL with zero ACL entries
        as the default ACL of a directory, if the directory is not
        associated with a default ACL. The acl_set_file() function also
        accepts an ACL with zero ACL entries as a valid default ACL for
        directories, denoting that the directory shall not be associated
        with a default ACL. This is equivalent to using the
        acl_delete_def_file() function.


---------------------------------------------------------------------------------------------------------------------------------------------------------------

::

        The permissions defined by ACLs are a superset of the permissions
        specified by the file permission bits.

        There is a correspondence between the file owner, group, and other
        permissions and specific ACL entries: the owner permissions
        correspond to the permissions of the ACL_USER_OBJ entry. If the ACL
        has an ACL_MASK entry, the group permissions correspond to the
        permissions of the ACL_MASK entry.  Otherwise, if the ACL has no
        ACL_MASK entry, the group permissions correspond to the permissions
        of the ACL_GROUP_OBJ entry.  The other permissions correspond to
        the permissions of the ACL_OTHER_OBJ entry.

        The file owner, group, and other permissions always match the
        permissions of the corresponding ACL entry. Modification of the
        file permission bits results in the modification of the associated
        ACL entries, and modification of these ACL entries results in the
        modification of the file permission bits.


---------------------------------------------------------------------------------------------------------

::

        The access ACL of a file object is initialized when the object is
        created with any of the creat(), mkdir(), mknod(), mkfifo(), or
        open() functions. If a default ACL is associated with a directory,
        the mode parameter to the functions creating file objects and the
        default ACL of the directory are used to determine the ACL of the
        new object:

        1.   The new object inherits the default ACL of the containing
             directory as its access ACL.

        2.   The access ACL entries corresponding to the file permission
             bits are modified so that they contain no permissions that are
             not contained in the permissions specified by the mode
             parameter.

        If no default ACL is associated with a directory, the mode
        parameter to the functions creating file objects and the file
        creation mask (see umask(2)) are used to determine the ACL of the
        new object:

        1.   The new object is assigned an access ACL containing entries of
             tag types ACL_USER_OBJ, ACL_GROUP_OBJ, and ACL_OTHER. The
             permissions of these entries are set to the permissions
             specified by the file creation mask.

        2.   The access ACL entries corresponding to the file permission
             bits are modified so that they contain no permissions that are
             not contained in the permissions specified by the mode
             parameter.


-------------------------------------------------------------------------------------

::

        A process may request read, write, or execute/search access to a
        file object protected by an ACL. The access check algorithm
        determines whether access to the object will be granted.

        1.   If the effective user ID of the process matches the user ID of
             the file object owner, then

                   if the ACL_USER_OBJ entry contains the requested
                   permissions, access is granted,

                   else access is denied.

        2.   else if the effective user ID of the process matches the
             qualifier of any entry of type ACL_USER, then

                   if the matching ACL_USER entry and the ACL_MASK entry
                   contain the requested permissions, access is granted,

                   else access is denied.

        3.   else if the effective group ID or any of the supplementary
             group IDs of the process match the file group or the qualifier
             of any entry of type ACL_GROUP, then

                   if the ACL contains an ACL_MASK entry, then

                         if the ACL_MASK entry and any of the matching
                         ACL_GROUP_OBJ or ACL_GROUP entries contain the
                         requested permissions, access is granted,

                         else access is denied.

                   else (note that there can be no ACL_GROUP entries
                   without an ACL_MASK entry)

                         if the ACL_GROUP_OBJ entry contains the requested
                         permissions, access is granted,

                         else access is denied.

        4.   else if the ACL_OTHER entry contains the requested
             permissions, access is granted.

        5.   else access is denied.


---------------------------------------------------------------------

::

        A long and a short text form for representing ACLs is defined. In
        both forms, ACL entries are represented as three colon separated
        fields: an ACL entry tag type, an ACL entry qualifier, and the
        discretionary access permissions. The first field contains one of
        the following entry tag type keywords:

              user    A user ACL entry specifies the access granted to
                      either the file owner (entry tag type ACL_USER_OBJ)
                      or a specified user (entry tag type ACL_USER).

              group   A group ACL entry specifies the access granted to
                      either the file group (entry tag type ACL_GROUP_OBJ)
                      or a specified group (entry tag type ACL_GROUP).

              mask    A mask ACL entry specifies the maximum access which
                      can be granted by any ACL entry except the user entry
                      for the file owner and the other entry (entry tag
                      type ACL_MASK).

              other   An other ACL entry specifies the access granted to
                      any process that does not match any user or group ACL
                      entries (entry tag type ACL_OTHER).

        The second field contains the user or group identifier of the user
        or group associated with the ACL entry for entries of entry tag
        type ACL_USER or ACL_GROUP, and is empty for all other entries. A
        user identifier can be a user name or a user ID number in decimal
        form. A group identifier can be a group name or a group ID number
        in decimal form.

        The third field contains the discretionary access permissions. The
        read, write and search/execute permissions are represented by the
        r, w, and x characters, in this order. Each of these characters is
        replaced by the - character to denote that a permission is absent
        in the ACL entry.  When converting from the text form to the
        internal representation, permissions that are absent need not be
        specified.

        White space is permitted at the beginning and end of each ACL
        entry, and immediately before and after a field separator (the
        colon character).

      LONG TEXT FORM
        The long text form contains one ACL entry per line. In addition, a
        number sign (#) may start a comment that extends until the end of
        the line. If an ACL_USER, ACL_GROUP_OBJ or ACL_GROUP ACL entry
        contains permissions that are not also contained in the ACL_MASK
        entry, the entry is followed by a number sign, the string
        “effective:”, and the effective access permissions defined by that
        entry. This is an example of the long text form:

              user::rw-
              user:lisa:rw-         #effective:r--
              group::r--
              group:toolies:rw-     #effective:r--
              mask::r--
              other::r--

      SHORT TEXT FORM
        The short text form is a sequence of ACL entries separated by
        commas, and is used for input. Comments are not supported. Entry
        tag type keywords may either appear in their full unabbreviated
        form, or in their single letter abbreviated form. The abbreviation
        for user is u, the abbreviation for group is g, the abbreviation
        for mask is m, and the abbreviation for other is o.  The
        permissions may contain at most one each of the following
        characters in any order: r, w, x.  These are examples of the short
        text form:

              u::rw-,u:lisa:rw-,g::r--,g:toolies:rw-,m::r--,o::r--
              g:toolies:rw,u:lisa:rw,u::wr,g::r,o::r,m::r


-----------------------------------------------------------

::

        IEEE 1003.1e draft 17 defines Access Control Lists that include
        entries of tag type ACL_MASK, and defines a mapping between file
        permission bits that is not constant. The standard working group
        defined this relatively complex interface in order to ensure that
        applications that are compliant with IEEE 1003.1 (“POSIX.1”) will
        still function as expected on systems with ACLs. The IEEE 1003.1e
        draft 17 contains the rationale for choosing this interface in
        section B.23.


---------------------------------------------------------------------------------------------------

::

        On a system that supports ACLs, the file utilities ls(1), cp(1),
        and mv(1) change their behavior in the following way:

        •   For files that have a default ACL or an access ACL that
            contains more than the three required ACL entries, the ls(1)
            utility in the long form produced by ls -l displays a plus sign
            (+) after the permission string.

        •   If the -p flag is specified, the cp(1) utility also preserves
            ACLs.  If this is not possible, a warning is produced.

        •     The mv(1) utility always preserves ACLs. If this is not
            possible, a warning is produced.

        The effect of the chmod(1) utility, and of the chmod(2) system
        call, on the access ACL is described in CORRESPONDENCE BETWEEN ACL
        ENTRIES AND FILE PERMISSION BITS.


-----------------------------------------------------------

::

        The IEEE 1003.1e draft 17 (“POSIX.1e”) document describes several
        security extensions to the IEEE 1003.1 standard. While the work on
        1003.1e has been abandoned, many UNIX style systems implement parts
        of POSIX.1e draft 17, or of earlier drafts.

        Linux Access Control Lists implement the full set of functions and
        utilities defined for Access Control Lists in POSIX.1e, and several
        extensions.  The implementation is fully compliant with POSIX.1e
        draft 17; extensions are marked as such.  The Access Control List
        manipulation functions are defined in the ACL library (libacl,
        -lacl). The POSIX compliant interfaces are declared in the
        <sys/acl.h> header.  Linux-specific extensions to these functions
        are declared in the <acl/libacl.h> header.


---------------------------------------------------------

::

        chmod(1), creat(2), getfacl(1), ls(1), mkdir(2), mkfifo(2),
        mknod(2), open(2), setfacl(1), stat(2), umask(1)

      POSIX 1003.1e DRAFT 17
        http://wt.tuxomania.net/publications/posix.1e/download.html

      POSIX 1003.1e FUNCTIONS BY CATEGORY
        ACL storage management
             acl_dup(3), acl_free(3), acl_init(3)

        ACL entry manipulation
             acl_copy_entry(3), acl_create_entry(3), acl_delete_entry(3),
             acl_get_entry(3), acl_valid(3)

             acl_add_perm(3), acl_calc_mask(3), acl_clear_perms(3),
             acl_delete_perm(3), acl_get_permset(3), acl_set_permset(3)

             acl_get_qualifier(3), acl_get_tag_type(3),
             acl_set_qualifier(3), acl_set_tag_type(3)

        ACL manipulation on an object
             acl_delete_def_file(3), acl_get_fd(3), acl_get_file(3),
             acl_set_fd(3), acl_set_file(3)

        ACL format translation
             acl_copy_entry(3), acl_copy_ext(3), acl_from_text(3),
             acl_to_text(3), acl_size(3)

      POSIX 1003.1e FUNCTIONS BY AVAILABILITY
        The first group of functions is supported on most systems with
        POSIX-like access control lists, while the second group is
        supported on fewer systems.  For applications that will be ported
        the second group is best avoided.

        acl_delete_def_file(3), acl_dup(3), acl_free(3), acl_from_text(3),
        acl_get_fd(3), acl_get_file(3), acl_init(3), acl_set_fd(3),
        acl_set_file(3), acl_to_text(3), acl_valid(3)

        acl_add_perm(3), acl_calc_mask(3), acl_clear_perms(3),
        acl_copy_entry(3), acl_copy_ext(3), acl_copy_int(3),
        acl_create_entry(3), acl_delete_entry(3), acl_delete_perm(3),
        acl_get_entry(3), acl_get_permset(3), acl_get_qualifier(3),
        acl_get_tag_type(3), acl_set_permset(3), acl_set_qualifier(3),
        acl_set_tag_type(3), acl_size(3)

      LINUX EXTENSIONS
        These non-portable extensions are available on Linux systems.

        acl_check(3), acl_cmp(3), acl_entries(3), acl_equiv_mode(3),
        acl_error(3), acl_extended_fd(3), acl_extended_file(3),
        acl_extended_file_nofollow(3), acl_from_mode(3), acl_get_perm(3),
        acl_to_any_text(3)


-----------------------------------------------------

::

        Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>

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

Pages that refer to this page: `chacl(1) <../man1/chacl.1.html>`__, 
`getfacl(1) <../man1/getfacl.1.html>`__, 
`setfacl(1) <../man1/setfacl.1.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`umask(2) <../man2/umask.2.html>`__, 
`ext4(5) <../man5/ext4.5.html>`__, 
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__, 
`xattr(7) <../man7/xattr.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__

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
