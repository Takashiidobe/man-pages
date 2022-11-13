.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

deb-substvars(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   deb-substvars(5)               dpkg suite               deb-substvars(5)

NAME
-------------------------------------------------

::

          deb-substvars - Debian source substitution variables


---------------------------------------------------------

::

          substvars


---------------------------------------------------------------

::

          Before dpkg-source, dpkg-gencontrol and dpkg-genchanges write
          their control information (to the source control file .dsc for
          dpkg-source and to standard output for dpkg-gencontrol and
          dpkg-genchanges) they perform some variable substitutions on the
          output file.

          A variable substitution has the form ${variable-name}.  Variable
          names consist of alphanumerics (a-zA-Z0-9), hyphens (-) and
          colons (:) and start with an alphanumeric, and are case-
          sensitive, even though they might refer to other entities which
          are case-preserving.  Variable substitutions are performed
          repeatedly until none are left; the full text of the field after
          the substitution is rescanned to look for more substitutions.

          After all the substitutions have been done each occurrence of the
          string ${} (which is not a legal substitution) is replaced with a
          $ sign.

          While variable substitution is done on all control fields, some
          of those fields are used and needed during the build when the
          substitution did not yet occur. That's why you can't use
          variables in the Package, Source and Architecture fields.

          Variable substitution happens on the content of the fields after
          they have been parsed, thus if you want a variable to expand over
          multiple lines you do not have to include a space after the
          newline. This is done implicitly when the field is output. For
          example, if the variable ${Description} is set to "foo is
          bar.${Newline}foo is great." and if you have the following field:

           Description: foo application
            ${Description}
            .
            More text.

          It will result in:

           Description: foo application
            foo is bar.
            foo is great.
            .
            More text.

          Variables can be set using the -V common option. They can be also
          specified in the file debian/substvars (or whatever other file is
          specified using the -T option). This file consists of lines of
          the form name=value.  Trailing whitespace on each line, blank
          lines, and lines starting with a # symbol (comments) are ignored.

          Additionally, the following standard variables are available:

          Arch   The current host architecture (i.e. the architecture the
                 package is being built for, the equivalent of
                 DEB_HOST_ARCH).

          source:Version
                 The source package version (since dpkg 1.13.19).

          source:Upstream-Version
                 The upstream source package version, including the Debian
                 version epoch if any (since dpkg 1.13.19).

          binary:Version
                 The binary package version (which may differ from
                 source:Version in a binNMU for example; since dpkg
                 1.13.19).

          Source-Version
                 The source package version (from the changelog file). This
                 variable is now obsolete and emits an error when used as
                 its meaning is different from its function, please use the
                 source:Version or binary:Version as appropriate.

          source:Synopsis
                 The source package synopsis, extracted from the source
                 stanza Description field, if it exists (since dpkg
                 1.19.0).

          source:Extended-Description
                 The source package extended description, extracted from
                 the source stanza Description field, if it exists (since
                 dpkg 1.19.0).

          Installed-Size
                 The approximate total size of the package's installed
                 files. This value is copied into the corresponding control
                 file field; setting it will modify the value of that
                 field. If this variable is not set dpkg-gencontrol will
                 compute the default value by accumulating the size of each
                 regular file and symlink rounded to 1 KiB used units, and
                 a baseline of 1 KiB for any other filesystem object type.

                 Note: Take into account that this can only ever be an
                 approximation, as the actual size used on the installed
                 system will depend greatly on the filesystem used and its
                 parameters, which might end up using either more or less
                 space than the specified in this field.

          Extra-Size
                 Additional disk space used when the package is installed.
                 If this variable is set its value is added to that of the
                 Installed-Size variable (whether set explicitly or using
                 the default value) before it is copied into the
                 Installed-Size control file field.

          S:fieldname
                 The value of the source stanza field fieldname (which must
                 be given in the canonical capitalisation; since dpkg
                 1.18.11).  Setting these variables has no effect other
                 than on places where they are expanded explicitly.  These
                 variables are only available when generating binary
                 control files.

          F:fieldname
                 The value of the output field fieldname (which must be
                 given in the canonical capitalisation). Setting these
                 variables has no effect other than on places where they
                 are expanded explicitly.

          Format The .changes file format version generated by this version
                 of the source packaging scripts. If you set this variable
                 the contents of the Format field in the .changes file will
                 change too.

          Newline, Space, Tab
                 These variables each hold the corresponding character.

          shlibs:dependencyfield
                 Variable settings with names of this form are generated by
                 dpkg-shlibdeps.

          dpkg:Upstream-Version
                 The upstream version of dpkg (since dpkg 1.13.19).

          dpkg:Version
                 The full version of dpkg (since dpkg 1.13.19).

          If a variable is referred to but not defined it generates a
          warning and an empty value is assumed.


---------------------------------------------------

::

          debian/substvars
                 List of substitution variables and values.


---------------------------------------------------------

::

          dpkg(1), dpkg-genchanges(1), dpkg-gencontrol(1),
          dpkg-shlibdeps(1), dpkg-source(1).

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

   1.19.6-2-g6e42d5               2019-03-25               deb-substvars(5)

--------------

Pages that refer to this page:
`dpkg-genchanges(1) <../man1/dpkg-genchanges.1.html>`__, 
`dpkg-gencontrol(1) <../man1/dpkg-gencontrol.1.html>`__, 
`dpkg-source(1) <../man1/dpkg-source.1.html>`__

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
