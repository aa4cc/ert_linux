function ert_linux_deploy_and_connect(modelName, targetLoginParamsBlockName)
% *************************************************************************
% Authors:    Martin Gurtner
% Date:      2020/02/28
%
%  Copyright:
%  (c) 2020 Dept. of Control Engineering, FEE, CTU Prague
%
% *************************************************************************

% Change dir to the folder where the simulink model is located
cd(fileparts(which(bdroot(modelName))));

if nargin == 2
    % Run the model on the remote target
    
    % get the login credentials from the TargetLoginParams block
    trgt_ip = get_param(strcat(modelName, strcat('/', targetLoginParamsBlockName)), 'trgt_ip_addr');
    trgt_user = get_param(strcat(modelName, strcat('/', targetLoginParamsBlockName)), 'trgt_username');
    
    % Set the IP address of the target
    set_param(getActiveConfigSet(modelName), 'ExtModeMexArgs', trgt_ip);

    ert_linux_run_model(get_param(modelName,'name'), trgt_ip, trgt_user);
else
    % Run the model locally
    
    % Set the IP address of the target to the localhost
    set_param(getActiveConfigSet(gcs), 'ExtModeMexArgs', '''127.0.0.1''')
    
    ert_linux_run_model(get_param(modelName,'name'));
end

pause(3);

set_param(modelName, 'SimulationCommand', 'connect');


end

