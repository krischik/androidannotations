#!/opt/local/bin/zsh
########################################################### {{{1 ###########
#   Copyright © 2005 … 2013  Martin Krischik
#
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
############################################################################
#  $Author: krischik $
#  $Revision: 4694 $
#  $Date: 2012-03-29 20:47:27 +0200 (Do, 29. Mär 2012) $
#  $Id: Start-Vim.command 4694 2012-03-29 18:47:27Z krischik $
#  $HeadURL: https://uiq3.svn.sourceforge.net/svnroot/uiq3/trunk/Java/Utilities/Start-Vim.command $
########################################################### }}}1 ###########

setopt Err_Exit

local Download_Server="krischik,uiq3@shell.sourceforge.net";

# Android Annotations uses an outdated version of maven.

alias mvn="/opt/local/share/java/maven3/bin/mvn"

pushd "AndroidAnnotations"
    mvn clean
    mvn									    \
	--define repo.id=UIQ3						    \
	--define repo.url=file:///Work/HomePage/uiq3/htdocs/Repository	    \
	deploy
popd

pushd "/Work/HomePage/uiq3/htdocs"
    sshpass -p ${KEY_SF} ssh ${Download_Server} create;

    rsync						\
	--archive					\
	--delete					\
	--verbose					\
	--keep-dirlinks					\
	"Repository"					\
	"krischik,uiq3@web.sourceforge.net:htdocs"

    sshpass -p ${KEY_SF} ssh ${Download_Server} shutdown
popd
# vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
