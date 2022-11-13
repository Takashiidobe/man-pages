.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_raw_context_to_color(3) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_raw_context_to_color(3) FunctionssManual_raw_context_to_color(3)

NAME
-------------------------------------------------

::

          selinux_raw_context_to_color - Return RGB color string for an
          SELinux security context


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int selinux_raw_context_to_color(char *raw,
                 char **color_str);


---------------------------------------------------------------

::

          selinux_raw_context_to_color() returns a color_str associated to
          the raw context raw provided that the mcstransd(8) daemon is
          running, the policy is an MLS type policy (MCS or MLS) and there
          is a color configuration file secolor.conf(5) (see the FILES
          section).

          The color_str string is a space separated list of eight
          hexadecimal RGB triples, each prefixed by a hash character (#).
          These represent the user:role:type:range components of the
          foreground and background colors. An example string is shown in
          the EXAMPLE section.

          The returned color_str string must be freed with free(3).

          If a color has not been configured for a specific user, role,
          type and/or range component of context raw, then
          selinux_raw_context_to_color() will select the color returned in
          color_str in order of precedence as follows:
                 role, type, range
                 user, type, range
                 user, role, range
                 user, role, type

          If there are no entries in the secolor.conf(5) file for any of
          the components of context raw (or the file is not present), then
          the default string returned in color_str is:

                 ----- user ---- ---- role ----  ---- type ----  ---- range
                 ----
                 #000000 #ffffff #000000 #ffffff #000000 #ffffff #000000
                 #ffffff


-----------------------------------------------------------------

::

          On success, zero is returned.
          On failure, -1 is returned with errno set appropriately.


-----------------------------------------------------

::

          ENOENT If the mcstransd(8) daemon is not running.


---------------------------------------------------

::

          selinux_raw_context_to_color() obtains the translated entry from
          the active policy secolor.conf(5) file as returned by
          selinux_colors_path(3).  The file format is described in
          secolor.conf(5).


---------------------------------------------------

::

          1. The primary use of selinux_raw_context_to_color() is to return
          a color that corresponds to a range, that can then be used to
          highlight information at different MLS levels.

          2. The mcstransd(8) daemon process security level must dominate
          the raw security level passed to it by the
          selinux_raw_context_to_color() function. If not, the range color
          selected will be as defined by the order of precedence.


-------------------------------------------------------

::

          selinux_raw_context_to_color() returns the foreground and
          background colors of the context string components
          (user:role:type:range) as RGB triples as follows:

                user     :       role      :      type      :      range
            fg       bg  :   fg       bg   :  fg       bg   :  fg       bg
          #000000 #ffffff  #ffffff #000000  #d2b48c #ffa500  #000000
          #008000
           black   white :  white   black  : tan    orange  : black   green


---------------------------------------------------------

::

          selinux(8), selinux_colors_path(3), mcstransd(8),
          secolor.conf(5), selinux_raw_to_trans_context(3),
          selinux_trans_to_raw_context(3), free(3)

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

   SELinux API documentation     08 April 201s1elinux_raw_context_to_color(3)

--------------

Pages that refer to this page:
`selinux_colors_path(3) <../man3/selinux_colors_path.3.html>`__, 
`secolor.conf(5) <../man5/secolor.conf.5.html>`__

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
