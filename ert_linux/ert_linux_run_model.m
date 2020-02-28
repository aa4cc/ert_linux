function ert_linux_run_model(model_app, target_ip_addr, target_user)
% *************************************************************************
% Authors:    Martin Gurtner
% Date:      2020/02/28
%
%  Copyright:
%  (c) 2020 Dept. of Control Engineering, FEE, CTU Prague
%
% *************************************************************************

if nargin == 1
    % Run locally
    system(sprintf('xterm -e "echo running model %s on the local machine ; ./%s -tf inf -w ; sleep 2" &', model_app, model_app));
elseif nargin == 3
    % Run on the remote target
    system('unset LD_LIBRARY_PATH');
    
    if isfile('target-ssh-key')
         ssh_key_opt = '-i target-ssh-key';
    else
        ssh_key_opt = '';
    end
    
    system(sprintf('xterm -e "scp %s ./%s %s@%s:/tmp ; echo model %s copied to target is run ; ssh %s %s@%s /tmp/%s -tf inf -w ; sleep 2" &', ssh_key_opt, model_app, target_user, target_ip_addr, model_app, ssh_key_opt, target_user, target_ip_addr, model_app));
else
    error('Wrong number of arguments.');
end

end

