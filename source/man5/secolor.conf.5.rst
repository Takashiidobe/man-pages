.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

secolor.conf(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   secolor.conf(5)            File Formats Manual           secolor.conf(5)

NAME
-------------------------------------------------

::

          secolor.conf - The SELinux color configuration file


---------------------------------------------------------------

::

          This optional file controls the color to be associated to the
          context components associated to the raw context passed by
          selinux_raw_context_to_color(3), when context related information
          is to be displayed in color by an SELinux-aware application.

          selinux_raw_context_to_color(3) obtains this color information
          from the active policy secolor.conf file as returned by
          selinux_colors_path(3).


---------------------------------------------------------------

::

          The file format is as follows:
                 color color_name = #color_mask
                 [...]

                 context_component string = fg_color_name bg_color_name
                 [...]

          Where:
          color
                 The color keyword. Each color entry is on a new line.
          color_name
                 A single word name for the color (e.g. red).
          color_mask
                 A color mask starting with a hash (#) that describes the
                 hexadecimal RGB colors with black being #000000 and white
                 being #ffffff.
          context_component
                 The context component name that must be one of the
                 following:
                        user, role, type or range
                 Each context_component string ...  entry is on a new line.
          string
                 This is the context_component string that will be matched
                 with the raw context component passed by
                 selinux_raw_context_to_color(3).
                 A wildcard '*' may be used to match any undefined string
                 for the user, role and type context_component entries
                 only.

          fg_color_name
                 The color_name string that will be used as the foreground
                 color.  A color_mask may also be used.
          bg_color_name
                 The color_name string that will be used as the background
                 color.  A color_mask may also be used.


---------------------------------------------------------

::

          Example 1 entries are:
                 color black  = #000000
                 color green  = #008000
                 color yellow = #ffff00
                 color blue   = #0000ff
                 color white  = #ffffff
                 color red    = #ff0000
                 color orange = #ffa500
                 color tan    = #D2B48C

                 user * = black white
                 role * = white black
                 type * = tan orange
                 range s0-s0:c0.c1023 = black green
                 range s1-s1:c0.c1023 = white green
                 range s3-s3:c0.c1023 = black tan
                 range s5-s5:c0.c1023 = white blue
                 range s7-s7:c0.c1023 = black red
                 range s9-s9:c0.c1023 = black orange
                 range s15-s15:c0.c1023   = black yellow

          Example 2 entries are:
                 color black  = #000000
                 color green  = #008000
                 color yellow = #ffff00
                 color blue   = #0000ff
                 color white  = #ffffff
                 color red    = #ff0000
                 color orange = #ffa500
                 color tan    = #d2b48c

                 user unconfined_u = #ff0000 green
                 role unconfined_r = red #ffffff
                 type unconfined_t = red orange
                 user user_u       = black green
                 role user_r       = white black
                 type user_t       = tan red
                 user xguest_u     = black yellow
                 role xguest_r     = black red
                 type xguest_t     = black green
                 user sysadm_u     = white black
                 range s0-s0:c0.c1023 = black white
                 user *            = black white
                 role *            = black white
                 type *            = black white


---------------------------------------------------------

::

          selinux(8), selinux_raw_context_to_color(3),
          selinux_colors_path(3)

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

   SELinux API documentation     08 April 2011              secolor.conf(5)

--------------

Pages that refer to this page:
`selinux_colors_path(3) <../man3/selinux_colors_path.3.html>`__, 
`selinux_raw_context_to_color(3) <../man3/selinux_raw_context_to_color.3.html>`__

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
