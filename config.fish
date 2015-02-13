set PATH $PATH ~/.gem/ruby/2.2.0/bin/

setenv SSH_ENV $HOME/.ssh/environment
 
if [ -f $SSH_ENV ]
    . $SSH_ENV > /dev/null
end  
ps -ef | grep $SSH_AGENT_PID | grep -v grep | grep ssh-agent > /dev/null
if [ $status -eq 0 ]
    test_identities
else 
    start_agent
end  
