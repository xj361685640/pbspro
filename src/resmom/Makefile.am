
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

sbin_PROGRAMS = pbs_mom

pbs_mom_CPPFLAGS = \
	-DPBS_MOM \
	-I$(top_srcdir)/src/include \
	-I$(top_srcdir)/src/resmom/${PBS_MACH} \
	@hwloc_flags@ \
	@hwloc_inc@ \
	@PYTHON_INCLUDES@

pbs_mom_LDADD = \
	$(top_builddir)/src/lib/Libattr/libattr.a \
	$(top_builddir)/src/lib/Liblog/liblog.a \
	$(top_builddir)/src/lib/Libnet/libnet.a \
	$(top_builddir)/src/lib/Libpbs/.libs/libpbs.a \
	$(top_builddir)/src/lib/Libsec/libsec.a \
	$(top_builddir)/src/lib/Libsite/libsite.a \
	$(top_builddir)/src/lib/Libtpp/libtpp.a \
	$(top_builddir)/src/lib/Libutil/libutil.a \
	@hwloc_lib@ \
	@PYTHON_LDFLAGS@ \
	@PYTHON_LIBS@ \
	@mom_mach_libs@ \
	-lssl \
	-lcrypto

pbs_mom_SOURCES = \
	$(top_builddir)/src/lib/Libattr/job_attr_def.c \
	$(top_builddir)/src/lib/Libattr/resc_def_all.c \
	$(top_srcdir)/src/server/mom_info.c \
	$(top_srcdir)/src/server/attr_recov.c \
	$(top_srcdir)/src/server/dis_read.c \
	$(top_srcdir)/src/server/job_func.c \
	$(top_srcdir)/src/server/job_recov.c \
	$(top_srcdir)/src/server/process_request.c \
	$(top_srcdir)/src/server/reply_send.c \
	$(top_srcdir)/src/server/req_quejob.c \
	$(top_srcdir)/src/server/resc_attr.c \
	$(top_srcdir)/src/server/vnparse.c \
	$(top_srcdir)/src/server/setup_resc.c \
	${PBS_MACH}/mom_mach.c \
	${PBS_MACH}/mom_mach.h \
	${PBS_MACH}/mom_start.c \
	${PBS_MACH}/pe_input.c \
	catch_child.c \
	mom_comm.c \
	mom_hook_func.c \
	mom_inter.c \
	mom_main.c \
	mom_server.c \
	mom_vnode.c \
	mom_walltime.c \
	popen.c \
	prolog.c \
	requests.c \
	rm_dep.h \
	stage_func.c \
	start_exec.c \
	vnode_storage.c

if ALPS_ENABLED
pbs_mom_CPPFLAGS += -DMOM_ALPS=1 @expat_inc@
pbs_mom_LDADD += @expat_lib@
pbs_mom_SOURCES += linux/alps.c
endif

if CPUSET_ENABLED
pbs_mom_CPPFLAGS += -DMOM_CPUSET=1 @cpuset_flags@
pbs_mom_LDADD += -lcpuset
if CPUSET_FOR_IRIX6
pbs_mom_SOURCES += \
	irix6cpuset/allocnodes.c \
	irix6cpuset/allocnodes.h \
	irix6cpuset/collector.c \
	irix6cpuset/collector.h \
	irix6cpuset/cpusets.c \
	irix6cpuset/cpusets.h \
	irix6cpuset/cpusets_shared.c \
	irix6cpuset/cpusets_shared.h \
	irix6cpuset/hammer.c \
	irix6cpuset/hammer.h \
	irix6cpuset/mapnodes.c \
	irix6cpuset/mapnodes.h \
	irix6cpuset/mom_share.c \
	irix6cpuset/mom_share.h \
	irix6cpuset/session.c \
	irix6cpuset/session.h
else
pbs_mom_SOURCES += linux/cpuset_misc.c
endif
endif

if HPS_ENABLED
pbs_mom_CPPFLAGS += -DIBM_HPS=1
pbs_mom_LDADD += -lntbl
endif

if AIXIB_ENABLED
pbs_mom_CPPFLAGS += -DIBM_AIXIB=1
pbs_mom_LDADD += -lnrt
endif

EXTRA_DIST = \
	bsd/mom_mach.c \
	bsd/mom_mach.h \
	bsd/mom_start.c \
	bsd/pe_input.c \
	darwin/mom_mach.c \
	darwin/mom_mach.h \
	darwin/mom_start.c \
	darwin/pe_input.c \
	digitalunix/mom_mach.c \
	digitalunix/mom_mach.h \
	digitalunix/mom_start.c \
	digitalunix/pe_input.c \
	hpux10/mom_mach.c \
	hpux10/mom_mach.h \
	hpux10/mom_start.c \
	hpux10/pe_input.c \
	irix6/mom_mach.c \
	irix6/mom_mach.h \
	irix6/mom_start.c \
	irix6/pe_input.c \
	mom_hpcp/advancedfilter.xsd \
	mom_hpcp/BESFactoryBinding.nsmap \
	mom_hpcp/bes-factory.h \
	mom_hpcp/bes-factory.wsdl \
	mom_hpcp/bes-factory.xsd \
	mom_hpcp/hpcbp-typemap.dat \
	mom_hpcp/jsdl-hpcpa.xsd \
	mom_hpcp/jsdl-posix.xsd \
	mom_hpcp/jsdl.xsd \
	mom_hpcp/pbs_hpcp_client.c \
	mom_hpcp/pbs_hpcp_client.h \
	mom_hpcp/README \
	mom_hpcp/soapC.c \
	mom_hpcp/soapClient.c \
	mom_hpcp/soapH.h \
	mom_hpcp/soapStub.h \
	mom_hpcp/ws-addr.xsd \
	solaris7/mom_mach.c \
	solaris7/mom_mach.h \
	solaris7/mom_start.c \
	solaris7/pe_input.c

