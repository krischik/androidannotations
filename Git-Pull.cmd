::#!
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: {{{1 :::::::^::::
:: Copyright © 2013 Martin Krischik
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: $Author$
:: $Revision$
:: $Date$
:: $Id$
:: $HeadURL$
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }}}1 :::::::::::
@ECHO OFF

SETLOCAL
    SET PATH=%PATH%;C:\opt\Git\1.9.4\bin
    SET PATH=%PATH%;C:\opt\Scala\2.11.4\bin

    CALL scala -save %~f0 %*    
ENDLOCAL
    
GOTO :eof
::!#

import scala.sys.process._

("git" :: "pull" :: "https://github.com/excilys/androidannotations.git"		  :: Nil).!
("git" :: "pull" :: "origin" :: "3.0" :: Nil).!

// vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
// vim: set textwidth=0 filetype=scala foldmethod=marker nospell :
