function ert_linux_build(modelName, buildParamsBlockName)
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

configSet = getActiveConfigSet(modelName);
% Set the make command params
set_param( configSet, 'MakeCommand', eval(get_param(strcat(modelName, ['/', buildParamsBlockName]), 'make_command')))

% Build the model
rtwbuild(modelName);
end

