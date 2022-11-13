.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_conv(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_CONV(3)                 Linux-PAM Manual                 PAM_CONV(3)

NAME
-------------------------------------------------

::

          pam_conv - PAM conversation function


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          struct pam_message {
              int msg_style;
              const char *msg;
          };

          struct pam_response {
              char *resp;
              int resp_retcode;
          };

          struct pam_conv {
              int (*conv)(int num_msg, const struct pam_message **msg,
                          struct pam_response **resp, void *appdata_ptr);
              void *appdata_ptr;
          };


---------------------------------------------------------------

::

          The PAM library uses an application-defined callback to allow a
          direct communication between a loaded module and the application.
          This callback is specified by the struct pam_conv passed to
          pam_start(3) at the start of the transaction.

          When a module calls the referenced conv() function, the argument
          appdata_ptr is set to the second element of this structure.

          The other arguments of a call to conv() concern the information
          exchanged by module and application. That is to say, num_msg
          holds the length of the array of pointers, msg. After a
          successful return, the pointer resp points to an array of
          pam_response structures, holding the application supplied text.
          The resp_retcode member of this struct is unused and should be
          set to zero. It is the caller's responsibility to release both,
          this array and the responses themselves, using free(3). Note,
          *resp is a struct pam_response array and not an array of
          pointers.

          The number of responses is always equal to the num_msg
          conversation function argument. This does require that the
          response array is free(3)'d after every call to the conversation
          function. The index of the responses corresponds directly to the
          prompt index in the pam_message array.

          On failure, the conversation function should release any
          resources it has allocated, and return one of the predefined PAM
          error codes.

          Each message can have one of four types, specified by the
          msg_style member of struct pam_message:

          PAM_PROMPT_ECHO_OFF
              Obtain a string without echoing any text.

          PAM_PROMPT_ECHO_ON
              Obtain a string whilst echoing text.

          PAM_ERROR_MSG
              Display an error message.

          PAM_TEXT_INFO
              Display some text.

          The point of having an array of messages is that it becomes
          possible to pass a number of things to the application in a
          single call from the module. It can also be convenient for the
          application that related things come at once: a windows based
          application can then present a single form with many
          messages/prompts on at once.

          In passing, it is worth noting that there is a descrepency
          between the way Linux-PAM handles the const struct pam_message
          **msg conversation function argument from the way that Solaris'
          PAM (and derivitives, known to include HP/UX, are there others?)
          does. Linux-PAM interprets the msg argument as entirely
          equivalent to the following prototype const struct pam_message
          *msg[] (which, in spirit, is consistent with the commonly used
          prototypes for argv argument to the familiar main() function:
          char **argv; and char *argv[]). Said another way Linux-PAM
          interprets the msg argument as a pointer to an array of num_msg
          read only 'struct pam_message' pointers. Solaris' PAM
          implementation interprets this argument as a pointer to a pointer
          to an array of num_msg pam_message structures. Fortunately,
          perhaps, for most module/application developers when num_msg has
          a value of one these two definitions are entirely equivalent.
          Unfortunately, casually raising this number to two has led to
          unanticipated compatibility problems.

          For what its worth the two known module writer work-arounds for
          trying to maintain source level compatibility with both PAM
          implementations are:

          •   never call the conversation function with num_msg greater
              than one.

          •   set up msg as doubly referenced so both types of conversation
              function can find the messages. That is, make

                         msg[n] = & (( *msg )[n])


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_CONV_ERR
              Conversation failure. The application should not set *resp.

          PAM_SUCCESS
              Success.


---------------------------------------------------------

::

          pam_start(3), pam_set_item(3), pam_get_item(3), pam_strerror(3),
          pam(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                    PAM_CONV(3)

--------------

Pages that refer to this page:
`misc_conv(3) <../man3/misc_conv.3.html>`__, 
`pam(3) <../man3/pam.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_get_user(3) <../man3/pam_get_user.3.html>`__, 
`pam_prompt(3) <../man3/pam_prompt.3.html>`__, 
`pam_set_item(3) <../man3/pam_set_item.3.html>`__

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
