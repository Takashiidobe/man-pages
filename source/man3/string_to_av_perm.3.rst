.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

security_class_to_string(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   security_class_to_string(3)inux API documentationrity_class_to_string(3)

NAME
-------------------------------------------------

::

          security_class_to_string, security_av_perm_to_string,
          string_to_security_class, string_to_av_perm, security_av_string,
          mode_to_security_class - convert between SELinux class and
          permission values and string names.  print_access_vector -
          display an access vector in human-readable form.


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          const char *security_class_to_string(security_class_t tclass);

          const char *security_av_perm_to_string(security_class_t tclass,
          access_vector_t av);

          int security_av_string(security_class_t tclass, access_vector_t
          av, char **result);

          security_class_t string_to_security_class(const char *name);

          security_class_t mode_to_security_class(mode_t mode);

          access_vector_t string_to_av_perm(security_class_t tclass, const
          char *name);

          void print_access_vector(security_class_t tclass, access_vector_t
          av);


---------------------------------------------------------------

::

          security_class_to_string() returns a string name for class
          tclass, or NULL if the class is invalid.  The returned string
          must not be modified or freed.

          security_av_perm_to_string() returns a string name for the access
          vector bit av of class tclass, or NULL if either argument is
          invalid.  The returned string must not be modified or freed.

          security_av_string() computes a full access vector string
          representation using tclass and av, which may have multiple bits
          set.  The string is returned in the memory pointed to by result,
          and should be freed by the caller using free(3).

          string_to_security_class() returns the class value corresponding
          to the string name name, or zero if no such class exists.

          mode_to_security_class() returns the class value corresponding to
          the specified mode, or zero if no such class exists.

          string_to_av_perm() returns the access vector bit corresponding
          to the string name name and security class tclass, or zero if no
          such value exists.

          print_access_vector() displays an access vector in human-readable
          form on the standard output stream.


-----------------------------------------------------------------

::

          security_av_string() returns zero on success or -1 on error with
          errno set appropriately.  print_access_vector() does not return a
          value. All other functions return zero or NULL on error.


-----------------------------------------------------

::

          EINVAL A class or access vector argument is not recognized by the
                 currently loaded policy.

          ENOMEM An attempt to allocate memory failed.


-----------------------------------------------------

::

          Eamon Walsh <ewalsh@tycho.nsa.gov>


---------------------------------------------------------

::

          selinux(8), getcon(3), getfilecon(3) stat(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                  30 Mar 2007   security_class_to_string(3)

--------------

Pages that refer to this page:
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`security_compute_av(3) <../man3/security_compute_av.3.html>`__

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
