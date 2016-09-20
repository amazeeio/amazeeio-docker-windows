@ECHO OFF

SET KEY=%~f1

IF NOT DEFINED KEY (
	ECHO %~n0: You need to define the path to the SSH private key as the first parameter >&2
	EXIT /B 1
)

IF NOT EXIST "%KEY%" (
	ECHO %~n0: Given SSH private key "%KEY%" could not be found >&2
	EXIT /B 1
)

docker run --rm -it --volume="%KEY%":/key --volumes-from=amazeeio-ssh-agent amazeeio/ssh-agent windows-key-add /key
