.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_path_lookup(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_PATH_LOOKUP(3)            sd_path_lookup            SD_PATH_LOOKUP(3)

NAME
-------------------------------------------------

::

          sd_path_lookup, sd_path_lookup_strv - Query well-known file
          system paths


---------------------------------------------------------

::

          #include <systemd/sd-path.h>

          enum {
                  SD_PATH_TEMPORARY,
                  SD_PATH_TEMPORARY_LARGE,

                  SD_PATH_SYSTEM_BINARIES,
                  SD_PATH_SYSTEM_INCLUDE,
                  SD_PATH_SYSTEM_LIBRARY_PRIVATE,
                  SD_PATH_SYSTEM_LIBRARY_ARCH,
                  SD_PATH_SYSTEM_SHARED,
                  SD_PATH_SYSTEM_CONFIGURATION_FACTORY,
                  SD_PATH_SYSTEM_STATE_FACTORY,

                  SD_PATH_SYSTEM_CONFIGURATION,
                  SD_PATH_SYSTEM_RUNTIME,
                  SD_PATH_SYSTEM_RUNTIME_LOGS,
                  SD_PATH_SYSTEM_STATE_PRIVATE,
                  SD_PATH_SYSTEM_STATE_LOGS,
                  SD_PATH_SYSTEM_STATE_CACHE,
                  SD_PATH_SYSTEM_STATE_SPOOL,

                  SD_PATH_USER_BINARIES,
                  SD_PATH_USER_LIBRARY_PRIVATE,
                  SD_PATH_USER_LIBRARY_ARCH,
                  SD_PATH_USER_SHARED,

                  SD_PATH_USER_CONFIGURATION,
                  SD_PATH_USER_RUNTIME,
                  SD_PATH_USER_STATE_CACHE,

                  SD_PATH_USER,
                  SD_PATH_USER_DOCUMENTS,
                  SD_PATH_USER_MUSIC,
                  SD_PATH_USER_PICTURES,
                  SD_PATH_USER_VIDEOS,
                  SD_PATH_USER_DOWNLOAD,
                  SD_PATH_USER_PUBLIC,
                  SD_PATH_USER_TEMPLATES,
                  SD_PATH_USER_DESKTOP,

                  SD_PATH_SEARCH_BINARIES,
                  SD_PATH_SEARCH_BINARIES_DEFAULT,
                  SD_PATH_SEARCH_LIBRARY_PRIVATE,
                  SD_PATH_SEARCH_LIBRARY_ARCH,
                  SD_PATH_SEARCH_SHARED,
                  SD_PATH_SEARCH_CONFIGURATION_FACTORY,
                  SD_PATH_SEARCH_STATE_FACTORY,
                  SD_PATH_SEARCH_CONFIGURATION,

                  SD_PATH_SYSTEMD_UTIL,
                  SD_PATH_SYSTEMD_SYSTEM_UNIT,
                  SD_PATH_SYSTEMD_SYSTEM_PRESET,
                  SD_PATH_SYSTEMD_USER_UNIT,
                  SD_PATH_SYSTEMD_USER_PRESET,
                  SD_PATH_SYSTEMD_SYSTEM_CONF,
                  SD_PATH_SYSTEMD_USER_CONF,
                  SD_PATH_SYSTEMD_SEARCH_SYSTEM_UNIT,
                  SD_PATH_SYSTEMD_SEARCH_USER_UNIT,
                  SD_PATH_SYSTEMD_SYSTEM_GENERATOR,
                  SD_PATH_SYSTEMD_USER_GENERATOR,
                  SD_PATH_SYSTEMD_SEARCH_SYSTEM_GENERATOR,
                  SD_PATH_SYSTEMD_SEARCH_USER_GENERATOR,
                  SD_PATH_SYSTEMD_SLEEP,
                  SD_PATH_SYSTEMD_SHUTDOWN,

                  SD_PATH_TMPFILES,
                  SD_PATH_SYSUSERS,
                  SD_PATH_SYSCTL,
                  SD_PATH_BINFMT,
                  SD_PATH_MODULES_LOAD,
                  SD_PATH_CATALOG,

                  SD_PATH_SYSTEMD_SEARCH_NETWORK,
          };

          int sd_path_lookup(uint64_t type, const char *suffix,
                             char **paths);

          int sd_path_lookup_strv(uint64_t type, const char *suffix,
                                  char ***paths);


---------------------------------------------------------------

::

          sd_path_lookup() and sd_bus_path_lookup_strv() return a single
          path or set of file system paths specified by the argument type.
          In case of sd_path_lookup() a single NUL-terminated string is
          returned. When type specifies a set of paths, they are
          concatenated using ":" as a separator (as is traditionally done
          for e.g.  $PATH or $LD_LIBRARY_PATH). In case of
          sd_path_lookup_strv() a NULL-terminated array of strings is
          returned (strv). If suffix suffix is given, it is concatenated to
          each of the paths after a slash ("/"). All returned paths are
          absolute.

          For paths which refer to user directories, the relevant XDG
          standard is followed, with support for environment variables like
          $XDG_DOCUMENTS_DIR, $XDG_DESKTOP_DIR, ..., and explicit
          configuration in /etc/xdg/user-dirs.conf or
          ${XDG_CONFIG_HOME}/user-dirs.dirs. See XDG Base Directory
          Specification[1] for details.

          systemd-path(1) is a wrapper around sd_path_lookup() and allows
          the same set of paths to be queried.


-----------------------------------------------------------------

::

          On success, sd_path_lookup() and sd_path_lookup_strv() return a
          non-negative integer. On failure, a negative errno-style error
          number is returned by either function.

          The returned string or string array (strv) must be free(3)'d by
          the caller.

      Errors
          Returned errors may indicate the following problems:

          -EOPNOTSUPP
              Unknown identifier type.

          -EINVAL
              Output argument is NULL.

          -ENXIO
              Query failed because of an undefined environment variable
              (e.g. for SD_PATH_USER_RUNTIME when $XDG_RUNTIME_DIR is not
              defined).

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------------

::

      Look up the location of ~/Documents
              #include <stdio.h>
              #include <sd-path.h>

              int main(void) {
                char *t;

                sd_path_lookup(SD_PATH_USER_DOCUMENTS, NULL, &t);
                printf("~/Documents: %s\n", t);
              }

          Note that the default answer of $HOME/Documents may be overridden
          by user-dirs.conf or $XDG_DOCUMENTS_DIR.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd-path(1)

.. _notes-top-1:


---------------------------------------------------

::

           1. XDG Base Directory Specification
              https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                            SD_PATH_LOOKUP(3)

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
