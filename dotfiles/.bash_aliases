## NAVIGATION, SHORTCUTS AND UTILITY
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ape='cd ~/apegroup'
alias mag='cd ~/mag'

alias whatsmyip='wget -qO- http://ipecho.net/plain ; echo'

#Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#install colordiff package first
alias diff='colordiff'

#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -latrh'
alias rm='rm -i'

alias systemlog='syslog -w'

# Create parent directories on demand
alias mkdir='mkdir -pv'

#print Path in readable format
alias path='echo -e ${PATH//:/\\n}'

#date
alias week='ncal -w'

#SWIFT
alias swift3.0='export PATH=/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2016-05-31-a.xctoolchain/usr/bin:${PATH}'

#JAVA
#alias start_mysql='cd /usr/local/mysql-5.6.12-osx10.7-x86 && ./bin/mysqld_safe&'
alias java1.8='export JAVA_HOME=`/usr/libexec/java_home -v '1.8*'`'
alias java1.7_79='export JAVA_HOME=`/usr/libexec/java_home -v '1.7.0_79*'`'
alias java1.7_80='export JAVA_HOME=`/usr/libexec/java_home -v '1.7.0_80*'`'
alias java_versions="ls /Library/Java/JavaVirtualMachines"

#XCODE
alias derivedData='cd ~/Library/Developer/Xcode/DerivedData'
alias openXcode='open -a /Applications/Xcode.app/'
alias cleanXcode='rm -rf /Users/magnus.eriksson/Library/Developer/Xcode/DerivedData/ && rm -rf Library/Caches/com.apple.dt.Xcode/ && rm -rf /Users/magnus.eriksson/Library/Saved\ Application\ State/com.apple.dt.Xcode.savedState/'

_listXcodeWorkspaceSettings() {
  WORKSPACE=$1
  SCHEME=$2
  xcodebuild -workspace $WORKSPACE -scheme $SCHEME -showBuildSettings
}
alias listWorkspaceSettings='_listXcodeWorkspaceSettings'

_listXcodeProjectSettings() {
  PROJECT=$1
  TARGET=$2
  xcodebuild -project $PROJECT -target $TARGET -showBuildSettings
}
alias listProjectSettings='_listXcodeProjectSettings'

##iOS simulator log

##Looks in the CoreSimulator dir after system.log files
## For each one founds, sorts them by date
## Collect the latest one and stores it in IOS_SIM_PATH
_getPathToMostRecentlyUsedSimulatorLog() {
  IOS_SIM_PATH="$(find /Users/magnus.eriksson/Library/Logs/CoreSimulator -name "system.log" | xargs ls -t | head -n 1)"
  echo $IOS_SIM_PATH
}
_tailSimulatorLog() {
  IOS_SIM_PATH=`_getPathToMostRecentlyUsedSimulatorLog`
  tail -n 200 -f $IOS_SIM_PATH
}
alias simulatorlog='_tailSimulatorLog'

_getPathToMostRecentlyUsedSimulatorApp() {
  ROOT_PATH='/Users/magnus.eriksson/Library/Developer/CoreSimulator/Devices/'
  LAST_USED_SIMULATOR_PATH=$ROOT_PATH"$(ls -t $ROOT_PATH | head -n 1)"
  APP_PATH=$LAST_USED_SIMULATOR_PATH'/data/Containers/Data/Application/'
  LAST_USED_SIMULATOR_APP_PATH=$APP_PATH"$(ls -t $APP_PATH | head -n 1)"
  echo $LAST_USED_SIMULATOR_APP_PATH
}
_navigateToSimulatorData() {
  IOS_DATA_PATH=`_getPathToMostRecentlyUsedSimulatorApp`
  cd $IOS_DATA_PATH
}
alias simulatordata='_navigateToSimulatorData'

_printiOSAppearanceSelectors() {
  cd /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS*.sdk/System/Library/Frameworks/UIKit.framework/Headers
  grep -H UI_APPEARANCE_SELECTOR ./* | sed 's/ __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0) UI_APPEARANCE_SELECTOR;//'
}
alias iOSAppearanceSelectors='_printiOSAppearanceSelectors'
