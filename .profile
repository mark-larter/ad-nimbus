hostname | grep Troppus > /dev/null
if test "$?" == 0
then
    # Custom bash prompt via kirsle.net/wizards/ps1.html
    export PS1="\[$(tput setaf 5)\]\u@\[$(tput setaf 4)\]\h:\[$(tput setaf 2)\]\w:\n\[$(tput setaf 0)\]$ \[$(tput sgr0)\]"
fi

export CLICOLOR=1

alias vbm=VBoxManage
alias gvmi=getvminfo
alias v=vagrant
alias vs='vagrant status'
alias vgs='vagrant global-status'
alias vsh1='vagrant ssh core-01'
alias vsh2='vagrant ssh core-02'
alias vsh3='vagrant ssh core-03'
alias vsh4='vagrant ssh core-04'

alias b2d=boot2docker

alias cdad="cd $VAGRANT_CWD"
alias d=docker
alias dps='docker ps -a'
alias dpsa='docker ps -a'
alias di='docker images'
alias dlogin="docker login -e awsteere@aol.com -u asteere -p 'WannaBe2T*()_'"

alias f=fleetctl
alias flm='fleetctl list-machines -l'
alias flu='fleetctl list-units'
alias fluf='fleetctl list-unit-files'
alias ftunnel='fleetctl --tunnel 10.10.10.10'

function fdestroy() {
    if test "$1" = ""
    then
        svcs=$(fleetctl list-unit-files | awk '{print $1}')
    else
        svcs=$1
    fi

    for i in $svcs
    do
        fleetctl destroy $i
    done
    fluf
}

function getListOfVms() {
    vbm list vms | awk '{print $1}' | sed 's/"//g'
}

function getvminfo() {
    for vm in  `getListOfVms | grep $1`
    do
        echo 
        echo '********************************************************'
        echo
        echo VM: $vm
        vbm showvminfo $vm
    done 
}

function vdestroy() {
    if test "$1" = ""
    then
        vboxes=`v status | grep virtualbox | awk '{print $1}'`
    else
        vboxes=$1
    fi

    for i in $vboxes
    do 
        v destroy --force $i

        machineDir=".vagrant/machines/$i"
        if test -d "$machineDir"
        then
            rm -r "$machineDir"
        fi

    done

    vms=`getListOfVms`
    if test ! "$1" == ""
    then
        vms=`echo $vms | grep $1`
    fi
    for vm in $vms
    do 
        vbm controlvm $vm poweroff 
        vbm unregistervm --delete $vm
    done

    echo Remaining vms
    getListOfVms

    echo vgs
    vgs

    echo vagrant status
    #vagrant status
}

FORWARD_DOCKER_PORTS=true

if test -d "$VAGRANT_CWD"
then
    cdad
fi

# Setting PATH for Python 3.4
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

(which boot2docker) &> /dev/null
if test "$?" == 0
then
    if test ! `boot2docker status` == "running"
    then
	boot2docker up
    fi
    $(boot2docker shellinit)
fi

