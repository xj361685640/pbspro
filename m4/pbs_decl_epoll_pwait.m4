
#
# Copyright (C) 1994-2018 Altair Engineering, Inc.
# For more information, contact Altair at www.altair.com.
#
# This file is part of the PBS Professional ("PBS Pro") software.
#
# Open Source License Information:
#
# PBS Pro is free software. You can redistribute it and/or modify it under the
# terms of the GNU Affero General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your option) any
# later version.
#
# PBS Pro is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.
# See the GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Commercial License Information:
#
# For a copy of the commercial license terms and conditions,
# go to: (http://www.pbspro.com/UserArea/agreement.html)
# or contact the Altair Legal Department.
#
# Altair’s dual-license business model allows companies, individuals, and
# organizations to create proprietary derivative works of PBS Pro and
# distribute them - whether embedded or bundled with other software -
# under a commercial license agreement.
#
# Use of Altair’s trademarks, including but not limited to "PBS™",
# "PBS Professional®", and "PBS Pro™" and Altair’s logos is subject to Altair's
# trademark licensing policies.
#


#
# Prefix the macro names with PBS_ so they don't conflict with Python definitions
#

AC_DEFUN([PBS_AC_DECL_EPOLL_PWAIT],
[
  AS_CASE([x$target_os],
    [xlinux*],
      AC_MSG_CHECKING(whether epoll_pwait system call is supported)
      AC_TRY_RUN(
[
#include <unistd.h>
#include <poll.h>
#include <signal.h>
#include <sys/epoll.h>
int main()
{
	sigset_t allsigs;       
	int n;
	int maxevents = 1;
	int timeout = 0;
	int epollfd;
	struct   epoll_event  events;	
	sigemptyset(&allsigs);
	events.events = EPOLLIN;
	epollfd = epoll_create1(0);
        if (epollfd == -1) {
               perror("epoll_create1");
               return (1);
        }

	n = epoll_pwait(epollfd, &events, maxevents, timeout, &allsigs);
	return (n);
}
],
        AC_DEFINE([PBS_HAVE_EPOLL_PWAIT], [], [Defined when epoll_pwait is available])
        AC_MSG_RESULT([yes]),
        AC_MSG_RESULT([no])
      )
  )
])

