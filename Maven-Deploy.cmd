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
    SET PATH=%PATH%;C:\opt\Git\bin
    SET PATH=%PATH%;C:\opt\Scala\2.10.0\bin

    SET NOSER_VERSION=3.1.3
    PUSHD AndroidAnnotations
	CALL scala -classpath c:/Work/Repositories/Local/com/noser/Noser-Scalascript/%NOSER_VERSION%/Noser-Scalascript-%NOSER_VERSION%.jar -save %~f0 %*
    POPD
ENDLOCAL

GOTO :eof
::!#

import scala.sys.process._
import com.noser.Maven._

val Maven_Deploy = System.getenv ("MAVEN_DEPLOY")
val Project_Name = System.getenv ("PROJECT_NAME")
val Maven_Name   = Project_Name +" Maven Repository"

mvn ::: "--activate-profiles" :: "release" :: "install" :: Nil !;
mvn ::: "--activate-profiles" :: "release" :: "site:site" :: Nil !;

mvn :::
    "--define" :: "repo.id="   + Project_Name ::
    "--define" :: "repo.name=" + Maven_Name   ::
    "--define" :: "repo.url="  + Maven_Deploy ::
    "deploy"   :: Nil !;

// vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
// vim: set textwidth=0 filetype=scala foldmethod=marker nospell :
