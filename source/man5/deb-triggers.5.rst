.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-triggers(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-triggers(5)                dpkg suite                deb-triggers(5)

NAME
-------------------------------------------------

::

          deb-triggers - package triggers


---------------------------------------------------------

::

          triggers


---------------------------------------------------------------

::

          A package declares its relationship to some trigger(s) by
          including a triggers file in its control archive (i.e.
          DEBIAN/triggers during package creation).

          This file contains directives, one per line. Leading and trailing
          whitespace and everything after the first # on any line will be
          trimmed, and empty lines will be ignored.

          The trigger control directives currently supported are:

          interest trigger-name
          interest-await trigger-name
          interest-noawait trigger-name

                 Specifies that the package is interested in the named
                 trigger. All triggers in which a package is interested
                 must be listed using this directive in the triggers
                 control file.

                 The “await” variants put the triggering package in
                 triggers-awaited state depending on how the trigger was
                 activated.  The “noawait” variant does not put the
                 triggering packages in triggers-awaited state, even if the
                 triggering package declared an “await” activation (either
                 with an activate-await or activate directive, or by using
                 the dpkg-trigger --no-await command-line option).  The
                 “noawait” variant should be used when the functionality
                 provided by the trigger is not crucial.

          activate trigger-name
          activate-await trigger-name
          activate-noawait trigger-name

                 Arranges that changes to this package's state will
                 activate the specified trigger. The trigger will be
                 activated at the start of the following operations:
                 unpack, configure, remove (including for the benefit of a
                 conflicting package), purge and deconfigure.

                 The “await” variants only put the triggering package in
                 triggers-awaited state if the interest directive is also
                 “await”.  The “noawait” variant never puts the triggering
                 packages in triggers-awaited state.  The “noawait” variant
                 should be used when the functionality provided by the
                 trigger is not crucial.

                 If this package disappears during the unpacking of another
                 package the trigger will be activated when the
                 disappearance is noted towards the end of the unpack.
                 Trigger processing, and transition from triggers-awaited
                 to installed, does not cause activations.  In the case of
                 unpack, triggers mentioned in both the old and new
                 versions of the package will be activated.

          Unknown directives are an error which will prevent installation
          of the package.

          The “-noawait” variants should always be favored when possible
          since triggering packages are not put in triggers-awaited state
          and can thus be immediately configured without requiring the
          processing of the trigger.  If the triggering packages are
          dependencies of other upgraded packages, it will avoid an early
          trigger processing run and make it possible to run the trigger
          only once as one of the last steps of the upgrade.

          The “-noawait” variants are supported since dpkg 1.16.1, and will
          lead to errors if used with an older dpkg.

          The “-await” alias variants are supported since dpkg 1.17.21, and
          will lead to errors if used with an older dpkg.

          When a package provides an interest-noawait directive, any
          activation will set the triggering package into “noawait” mode,
          regardless of the awaiting mode requested by the activation
          (either “await” or “noawait”).  When a package provides an
          interest or interest-await directive, any activation will set the
          triggering package into “await” or “noawait“ depending on how it
          was activated.


---------------------------------------------------------

::

          dpkg-trigger(1), dpkg(1),
          /usr/share/doc/dpkg-dev/triggers.txt.gz.

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25                deb-triggers(5)

--------------

Pages that refer to this page:
`dpkg-trigger(1) <../man1/dpkg-trigger.1.html>`__, 
`deb(5) <../man5/deb.5.html>`__

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
